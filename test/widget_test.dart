// This is a basic Flutter widget test.
//
// To perform an interaction with a widget in your test, use the WidgetTester
// utility in the flutter_test package. For example, you can send tap and scroll
// gestures. You can also use WidgetTester to find child widgets in the widget
// tree, read text, and verify that the values of widget properties are correct.

import 'package:flutter_test/flutter_test.dart';

import 'package:proband_flutter/main.dart';
import 'package:proband_flutter/presentation/bloc/pedigree_bloc.dart';
import 'package:proband_flutter/domain/repositories/pedigree_repository.dart';
import 'package:proband_flutter/domain/usecases/add_offspring.dart';
import 'package:proband_flutter/domain/usecases/add_person.dart';
import 'package:proband_flutter/domain/usecases/create_pedigree.dart';
import 'package:proband_flutter/domain/usecases/create_relationship.dart';
import 'package:proband_flutter/domain/usecases/move_person.dart';
import 'package:proband_flutter/domain/usecases/open_pedigree.dart';
import 'package:proband_flutter/domain/usecases/update_person_details.dart';
import 'package:proband_flutter/domain/entities/person_details_update.dart';
import 'package:proband_flutter/domain/entities/pedigree.dart';
import 'package:proband_flutter/domain/cascade/person_lineage_cascade.dart';
import 'package:proband_flutter/domain/entities/pedigree_snapshot.dart';

void main() {
  testWidgets('Counter increments smoke test', (WidgetTester tester) async {
    final repo = _FakeRepo();
    final bloc = PedigreeBloc(
      createPedigree: CreatePedigree(repo),
      openPedigree: OpenPedigree(repo),
      addPerson: AddPerson(repo),
      movePerson: MovePerson(repo),
      createRelationship: CreateRelationship(repo),
      addOffspring: AddOffspring(repo),
      updatePersonDetails: UpdatePersonDetails(repo),
      repo: repo,
    );

    // Build our app and trigger a frame.
    await tester.pumpWidget(ProbandApp(pedigreeBloc: bloc));
    await tester.pump();

    // Verify that our counter starts at 0.
    expect(find.text('Pedigrees'), findsOneWidget);
  });
}

class _FakeRepo implements PedigreeRepository {
  @override
  Stream<List<Pedigree>> watchPedigrees() => Stream.value(const []);

  @override
  Future<int> createPedigree({String name = 'Unnamed'}) => Future.value(1);

  @override
  Stream<PedigreeSnapshot> watchPedigreeSnapshot(int pedigreeId) =>
      const Stream.empty();

  @override
  Future<void> deletePedigree(int pedigreeId) => Future.value();

  @override
  Future<int> insertPerson({
    required int pedigreeId,
    required double centerX,
    required double centerY,
    required String sex,
  }) =>
      Future.value(1);

  @override
  Future<void> updatePersonPosition({
    required int personId,
    required double centerX,
    required double centerY,
  }) =>
      Future.value();

  @override
  Future<int> createRelationship({
    required int pedigreeId,
    required int memberAId,
    required int memberBId,
  }) =>
      Future.value(1);

  @override
  Future<void> addOffspring({
    required int relationshipId,
    required int childPersonId,
  }) =>
      Future.value();

  @override
  Future<void> updatePersonDetails(PersonDetailsUpdate update) =>
      Future.value();

  @override
  Future<void> deletePerson(
    int personId, {
    DescendantsDeletionPolicy descendantsPolicy =
        DescendantsDeletionPolicy.retain,
  }) =>
      Future.value();

  @override
  Future<void> deleteRelationship(int relationshipId) => Future.value();
}
