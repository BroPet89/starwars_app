import 'package:get_it/get_it.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'common/util/json_parser.dart';
import 'common/network/network_info.dart';
import 'features/starships/data/data_sources/starship_local_data_source.dart';
import 'features/starships/data/data_sources/starship_remote_data_source.dart';
import 'features/starships/data/repositories/starship_repository_impl.dart';
import 'features/starships/domain/repositories/starship_repository.dart';
import 'common/util/input_trimmer.dart';
import 'features/starships/presentation/bloc/starship_bloc.dart';

import 'features/starships/domain/use_cases/get_list_starship.dart';
import 'features/starships/domain/use_cases/get_random_starship.dart';
import 'features/starships/domain/use_cases/get_starship_by_name.dart';
import 'package:http/http.dart' as http;

final get = GetIt.instance;

Future<void> init() async {
  //! Features - Starship
  // Bloc
  get.registerFactory(
    () => StarshipBloc(
        getStarshipByName: get(),
        getRandomStarship: get(),
        getListStarship: get(),
        inputTrimmer: get()),
  );

  // Use cases
  get.registerLazySingleton(() => GetStarshipByName(get()));
  get.registerLazySingleton(() => GetRandomStarship(get()));
  get.registerLazySingleton(() => GetListStarship(get()));

  // Repository
  get.registerLazySingleton<StarshipRepository>(() => StarshipRepositoryImpl(
        networkInfo: get(),
        jsonParser: get(),
        starshipLocalDataSource: get(),
        starshipRemoteDataSource: get(),
      ));

  // Data sources
  get.registerLazySingleton<StarshipRemoteDataSource>(
      () => StarshipRemoteDataSourceImpl(client: get()));
  get.registerLazySingleton<StarshipLocalDataSource>(
      () => StarshipLocalDataSourceImpl(sharedPreferences: get()));

  //! Core
  get.registerLazySingleton(() => InputTrimmer());
  get.registerLazySingleton<NetworkInfo>(() => NetworkInfoImpl(get()));

  //! External
  final sharedPreferences = await SharedPreferences.getInstance();
  get.registerLazySingleton(() => sharedPreferences);
  get.registerLazySingleton(() => http.Client());
  get.registerLazySingleton(() => JsonParser());
  get.registerLazySingleton(() => InternetConnectionChecker());
}
