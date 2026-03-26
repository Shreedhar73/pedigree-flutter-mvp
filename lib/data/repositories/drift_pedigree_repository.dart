import 'package:drift/drift.dart';
import 'package:rxdart/rxdart.dart';

import '../../domain/cascade/person_lineage_cascade.dart';
import '../../domain/entities/meta.dart';
import '../../domain/entities/pedigree.dart';
import '../../domain/entities/pedigree_snapshot.dart';
import '../../domain/entities/person.dart';
import '../../domain/entities/person_details_update.dart';
import '../../domain/entities/relationship.dart';
import '../../domain/repositories/pedigree_repository.dart';
import '../db/app_database.dart' as db;

class DriftPedigreeRepository implements PedigreeRepository {
  DriftPedigreeRepository(this._db);

  final db.AppDatabase _db;

  @override
  Stream<List<Pedigree>> watchPedigrees() {
    final q = _db.select(_db.pedigrees)
      ..orderBy([
        (t) => OrderingTerm.desc(t.createdAt),
        (t) => OrderingTerm.desc(t.id),
      ]);

    return q.watch().map(
          (rows) => rows
              .map((r) => Pedigree(id: r.id, createdAt: r.createdAt))
              .toList(growable: false),
        );
  }

  @override
  Future<int> createPedigree({String name = 'Unnamed'}) async {
    return _db.transaction(() async {
      final int pedigreeId = await _db.into(_db.pedigrees).insert(
            db.PedigreesCompanion.insert(
              createdAt: Value(DateTime.now().millisecondsSinceEpoch),
            ),
          );

      await _db.into(_db.meta).insert(
            db.MetaCompanion.insert(pedigreeId: pedigreeId, name: Value(name)),
          );

      return pedigreeId;
    });
  }

  @override
  Stream<PedigreeSnapshot> watchPedigreeSnapshot(int pedigreeId) {
    final metaStream =
        (_db.select(_db.meta)..where((m) => m.pedigreeId.equals(pedigreeId)))
            .watchSingle();

    final peopleStream =
        (_db.select(_db.people)..where((p) => p.pedigreeId.equals(pedigreeId)))
            .watch();

    final relationshipsStream = (_db.select(_db.relationships)
          ..where((r) => r.pedigreeId.equals(pedigreeId)))
        .watch();

    final membersStream = (_db.select(_db.relationshipMembers).join([
      innerJoin(
        _db.relationships,
        _db.relationships.id.equalsExp(_db.relationshipMembers.relationshipId) &
            _db.relationships.pedigreeId.equals(pedigreeId),
      ),
    ])).watch();

    final descendantsStream = (_db.select(_db.relationshipDescendants).join([
      innerJoin(
        _db.relationships,
        _db.relationships.id.equalsExp(
              _db.relationshipDescendants.relationshipId,
            ) &
            _db.relationships.pedigreeId.equals(pedigreeId),
      ),
    ])).watch();

    return Rx.combineLatest5(
      metaStream,
      peopleStream,
      relationshipsStream,
      membersStream,
      descendantsStream,
      (
        metaRow,
        peopleRows,
        relationshipRows,
        memberRows,
        descendantRows,
      ) {
        final Map<int, Map<int, int>> relToRoleToPerson = {};
        for (final row in memberRows) {
          final rm = row.readTable(_db.relationshipMembers);
          relToRoleToPerson.putIfAbsent(rm.relationshipId, () => {});
          relToRoleToPerson[rm.relationshipId]![rm.roleIndex] = rm.personId;
        }

        final List<Relationship> relationships = relationshipRows.map((r) {
          final roles = relToRoleToPerson[r.id] ?? const <int, int>{};
          final a = roles[0];
          final b = roles[1];
          return Relationship(
            id: r.id,
            pedigreeId: r.pedigreeId,
            memberAId: a ?? -1,
            memberBId: b ?? -1,
          );
        }).toList(growable: false);

        final Map<int, List<int>> relChildren = {};
        for (final row in descendantRows) {
          final rd = row.readTable(_db.relationshipDescendants);
          relChildren.putIfAbsent(rd.relationshipId, () => []);
          relChildren[rd.relationshipId]!.add(rd.personId);
        }

        return PedigreeSnapshot(
          pedigreeId: pedigreeId,
          meta: PedigreeMeta(
            id: metaRow.id,
            pedigreeId: metaRow.pedigreeId,
            name: metaRow.name,
            notes: metaRow.notes,
          ),
          people: peopleRows.map(_mapPerson).toList(growable: false),
          relationships: relationships,
          relationshipChildren: relChildren,
        );
      },
    );
  }

