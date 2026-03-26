import '../repositories/pedigree_repository.dart';

class CreateRelationship {
  const CreateRelationship(this._repo);

  final PedigreeRepository _repo;

  Future<int> call({
    required int pedigreeId,
    required int memberAId,
    required int memberBId,
  }) {
    return _repo.createRelationship(
      pedigreeId: pedigreeId,
      memberAId: memberAId,
      memberBId: memberBId,
    );
  }
}

