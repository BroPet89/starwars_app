import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:starwars_app/common/error/exceptions.dart';
import 'package:starwars_app/common/error/failures.dart';
import 'package:starwars_app/common/platform/network_info.dart';
import 'package:starwars_app/features/starships/data/data_sources/starship_local_data_source.dart';
import 'package:starwars_app/features/starships/data/data_sources/starship_remote_data_source.dart';
import 'package:starwars_app/features/starships/data/models/starship_model.dart';
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
        networkInfo: mockNetworkInfo);
  });

  const tString = "Death Star";
  const tStarshipModel = StarshipModel(name: tString, crew: "342,953");
  const tStarship = tStarshipModel;

  // group("getStarshipByName", () {
  //   test(
  //     'should check if the device is online',
  //     () async {
  //       // arrange
  //       when(mockNetworkInfo.isConnected).thenAnswer((_) async => true);
  //       // act
  //       repository.getStarshipByName(tString);
  //       // assert
  //       verify(mockNetworkInfo.isConnected);
  //     },
  //   );
  // });

  group("device is online", () {
    setUp(() {
      when(mockNetworkInfo.isConnected).thenAnswer((_) async => true);
    });

    test(
      'should return remote data when the call to remote data source is successful',
      () async {
        // arrange
        when(mockRemoteDataSource.getStarshipByName(tString))
            .thenAnswer((_) async => tStarshipModel);
        // act
        final result = await repository.getStarshipByName(tString);
        // assert
        verify(mockRemoteDataSource.getStarshipByName(tString));
        expect(result, equals(const Right(tStarship)));
      },
    );

    test(
      'should cache the data locally when the call to remote data source is successful',
      () async {
        // arrange
        when(mockRemoteDataSource.getStarshipByName(tString))
            .thenAnswer((_) async => tStarshipModel);
        // act
        await repository.getStarshipByName(tString);
        // assert
        verify(mockRemoteDataSource.getStarshipByName(tString));
        verify(mockLocalDataSource.cacheStarship(tStarshipModel));
      },
    );

    test(
      'should return server failure when the call to remote data source is unsuccessful',
      () async {
        // arrange
        when(mockRemoteDataSource.getStarshipByName(tString))
            .thenThrow(ServerException());
        // act
        final result = await repository.getStarshipByName(tString);
        // assert
        verify(mockRemoteDataSource.getStarshipByName(tString));
        verifyZeroInteractions(mockLocalDataSource);
        expect(result, equals(Left(ServerFailure())));
      },
    );
  });

  group("device is offline", () {
    setUp(() {
      when(mockNetworkInfo.isConnected).thenAnswer((_) async => false);
    });
  });
}
