import '../entities/pedigree_snapshot.dart';
import '../repositories/pedigree_repository.dart';

class OpenPedigree {
  const OpenPedigree(this._repo);

  final PedigreeRepository _repo;

  Stream<PedigreeSnapshot> call(int pedigreeId) {
    return _repo.watchPedigreeSnapshot(pedigreeId);
  }
}

