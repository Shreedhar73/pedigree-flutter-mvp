import '../cascade/person_lineage_cascade.dart';
import '../entities/pedigree.dart';
import '../entities/pedigree_snapshot.dart';
import '../entities/person_details_update.dart';

abstract class PedigreeRepository {
  Stream<List<Pedigree>> watchPedigrees();

  Future<int> createPedigree({String name = 'Unnamed'});

  Stream<PedigreeSnapshot> watchPedigreeSnapshot(int pedigreeId);

  Future<void> deletePedigree(int pedigreeId);

  /// Removes the person and cleans up partner relationships they belonged to.
  ///
  /// [descendantsPolicy] controls whether descendant persons are deleted too;
  /// see [DescendantsDeletionPolicy].
  Future<void> deletePerson(
    int personId, {
    DescendantsDeletionPolicy descendantsPolicy =
        DescendantsDeletionPolicy.retain,
  });

  Future<int> insertPerson({
    required int pedigreeId,
    required double centerX,
    required double centerY,
    required String sex,
  });

  Future<void> updatePersonPosition({
    required int personId,
    required double centerX,
    required double centerY,
  });

  Future<void> updatePersonDetails(PersonDetailsUpdate update);

  Future<int> createRelationship({
    required int pedigreeId,
    required int memberAId,
    required int memberBId,
  });

  Future<void> deleteRelationship(int relationshipId);

  Future<void> addOffspring({
    required int relationshipId,
    required int childPersonId,
  });
}

