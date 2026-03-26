import '../repositories/pedigree_repository.dart';

class AddPerson {
  const AddPerson(this._repo);

  final PedigreeRepository _repo;

  Future<int> call({
    required int pedigreeId,
    required double centerX,
    required double centerY,
    required String sex,
  }) {
    return _repo.insertPerson(
      pedigreeId: pedigreeId,
      centerX: centerX,
      centerY: centerY,
      sex: sex,
    );
  }
}

