import 'dart:async';

import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../domain/cascade/person_lineage_cascade.dart';
import '../../domain/entities/pedigree.dart';
import '../../domain/entities/pedigree_snapshot.dart';
import '../../domain/entities/person_details_update.dart';
import '../../domain/repositories/pedigree_repository.dart';
import '../../domain/usecases/add_offspring.dart';
import '../../domain/usecases/add_person.dart';
import '../../domain/usecases/create_pedigree.dart';
import '../../domain/usecases/create_relationship.dart';
import '../../domain/usecases/move_person.dart';
import '../../domain/usecases/open_pedigree.dart';
import '../../domain/usecases/update_person_details.dart';

part 'pedigree_event.dart';
part 'pedigree_state.dart';

class PedigreeBloc extends Bloc<PedigreeEvent, PedigreeState> {
  PedigreeBloc({
    required CreatePedigree createPedigree,
    required OpenPedigree openPedigree,
    required AddPerson addPerson,
    required MovePerson movePerson,
    required CreateRelationship createRelationship,
    required AddOffspring addOffspring,
    required UpdatePersonDetails updatePersonDetails,
    required PedigreeRepository repo,
  })  : _createPedigree = createPedigree,
        _openPedigree = openPedigree,
        _addPerson = addPerson,
        _movePerson = movePerson,
        _createRelationship = createRelationship,
        _addOffspring = addOffspring,
        _updatePersonDetails = updatePersonDetails,
        _repo = repo,
        super(const PedigreeState()) {
    on<PedigreesWatchRequested>(_onPedigreesWatchRequested);
    on<PedigreesUpdated>(_onPedigreesUpdated);
    on<PedigreeCreatedRequested>(_onPedigreeCreatedRequested);
    on<PedigreeOpened>(_onPedigreeOpened);
    on<PedigreeDeleteRequested>(_onPedigreeDeleteRequested);
    on<PersonDeleteRequested>(_onPersonDeleteRequested);
    on<_ActiveSnapshotUpdated>(_onActiveSnapshotUpdated);
    on<PersonAddedRequested>(_onPersonAddedRequested);
    on<PersonMovedRequested>(_onPersonMovedRequested);
    on<RelationshipCreatedRequested>(_onRelationshipCreatedRequested);
    on<RelationshipDeleteRequested>(_onRelationshipDeleteRequested);
    on<OffspringAddedRequested>(_onOffspringAddedRequested);
    on<PersonDetailsSaved>(_onPersonDetailsSaved);
  }

  final CreatePedigree _createPedigree;
  final OpenPedigree _openPedigree;
  final AddPerson _addPerson;
  final MovePerson _movePerson;
  final CreateRelationship _createRelationship;
  final AddOffspring _addOffspring;
  final UpdatePersonDetails _updatePersonDetails;
  final PedigreeRepository _repo;

  StreamSubscription<List<Pedigree>>? _pedigreesSub;
  StreamSubscription<PedigreeSnapshot>? _activeSnapSub;

  Future<void> _onPedigreesWatchRequested(
    PedigreesWatchRequested event,
    Emitter<PedigreeState> emit,
  ) async {
    await _pedigreesSub?.cancel();
    _pedigreesSub = _repo.watchPedigrees().listen((rows) {
      add(PedigreesUpdated(rows));
    });
  }

  void _onPedigreesUpdated(
    PedigreesUpdated event,
    Emitter<PedigreeState> emit,
  ) {
    emit(state.copyWith(pedigrees: event.pedigrees));
  }

  Future<void> _onPedigreeCreatedRequested(
    PedigreeCreatedRequested event,
    Emitter<PedigreeState> emit,
  ) async {
    final id = await _createPedigree(name: event.name);
    add(PedigreeOpened(id));
  }

  Future<void> _onPedigreeOpened(
    PedigreeOpened event,
    Emitter<PedigreeState> emit,
  ) async {
    emit(state.copyWith(activePedigreeId: event.pedigreeId, activeSnapshot: null));

    await _activeSnapSub?.cancel();
    _activeSnapSub = _openPedigree(event.pedigreeId).listen((snap) {
      add(_ActiveSnapshotUpdated(snap));
    });
  }

  Future<void> _onPedigreeDeleteRequested(
    PedigreeDeleteRequested event,
    Emitter<PedigreeState> emit,
  ) async {
    final deletedId = event.pedigreeId;
    if (state.activePedigreeId == deletedId) {
      await _activeSnapSub?.cancel();
      _activeSnapSub = null;
      emit(state.copyWith(
        activePedigreeId: null,
        activeSnapshot: null,
      ));
    }
    await _repo.deletePedigree(deletedId);
  }

  Future<void> _onPersonDeleteRequested(
    PersonDeleteRequested event,
    Emitter<PedigreeState> emit,
  ) async {
    await _repo.deletePerson(
      event.personId,
      descendantsPolicy: event.descendantsPolicy,
    );
  }

  void _onActiveSnapshotUpdated(
    _ActiveSnapshotUpdated event,
    Emitter<PedigreeState> emit,
  ) {
    emit(state.copyWith(activeSnapshot: event.snapshot));
  }

  Future<void> _onPersonAddedRequested(
    PersonAddedRequested event,
    Emitter<PedigreeState> emit,
  ) async {
    final pid = state.activePedigreeId;
    if (pid == null) return;
    await _addPerson(
      pedigreeId: pid,
      centerX: event.centerX,
      centerY: event.centerY,
      sex: event.sex,
    );
  }

  Future<void> _onPersonMovedRequested(
    PersonMovedRequested event,
    Emitter<PedigreeState> emit,
  ) async {
    await _movePerson(
      personId: event.personId,
      centerX: event.centerX,
      centerY: event.centerY,
    );
  }

  Future<void> _onRelationshipCreatedRequested(
    RelationshipCreatedRequested event,
    Emitter<PedigreeState> emit,
  ) async {
    final pid = state.activePedigreeId;
    if (pid == null) return;
    await _createRelationship(
      pedigreeId: pid,
      memberAId: event.memberAId,
      memberBId: event.memberBId,
    );
  }

  Future<void> _onRelationshipDeleteRequested(
    RelationshipDeleteRequested event,
    Emitter<PedigreeState> emit,
  ) async {
    await _repo.deleteRelationship(event.relationshipId);
  }

  Future<void> _onOffspringAddedRequested(
    OffspringAddedRequested event,
    Emitter<PedigreeState> emit,
  ) async {
    await _addOffspring(
      relationshipId: event.relationshipId,
      childPersonId: event.childPersonId,
    );
  }

  Future<void> _onPersonDetailsSaved(
    PersonDetailsSaved event,
    Emitter<PedigreeState> emit,
  ) async {
    await _updatePersonDetails(event.update);
  }

  @override
  Future<void> close() async {
    await _pedigreesSub?.cancel();
    await _activeSnapSub?.cancel();
    return super.close();
  }
}

