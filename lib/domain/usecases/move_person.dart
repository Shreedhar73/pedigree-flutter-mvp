import '../repositories/pedigree_repository.dart';

class MovePerson {
  const MovePerson(this._repo);

  final PedigreeRepository _repo;

  Future<void> call({
    required int personId,
    required double centerX,
    required double centerY,
  }) {
    return _repo.updatePersonPosition(
      personId: personId,
      centerX: centerX,
      centerY: centerY,
    );
  }
}

