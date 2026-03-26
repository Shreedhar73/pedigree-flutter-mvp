part of 'pedigree_bloc.dart';

sealed class PedigreeEvent extends Equatable {
  const PedigreeEvent();

  @override
  List<Object?> get props => [];
}

final class PedigreesWatchRequested extends PedigreeEvent {
  const PedigreesWatchRequested();
}

final class PedigreesUpdated extends PedigreeEvent {
  const PedigreesUpdated(this.pedigrees);

  final List<Pedigree> pedigrees;

  @override
  List<Object?> get props => [pedigrees];
}

final class PedigreeCreatedRequested extends PedigreeEvent {
  const PedigreeCreatedRequested({this.name = 'Unnamed'});

  final String name;

  @override
  List<Object?> get props => [name];
}

final class PedigreeOpened extends PedigreeEvent {
  const PedigreeOpened(this.pedigreeId);

  final int pedigreeId;

  @override
  List<Object?> get props => [pedigreeId];
}

final class PedigreeDeleteRequested extends PedigreeEvent {
  const PedigreeDeleteRequested(this.pedigreeId);

  final int pedigreeId;

  @override
  List<Object?> get props => [pedigreeId];
}

final class PersonDeleteRequested extends PedigreeEvent {
  const PersonDeleteRequested(
    this.personId, {
    this.descendantsPolicy = DescendantsDeletionPolicy.retain,
  });

  final int personId;
  final DescendantsDeletionPolicy descendantsPolicy;

  @override
  List<Object?> get props => [personId, descendantsPolicy];
}

final class PersonAddedRequested extends PedigreeEvent {
  const PersonAddedRequested({
    required this.centerX,
    required this.centerY,
    this.sex = 'F',
  });

  final double centerX;
  final double centerY;
  final String sex;

  @override
  List<Object?> get props => [centerX, centerY, sex];
}

final class PersonMovedRequested extends PedigreeEvent {
  const PersonMovedRequested({
    required this.personId,
    required this.centerX,
    required this.centerY,
  });

  final int personId;
  final double centerX;
  final double centerY;

  @override
  List<Object?> get props => [personId, centerX, centerY];
}

final class RelationshipCreatedRequested extends PedigreeEvent {
  const RelationshipCreatedRequested({
    required this.memberAId,
    required this.memberBId,
  });

  final int memberAId;
  final int memberBId;

  @override
  List<Object?> get props => [memberAId, memberBId];
}

final class RelationshipDeleteRequested extends PedigreeEvent {
  const RelationshipDeleteRequested(this.relationshipId);

  final int relationshipId;

  @override
  List<Object?> get props => [relationshipId];
}

final class OffspringAddedRequested extends PedigreeEvent {
  const OffspringAddedRequested({
    required this.relationshipId,
    required this.childPersonId,
  });

  final int relationshipId;
  final int childPersonId;

  @override
  List<Object?> get props => [relationshipId, childPersonId];
}

final class PersonDetailsSaved extends PedigreeEvent {
  const PersonDetailsSaved(this.update);

  final PersonDetailsUpdate update;

  @override
  List<Object?> get props => [update];
}

final class _ActiveSnapshotUpdated extends PedigreeEvent {
  const _ActiveSnapshotUpdated(this.snapshot);

  final PedigreeSnapshot snapshot;

  @override
  List<Object?> get props => [snapshot];
}

