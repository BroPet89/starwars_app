import 'package:get_it/get_it.dart';
import 'common/util/input_trimmer.dart';
import 'features/starships/presentation/bloc/starship_bloc.dart';

import 'features/starships/domain/use_cases/get_list_starship.dart';
import 'features/starships/domain/use_cases/get_random_starship.dart';
import 'features/starships/domain/use_cases/get_starship_by_name.dart';

final serviceLocator = GetIt.instance;

void init() {
  //! Features - Starship
  // Bloc
  serviceLocator.registerFactory(() => StarshipBloc(
      getStarshipByName: serviceLocator(),
      getRandomStarship: serviceLocator(),
      getListStarship: serviceLocator(),
      inputTrimmer: serviceLocator()));

  // Use cases
  serviceLocator.registerLazySingleton(() => GetStarshipByName(serviceLocator()));
  serviceLocator.registerLazySingleton(() => GetRandomStarship(serviceLocator()));
  serviceLocator.registerLazySingleton(() => GetListStarship(serviceLocator()));
  
  //! Core
  serviceLocator.registerLazySingleton(() => InputTrimmer());
  //! External
}
