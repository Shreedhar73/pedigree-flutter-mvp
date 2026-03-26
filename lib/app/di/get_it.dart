import 'package:get_it/get_it.dart';

import '../../data/db/app_database.dart';
import '../../data/repositories/drift_pedigree_repository.dart';
import '../../domain/repositories/pedigree_repository.dart';
import '../../domain/usecases/add_offspring.dart';
import '../../domain/usecases/add_person.dart';
import '../../domain/usecases/create_pedigree.dart';
import '../../domain/usecases/create_relationship.dart';
import '../../domain/usecases/move_person.dart';
import '../../domain/usecases/open_pedigree.dart';
import '../../domain/usecases/update_person_details.dart';
import '../../presentation/bloc/pedigree_bloc.dart';

final getIt = GetIt.instance;

Future<void> configureDependencies() async {
  getIt.registerLazySingleton<AppDatabase>(() => AppDatabase());

  getIt.registerLazySingleton<PedigreeRepository>(
    () => DriftPedigreeRepository(getIt<AppDatabase>()),
  );

  getIt.registerFactory(() => CreatePedigree(getIt<PedigreeRepository>()));
  getIt.registerFactory(() => OpenPedigree(getIt<PedigreeRepository>()));
  getIt.registerFactory(() => AddPerson(getIt<PedigreeRepository>()));
  getIt.registerFactory(() => MovePerson(getIt<PedigreeRepository>()));
  getIt.registerFactory(() => CreateRelationship(getIt<PedigreeRepository>()));
  getIt.registerFactory(() => AddOffspring(getIt<PedigreeRepository>()));
  getIt.registerFactory(() => UpdatePersonDetails(getIt<PedigreeRepository>()));

  getIt.registerFactory(
    () => PedigreeBloc(
      createPedigree: getIt<CreatePedigree>(),
      openPedigree: getIt<OpenPedigree>(),
      addPerson: getIt<AddPerson>(),
      movePerson: getIt<MovePerson>(),
      createRelationship: getIt<CreateRelationship>(),
      addOffspring: getIt<AddOffspring>(),
      updatePersonDetails: getIt<UpdatePersonDetails>(),
      repo: getIt<PedigreeRepository>(),
    ),
  );
}
