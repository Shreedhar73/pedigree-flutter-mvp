import '../repositories/pedigree_repository.dart';

class AddOffspring {
  const AddOffspring(this._repo);

  final PedigreeRepository _repo;

  Future<void> call({
    required int relationshipId,
    required int childPersonId,
  }) {
    return _repo.addOffspring(
      relationshipId: relationshipId,
      childPersonId: childPersonId,
    );
  }
}