  @override
  Future<void> deletePedigree(int pedigreeId) async {
    await (_db.delete(_db.pedigrees)..where((p) => p.id.equals(pedigreeId)))
        .go();
  }

  @override
  Future<void> deletePerson(
    int personId, {
    DescendantsDeletionPolicy descendantsPolicy =
        DescendantsDeletionPolicy.retain,
  }) async {
    final List<int> deletedIds;
    if (descendantsPolicy == DescendantsDeletionPolicy.deleteRecursively) {
      deletedIds = await _postOrderDescendantPersonIds(personId);
    } else {
      deletedIds = [personId];
    }

    await _db.transaction(() async {
      if (descendantsPolicy == DescendantsDeletionPolicy.deleteRecursively) {
        for (final id in deletedIds) {
          await _deletePersonSingle(id);
        }
      } else {
        await _deletePersonSingle(personId);
      }
    });

    notifyPersonsRemovedForCascade(deletedIds);
  }

  /// Deletes unions involving this person, then the person row (diagnoses etc. CASCADE).
  Future<void> _deletePersonSingle(int personId) async {
    final memberRows = await (_db.select(_db.relationshipMembers)
          ..where((m) => m.personId.equals(personId)))
        .get();
    final relIds = memberRows.map((r) => r.relationshipId).toSet();
    for (final rid in relIds) {
      await (_db.delete(_db.relationships)..where((r) => r.id.equals(rid)))
          .go();
    }
    await (_db.delete(_db.people)..where((p) => p.id.equals(personId))).go();
  }

  /// Parent unions first (post-order), then [rootPersonId] last.
  Future<List<int>> _postOrderDescendantPersonIds(int rootPersonId) async {
    final row = await (_db.select(_db.people)
          ..where((p) => p.id.equals(rootPersonId)))
        .getSingleOrNull();
    if (row == null) return [rootPersonId];

    final pedigreeId = row.pedigreeId;
    final relRows = await (_db.select(_db.relationships)
          ..where((r) => r.pedigreeId.equals(pedigreeId)))
        .get();
    if (relRows.isEmpty) return [rootPersonId];

    final relIds = relRows.map((r) => r.id).toList();
    final memberRows = await (_db.select(_db.relationshipMembers)
          ..where((m) => m.relationshipId.isIn(relIds)))
        .get();

    final relToMembers = <int, Map<int, int>>{};
    for (final m in memberRows) {
      relToMembers.putIfAbsent(m.relationshipId, () => {});
      relToMembers[m.relationshipId]![m.roleIndex] = m.personId;
    }

    final descRows = await (_db.select(_db.relationshipDescendants)
          ..where((d) => d.relationshipId.isIn(relIds)))
        .get();

    final relToChildren = <int, List<int>>{};
    for (final d in descRows) {
      relToChildren.putIfAbsent(d.relationshipId, () => []);
      relToChildren[d.relationshipId]!.add(d.personId);
    }

    final ordered = <int>[];
    void visit(int pid) {
      for (final r in relRows) {
        final members = relToMembers[r.id];
        if (members == null) continue;
        final a = members[0];
        final b = members[1];
        if (a != pid && b != pid) continue;
        for (final childId in relToChildren[r.id] ?? const <int>[]) {
          visit(childId);
          ordered.add(childId);
        }
      }
    }

    visit(rootPersonId);
    ordered.add(rootPersonId);
    return ordered;
  }

  @override
  Future<int> insertPerson({
    required int pedigreeId,
    required double centerX,
    required double centerY,
    required String sex,
  }) {
    return _db.into(_db.people).insert(
          db.PeopleCompanion.insert(
            pedigreeId: pedigreeId,
            centerX: Value(centerX),
            centerY: Value(centerY),
            sex: Value(sex),
          ),
        );
  }

