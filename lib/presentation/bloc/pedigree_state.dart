part of 'pedigree_bloc.dart';

class _Unset {
  const _Unset();
}

const _unset = _Unset();

class PedigreeState extends Equatable {
  const PedigreeState({
    this.pedigrees = const [],
    this.activePedigreeId,
    this.activeSnapshot,
  });

  final List<Pedigree> pedigrees;
  final int? activePedigreeId;
  final PedigreeSnapshot? activeSnapshot;

  PedigreeState copyWith({
    List<Pedigree>? pedigrees,
    Object? activePedigreeId = _unset,
    Object? activeSnapshot = _unset,
  }) {
    return PedigreeState(
      pedigrees: pedigrees ?? this.pedigrees,
      activePedigreeId: activePedigreeId == _unset
          ? this.activePedigreeId
          : activePedigreeId as int?,
      activeSnapshot: activeSnapshot == _unset
          ? this.activeSnapshot
          : activeSnapshot as PedigreeSnapshot?,
    );
  }

  @override
  List<Object?> get props => [
        pedigrees,
        activePedigreeId,
        activeSnapshot,
      ];
}

