import '../repositories/pedigree_repository.dart';

class CreatePedigree {
  const CreatePedigree(this._repo);

  final PedigreeRepository _repo;

  Future<int> call({String name = 'Unnamed'}) {
    return _repo.createPedigree(name: name);
  }
}

