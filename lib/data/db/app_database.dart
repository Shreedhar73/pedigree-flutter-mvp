import 'dart:io';

import 'package:drift/drift.dart';
import 'package:drift/native.dart';
import 'package:path/path.dart' as p;
import 'package:path_provider/path_provider.dart';

import 'tables/diagnoses.dart';
import 'tables/meta.dart';
import 'tables/nlets.dart';
import 'tables/pedigrees.dart';
import 'tables/people.dart';
import 'tables/pregnancies.dart';
import 'tables/relationship_descendants.dart';
import 'tables/relationship_members.dart';
import 'tables/relationships.dart';

part 'app_database.g.dart';

@DriftDatabase(
  tables: [
    Pedigrees,
    Meta,
    People,
    Relationships,
    RelationshipMembers,
    RelationshipDescendants,
    Diagnoses,
    Pregnancies,
    Nlets,
  ],
)
class AppDatabase extends _$AppDatabase {
  AppDatabase() : super(_openConnection());

  @override
  int get schemaVersion => 1;
}

LazyDatabase _openConnection() {
  return LazyDatabase(() async {
    final Directory dir = await getApplicationDocumentsDirectory();
    final File file = File(p.join(dir.path, 'proband.sqlite'));
    return NativeDatabase.createInBackground(file);
  });
}
