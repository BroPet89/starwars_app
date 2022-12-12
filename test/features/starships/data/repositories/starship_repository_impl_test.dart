import 'dart:convert';

import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:starwars_app/common/error/exceptions.dart';
import 'package:starwars_app/common/error/failures.dart';
import 'package:starwars_app/common/network/network_info.dart';
import 'package:starwars_app/common/util/json_parser.dart';
import 'package:starwars_app/features/starships/data/data_sources/starship_local_data_source.dart';
import 'package:starwars_app/features/starships/data/data_sources/starship_remote_data_source.dart';
import 'package:starwars_app/features/starships/data/models/starship_model.dart';
import 'package:starwars_app/features/starships/data/repositories/starship_repository_impl.dart';
import 'package:starwars_app/features/starships/domain/entities/starship.dart';

import '../../../../fixtures/fixture_reader.dart';
import 'starship_repository_impl_test.mocks.dart';

@GenerateMocks([
  StarshipRemoteDataSource,
  StarshipLocalDataSource,
  NetworkInfo,
  JsonParser
])
void main() {
  late StarshipRepositoryImpl repository;
  late MockStarshipRemoteDataSource mockRemoteDataSource;
  late MockStarshipLocalDataSource mockLocalDataSource;
  late MockNetworkInfo mockNetworkInfo;
  late MockJsonParser mockJsonParser;

  setUp(() {
    mockRemoteDataSource = MockStarshipRemoteDataSource();
    mockLocalDataSource = MockStarshipLocalDataSource();
    mockNetworkInfo = MockNetworkInfo();
    mockJsonParser = MockJsonParser();
    repository = StarshipRepositoryImpl(
        starshipRemoteDataSource: mockRemoteDataSource,
        starshipLocalDataSource: mockLocalDataSource,
        jsonParser: mockJsonParser,
        networkInfo: mockNetworkInfo);
  });

  final List<Map<String, dynamic>> dynamicList = json.decode(fixture("starships.json"));
  final List<StarshipModel> shipModels =
      List<StarshipModel>.from(json.decode(fixture("starships.json")));
      

  void runTestsOnline(Function body) {
    group("device is online", () {
      setUp(() {
        when(mockNetworkInfo.isConnected).thenAnswer((_) async => true);
      });
      body();
    });
  }

  void runTestsOffline(Function body) {
    group("device is offline", () {
      setUp(() {
        when(mockNetworkInfo.isConnected).thenAnswer((_) async => false);
      });
      body();
    });
  }

  void setUpJsonParserSuccess() =>
      when(mockJsonParser.getResultsFromresponse(any))
          .thenReturn(Right(dynamicList));

  const tString = "Death Star";
  const tStarshipModel = StarshipModel(name: tString, crew: "342,953");
  const Starship tStarship = tStarshipModel;

  group("getStarshipByName", () {
    test(
      'should check if the device is online',
      () async {
        // arrange
        when(mockNetworkInfo.isConnected).thenAnswer((_) async => true);
        when(mockRemoteDataSource.getStarshipByName(tString))
            .thenAnswer((_) async => tStarshipModel);
        // act
        repository.getStarshipByName(tString);
        // assert
        verify(mockNetworkInfo.isConnected);
      },
    );

    runTestsOnline(() {
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

    runTestsOffline(() {
      test(
        'should return last locally cached starship when the cache data is present',
        () async {
          // arrange
          when(mockLocalDataSource.getLastStarshipModel())
              .thenAnswer((_) async => tStarshipModel);
          // act
          final result = await repository.getStarshipByName(tString);
          // assert
          verifyZeroInteractions(mockRemoteDataSource);
          verify(mockLocalDataSource.getLastStarshipModel());
          expect(result, equals(const Right(tStarship)));
        },
      );

      test(
        'should return CacheFailure when there is no cached data present',
        () async {
          // arrange
          when(mockLocalDataSource.getLastStarshipModel())
              .thenThrow(CacheException());
          // act
          final result = await repository.getStarshipByName(tString);
          // assert
          verifyZeroInteractions(mockRemoteDataSource);
          verify(mockLocalDataSource.getLastStarshipModel());
          expect(result, equals(Left(CacheFailure())));
        },
      );
    });
  });

  group("getRandomStarship", () {
    const tStarshipModel = StarshipModel(name: "CR90 corvette", crew: "30");
    const Starship tStarship = tStarshipModel;
    test(
      'should check if the device is online',
      () async {
        // arrange
        when(mockNetworkInfo.isConnected).thenAnswer((_) async => true);
        when(mockRemoteDataSource.getRandomStarship())
            .thenAnswer((_) async => tStarshipModel);
        // act
        repository.getRandomStarship();
        // assert
        verify(mockNetworkInfo.isConnected);
      },
    );

    runTestsOnline(() {
      test(
        'should return remote data when the call to remote data source is successful',
        () async {
          // arrange
          when(mockRemoteDataSource.getRandomStarship())
              .thenAnswer((_) async => tStarshipModel);
          // act
          final result = await repository.getRandomStarship();
          // assert
          verify(mockRemoteDataSource.getRandomStarship());
          expect(result, equals(const Right(tStarship)));
        },
      );

      test(
        'should cache the data locally when the call to remote data source is successful',
        () async {
          // arrange
          when(mockRemoteDataSource.getRandomStarship())
              .thenAnswer((_) async => tStarshipModel);
          // act
          await repository.getRandomStarship();
          // assert
          verify(mockRemoteDataSource.getRandomStarship());
          verify(mockLocalDataSource.cacheStarship(tStarshipModel));
        },
      );

      test(
        'should return server failure when the call to remote data source is unsuccessful',
        () async {
          // arrange
          when(mockRemoteDataSource.getRandomStarship())
              .thenThrow(ServerException());
          // act
          final result = await repository.getRandomStarship();
          // assert
          verify(mockRemoteDataSource.getRandomStarship());
          verifyZeroInteractions(mockLocalDataSource);
          expect(result, equals(Left(ServerFailure())));
        },
      );
    });

    runTestsOffline(() {
      test(
        'should return last locally cached starship when the cache data is present',
        () async {
          // arrange
          when(mockLocalDataSource.getLastStarshipModel())
              .thenAnswer((_) async => tStarshipModel);
          // act
          final result = await repository.getRandomStarship();
          // assert
          verifyZeroInteractions(mockRemoteDataSource);
          verify(mockLocalDataSource.getLastStarshipModel());
          expect(result, equals(const Right(tStarship)));
        },
      );

      test(
        'should return CacheFailure when there is no cached data present',
        () async {
          // arrange
          when(mockLocalDataSource.getLastStarshipModel())
              .thenThrow(CacheException());
          // act
          final result = await repository.getRandomStarship();
          // assert
          verifyZeroInteractions(mockRemoteDataSource);
          verify(mockLocalDataSource.getLastStarshipModel());
          expect(result, equals(Left(CacheFailure())));
        },
      );
    });
  });

  group("getListStarship", () {
    const tStarshipModels = [
      StarshipModel(name: "CR90 corvette", crew: "30"),
      StarshipModel(name: "CR90 corvette", crew: "30"),
      StarshipModel(name: "CR90 corvette", crew: "30")
    ];
    final resultsResponse = fixture('starship_results.json');
    Map<String, dynamic> parsedShipList =
        json.decode(fixture('starship_results.json'));

    const List<Starship> tStarships = tStarshipModels;
    test(
      'should check if the device is online',
      () async {
        // arrange
        when(mockNetworkInfo.isConnected).thenAnswer((_) async => true);
        when(mockRemoteDataSource.getListStarship())
            .thenAnswer((_) async => parsedShipList);
        // act
        repository.getListStarship();
        // assert
        verify(mockNetworkInfo.isConnected);
      },
    );

    runTestsOnline(() {
      test(
        'should return remote data when the call to remote data source is successful',
        () async {
          // arrange
          when(mockRemoteDataSource.getListStarship())
              .thenAnswer((_) async => parsedShipList);
          // act
          final result = await repository.getListStarship();
          // assert
          verify(mockRemoteDataSource.getListStarship());
          expect(result, equals(const Right(tStarships)));
        },
      );

      test(
        'should cache the data locally when the call to remote data source is successful',
        () async {
          // arrange
          when(mockRemoteDataSource.getListStarship())
              .thenAnswer((_) async => parsedShipList);
          // act
          await repository.getListStarship();
          // assert
          verify(mockRemoteDataSource.getListStarship());
          verify(mockLocalDataSource.cacheStarships(tStarshipModels));
        },
      );

      test(
        'should return server failure when the call to remote data source is unsuccessful',
        () async {
          // arrange
          when(mockRemoteDataSource.getListStarship())
              .thenThrow(ServerException());
          // act
          final result = await repository.getListStarship();
          // assert
          verify(mockRemoteDataSource.getListStarship());
          verifyZeroInteractions(mockLocalDataSource);
          expect(result, equals(Left(ServerFailure())));
        },
      );
    });

    runTestsOffline(() {
      test(
        'should return last locally cached starship when the cache data is present',
        () async {
          // arrange
          when(mockLocalDataSource.getLastStarshipModels())
              .thenAnswer((_) async => tStarshipModels);
          // act
          final result = await repository.getListStarship();
          // assert
          verifyZeroInteractions(mockRemoteDataSource);
          verify(mockLocalDataSource.getLastStarshipModels());
          expect(result, equals(const Right(tStarships)));
        },
      );

      test(
        'should return CacheFailure when there is no cached data present',
        () async {
          // arrange
          when(mockLocalDataSource.getLastStarshipModels())
              .thenThrow(CacheException());
          // act
          final result = await repository.getListStarship();
          // assert
          verifyZeroInteractions(mockRemoteDataSource);
          verify(mockLocalDataSource.getLastStarshipModels());
          expect(result, equals(Left(CacheFailure())));
        },
      );
    });
  });
}
