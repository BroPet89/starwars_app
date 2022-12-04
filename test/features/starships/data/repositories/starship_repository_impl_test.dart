import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:starwars_app/common/platform/network_info.dart';
import 'package:starwars_app/features/starships/data/data_sources/starship_local_data_source.dart';
import 'package:starwars_app/features/starships/data/data_sources/starship_remote_data_source.dart';
import 'package:starwars_app/features/starships/data/repositories/starship_repository_impl.dart';

import 'starship_repository_impl_test.mocks.dart';

@GenerateMocks([StarshipRemoteDataSource, StarshipLocalDataSource, NetworkInfo])
void main() {
  late StarshipRepositoryImpl repository;
  late MockStarshipRemoteDataSource mockRemoteDataSource;
  late MockStarshipLocalDataSource mockLocalDataSource;
  late MockNetworkInfo mockNetworkInfo;

  setUp(() {
    mockRemoteDataSource = MockStarshipRemoteDataSource();
    mockLocalDataSource = MockStarshipLocalDataSource();
    mockNetworkInfo = MockNetworkInfo();
    repository = StarshipRepositoryImpl(
      starshipRemoteDataSource: mockRemoteDataSource,
      starshipLocalDataSource: mockLocalDataSource,
      networkInfo: mockNetworkInfo
    );
  });
}
