import 'package:drift/drift.dart';

import 'pedigrees.dart';

class Relationships extends Table {
  IntColumn get id => integer().autoIncrement()();

  IntColumn get pedigreeId => integer()
      .references(Pedigrees, #id, onDelete: KeyAction.cascade)();

  IntColumn get active => integer().withDefault(const Constant(1))();
  IntColumn get consanguinous => integer().withDefault(const Constant(0))();
  TextColumn get consanguinityDegree => text().nullable()();
  IntColumn get noChildrenByChoice => integer().withDefault(const Constant(0))();
  IntColumn get noChildrenInfertility =>
      integer().withDefault(const Constant(0))();
}