  @override
  Future<void> updatePersonPosition({
    required int personId,
    required double centerX,
    required double centerY,
  }) async {
    await (_db.update(_db.people)..where((p) => p.id.equals(personId))).write(
      db.PeopleCompanion(
        centerX: Value(centerX),
        centerY: Value(centerY),
      ),
    );
  }

  @override
  Future<int> createRelationship({
    required int pedigreeId,
    required int memberAId,
    required int memberBId,
  }) async {
    return _db.transaction(() async {
      // MVP: skip the expensive uniqueness check; enforce later.
      final int relId = await _db.into(_db.relationships).insert(
            db.RelationshipsCompanion.insert(pedigreeId: pedigreeId),
          );
      await _db.into(_db.relationshipMembers).insert(
            db.RelationshipMembersCompanion.insert(
              relationshipId: relId,
              personId: memberAId,
              roleIndex: 0,
            ),
          );
      await _db.into(_db.relationshipMembers).insert(
            db.RelationshipMembersCompanion.insert(
              relationshipId: relId,
              personId: memberBId,
              roleIndex: 1,
            ),
          );
          return relId;
    });
  }

  @override
  Future<void> deleteRelationship(int relationshipId) async {
    await (_db.delete(_db.relationships)..where((r) => r.id.equals(relationshipId)))
        .go();
  }

  Person _mapPerson(db.PeopleData p) {
    return Person(
      id: p.id,
      pedigreeId: p.pedigreeId,
      centerX: p.centerX,
      centerY: p.centerY,
      sex: p.sex,
      nodeId: p.nodeId,
      age: p.age,
      ageUnits: p.ageUnits,
      height: p.height,
      gestAge: p.gestAge,
      note: p.note,
      proband: p.proband != 0,
      deceased: p.deceased != 0,
      aw: p.aw != 0,
      stillBirth: p.stillBirth != 0,
      sab: p.sab != 0,
      top: p.top != 0,
      p: p.p != 0,
      donor: p.donor != 0,
      surrogate: p.surrogate != 0,
      adoptedIn: p.adoptedIn != 0,
      adoptedOut: p.adoptedOut != 0,
      causeOfDeath: p.causeOfDeath,
      ageAtDeath: p.ageAtDeath,
      ageAtDeathUnits: p.ageAtDeathUnits,
    );
  }

  @override
  Future<void> updatePersonDetails(PersonDetailsUpdate u) async {
    await (_db.update(_db.people)..where((p) => p.id.equals(u.personId))).write(
          db.PeopleCompanion(
            sex: Value(u.sex),
            nodeId: Value(u.nodeId),
            age: Value(u.age),
            ageUnits: Value(u.ageUnits),
            height: Value(u.height),
            gestAge: Value(u.gestAge),
            note: Value(u.note),
            proband: Value(u.proband ? 1 : 0),
            deceased: Value(u.deceased ? 1 : 0),
            aw: Value(u.aw ? 1 : 0),
            stillBirth: Value(u.stillBirth ? 1 : 0),
            sab: Value(u.sab ? 1 : 0),
            top: Value(u.top ? 1 : 0),
            p: Value(u.p ? 1 : 0),
            donor: Value(u.donor ? 1 : 0),
            surrogate: Value(u.surrogate ? 1 : 0),
            adoptedIn: Value(u.adoptedIn ? 1 : 0),
            adoptedOut: Value(u.adoptedOut ? 1 : 0),
            causeOfDeath: Value(u.causeOfDeath),
            ageAtDeath: Value(u.ageAtDeath),
            ageAtDeathUnits: Value(u.ageAtDeathUnits),
          ),
        );
  }

  @override
  Future<void> addOffspring({
    required int relationshipId,
    required int childPersonId,
  }) async {
    // Persists parent–child linkage immediately (junction + descendancy on people).
    await _db.transaction(() async {
      await _db.into(_db.relationshipDescendants).insert(
            db.RelationshipDescendantsCompanion.insert(
              relationshipId: relationshipId,
              personId: childPersonId,
            ),
            mode: InsertMode.insertOrIgnore,
          );

      await (_db.update(_db.people)..where((p) => p.id.equals(childPersonId)))
          .write(
        db.PeopleCompanion(
          descendancyRelationshipId: Value(relationshipId),
        ),
      );
    });
  }
}

