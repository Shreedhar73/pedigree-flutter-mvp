import 'package:drift/drift.dart';

import 'people.dart';

class Diagnoses extends Table {
  IntColumn get id => integer().autoIncrement()();

  IntColumn get personId => integer()
      .nullable()
      .references(People, #id, onDelete: KeyAction.cascade)();

  TextColumn get name => text().nullable()();
  TextColumn get ontology => text().nullable()();
  TextColumn get ontologyVersion => text().nullable()();
  TextColumn get ontologyId =>
      text().nullable()(); // Core Data attribute name is `id`

  IntColumn get orderIndex => integer().withDefault(const Constant(0))();

  RealColumn get ageAtDx => real().nullable()();
  TextColumn get ageAtDxUnits => text().withDefault(const Constant('Y'))();

  IntColumn get carrier => integer().withDefault(const Constant(0))();
  IntColumn get causeOfDeath => integer().withDefault(const Constant(0))();

  TextColumn get modeOfInheritance => text().nullable()();
}

