import 'package:drift/drift.dart';

import 'diagnoses.dart';
import 'pedigrees.dart';

class Meta extends Table {
  IntColumn get id => integer().autoIncrement()();

  IntColumn get pedigreeId => integer()
      .unique()
      .references(Pedigrees, #id, onDelete: KeyAction.cascade)();

  TextColumn get name => text().withDefault(const Constant('Unnamed'))();
  TextColumn get notes => text().nullable()();
  TextColumn get version => text().nullable()();

  IntColumn get moons => integer().withDefault(const Constant(0))();
  IntColumn get nextId => integer().withDefault(const Constant(1))();

  @ReferenceName('metaAffected1')
  IntColumn get affected1DiagnosisId => integer()
      .nullable()
      .references(Diagnoses, #id, onDelete: KeyAction.setNull)();

  @ReferenceName('metaAffected2')
  IntColumn get affected2DiagnosisId => integer()
      .nullable()
      .references(Diagnoses, #id, onDelete: KeyAction.setNull)();

  @ReferenceName('metaAffected3')
  IntColumn get affected3DiagnosisId => integer()
      .nullable()
      .references(Diagnoses, #id, onDelete: KeyAction.setNull)();

  @ReferenceName('metaAffected4')
  IntColumn get affected4DiagnosisId => integer()
      .nullable()
      .references(Diagnoses, #id, onDelete: KeyAction.setNull)();
}

