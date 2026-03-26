import '../entities/person_details_update.dart';
import '../repositories/pedigree_repository.dart';

class UpdatePersonDetails {
  const UpdatePersonDetails(this._repo);

  final PedigreeRepository _repo;

  Future<void> call(PersonDetailsUpdate u) => _repo.updatePersonDetails(u);
}
