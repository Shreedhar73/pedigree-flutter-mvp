import 'package:drift/drift.dart';

import 'nlets.dart';
import 'pedigrees.dart';
import 'pregnancies.dart';
import 'relationships.dart';

class People extends Table {
  IntColumn get id => integer().autoIncrement()();

  IntColumn get pedigreeId => integer()
      .references(Pedigrees, #id, onDelete: KeyAction.cascade)();

  IntColumn get nodeId => integer().withDefault(const Constant(0))();
  RealColumn get centerX => real().withDefault(const Constant(0))();
  RealColumn get centerY => real().withDefault(const Constant(0))();

  TextColumn get sex => text().nullable()(); // 'M'|'F'|'U'
  TextColumn get quantity => text().withDefault(const Constant('1'))();

  TextColumn get age => text().nullable()();
  TextColumn get ageUnits => text().nullable()();
  TextColumn get height => text().nullable()();
  TextColumn get gestAge => text().nullable()();
  TextColumn get note => text().nullable()();

  IntColumn get proband => integer().withDefault(const Constant(0))();
  IntColumn get deceased => integer().withDefault(const Constant(0))();
  IntColumn get aw => integer().withDefault(const Constant(0))();
  IntColumn get stillBirth => integer().withDefault(const Constant(0))();
  IntColumn get sab => integer().withDefault(const Constant(0))();
  IntColumn get top => integer().withDefault(const Constant(0))();
  IntColumn get p => integer().withDefault(const Constant(0))();
  IntColumn get donor => integer().withDefault(const Constant(0))();
  IntColumn get surrogate => integer().withDefault(const Constant(0))();
  IntColumn get adoptedIn => integer().withDefault(const Constant(0))();
  IntColumn get adoptedOut => integer().withDefault(const Constant(0))();
  IntColumn get noChildrenByChoice => integer().withDefault(const Constant(0))();
  IntColumn get noChildrenInfertility =>
      integer().withDefault(const Constant(0))();
  TextColumn get infertilityReason => text().nullable()();
  IntColumn get carriedBySurrogate => integer().withDefault(const Constant(0))();

  TextColumn get ageAtDeath => text().nullable()();
  TextColumn get ageAtDeathUnits => text().nullable()();
  TextColumn get causeOfDeath => text().nullable()();
  TextColumn get causeOfDeathOntology => text().nullable()();
  TextColumn get causeOfDeathOntologyId => text().nullable()();
  TextColumn get causeOfDeathOntologyVersion => text().nullable()();

  IntColumn get affected1 => integer().withDefault(const Constant(0))();
  IntColumn get affected2 => integer().withDefault(const Constant(0))();
  IntColumn get affected3 => integer().withDefault(const Constant(0))();
  IntColumn get affected4 => integer().withDefault(const Constant(0))();

  RealColumn get affected1DxAge => real().nullable()();
  RealColumn get affected2DxAge => real().nullable()();
  RealColumn get affected3DxAge => real().nullable()();
  RealColumn get affected4DxAge => real().nullable()();

  TextColumn get affected1DxAgeUnits =>
      text().withDefault(const Constant('Y'))();
  TextColumn get affected2DxAgeUnits =>
      text().withDefault(const Constant('Y'))();
  TextColumn get affected3DxAgeUnits =>
      text().withDefault(const Constant('Y'))();
  TextColumn get affected4DxAgeUnits =>
      text().withDefault(const Constant('Y'))();

  IntColumn get descendancyRelationshipId => integer()
      .nullable()
      .references(Relationships, #id, onDelete: KeyAction.setNull)();

  IntColumn get explicitBioMotherId => integer()
      .nullable()
      .references(People, #id, onDelete: KeyAction.setNull)();
  IntColumn get explicitBioFatherId => integer()
      .nullable()
      .references(People, #id, onDelete: KeyAction.setNull)();
  IntColumn get eggDonorId => integer()
      .nullable()
      .references(People, #id, onDelete: KeyAction.setNull)();
  IntColumn get spermDonorId => integer()
      .nullable()
      .references(People, #id, onDelete: KeyAction.setNull)();
  IntColumn get carriedById => integer()
      .nullable()
      .references(People, #id, onDelete: KeyAction.setNull)();

  IntColumn get pregnancyId => integer()
      .nullable()
      .references(Pregnancies, #id, onDelete: KeyAction.setNull)();
  IntColumn get nletsId =>
      integer().nullable().references(Nlets, #id, onDelete: KeyAction.setNull)();
}

