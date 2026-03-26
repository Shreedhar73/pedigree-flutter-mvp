import 'package:drift/drift.dart';

class Pedigrees extends Table {
  IntColumn get id => integer().autoIncrement()();

  IntColumn get createdAt =>
      integer().nullable()(); // unix ms, optional but useful
}

