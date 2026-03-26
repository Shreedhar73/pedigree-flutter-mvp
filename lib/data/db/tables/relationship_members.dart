import 'package:drift/drift.dart';

import 'people.dart';
import 'relationships.dart';

class RelationshipMembers extends Table {
  IntColumn get relationshipId => integer()
      .references(Relationships, #id, onDelete: KeyAction.cascade)();
  IntColumn get personId =>
      integer().references(People, #id, onDelete: KeyAction.cascade)();

  IntColumn get roleIndex => integer()();

  @override
  Set<Column> get primaryKey => {relationshipId, personId};

  @override
  List<Set<Column>> get uniqueKeys => [
        {relationshipId, roleIndex},
      ];
}

