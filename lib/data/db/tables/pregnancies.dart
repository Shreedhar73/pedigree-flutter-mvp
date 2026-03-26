import 'package:drift/drift.dart';

class Pregnancies extends Table {
  IntColumn get id => integer().autoIncrement()();

  IntColumn get dateMs => integer().nullable()();
}

