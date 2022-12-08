import 'package:get_it/get_it.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:starwars_app/common/network/network_info.dart';
import 'package:starwars_app/features/starships/data/data_sources/starship_local_data_source.dart';
import 'package:starwars_app/features/starships/data/data_sources/starship_remote_data_source.dart';
import 'package:starwars_app/features/starships/data/repositories/starship_repository_impl.dart';
import 'package:starwars_app/features/starships/domain/repositories/starship_repository.dart';
import 'common/util/input_trimmer.dart';
import 'features/starships/presentation/bloc/starship_bloc.dart';

import 'features/starships/domain/use_cases/get_list_starship.dart';
import 'features/starships/domain/use_cases/get_random_starship.dart';
import 'features/starships/domain/use_cases/get_starship_by_name.dart';
import 'package:http/http.dart' as http;

final serviceLocator = GetIt.instance;

Future<void> init() async {
  //! Features - Starship
  // Bloc
  serviceLocator.registerFactory(
    () => StarshipBloc(
        getStarshipByName: serviceLocator(),
        getRandomStarship: serviceLocator(),
        getListStarship: serviceLocator(),
        inputTrimmer: serviceLocator()),
  );

  // Use cases
  serviceLocator
      .registerLazySingleton(() => GetStarshipByName(serviceLocator()));
  serviceLocator
      .registerLazySingleton(() => GetRandomStarship(serviceLocator()));
  serviceLocator.registerLazySingleton(() => GetListStarship(serviceLocator()));

  // Repository
  serviceLocator
      .registerLazySingleton<StarshipRepository>(() => StarshipRepositoryImpl(
            networkInfo: serviceLocator(),
            starshipLocalDataSource: serviceLocator(),
            starshipRemoteDataSource: serviceLocator(),
          ));

  // Data sources
  serviceLocator.registerLazySingleton<StarshipRemoteDataSource>(
      () => StarshipRemoteDataSourceImpl(client: serviceLocator()));
  serviceLocator.registerLazySingleton<StarshipLocalDataSource>(
      () => StarshipLocalDataSourceImpl(sharedPreferences: serviceLocator()));

  //! Core
  serviceLocator.registerLazySingleton(() => InputTrimmer());
  serviceLocator.registerLazySingleton<NetworkInfo>(
      () => NetworkInfoImpl(serviceLocator()));

  //! External
  final sharedPreferences = await SharedPreferences.getInstance();
  serviceLocator.registerLazySingleton(() => sharedPreferences);
  serviceLocator.registerLazySingleton(() => http.Client);
  serviceLocator.registerLazySingleton(() => InternetConnectionChecker());
}
