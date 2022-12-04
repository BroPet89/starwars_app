import 'dart:convert';

import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:starwars_app/common/error/exceptions.dart';
import 'package:starwars_app/features/starships/data/data_sources/starship_local_data_source.dart';
import 'package:starwars_app/features/starships/data/models/starship_model.dart';

import '../../../../fixtures/fixture_reader.dart';
import 'starship_local_data_source_test.mocks.dart';

@GenerateMocks([SharedPreferences, StarshipLocalDataSourceImpl])
void main() {
  late MockSharedPreferences mockSharedPreferences;
  late StarshipLocalDataSourceImpl dataSource;

  setUp(() {
    mockSharedPreferences = MockSharedPreferences();
    dataSource =
        StarshipLocalDataSourceImpl(sharedPreferences: mockSharedPreferences);
  });

  group("getLastStarship", () {
    final tStarshipModel =
        StarshipModel.fromJson(json.decode(fixture("starship_cached.json")));
    test(
      'should return starship from shared preferences when there is one in the cache',
      () async {
        // arrange
        when(mockSharedPreferences.getString(any))
            .thenReturn(fixture("starship_cached.json"));
        // act
        final result = await dataSource.getLastStarshipModel();
        // assert
        verify(mockSharedPreferences.getString(CACHED_STARSHIP));
        expect(result, equals(tStarshipModel));
      },
    );

    test(
      'should throw CacheException when there is not a cached value',
      () async {
        // arrange
        when(mockSharedPreferences.getString(any)).thenReturn(null);
        // act
        final call = dataSource.getLastStarshipModel;
        // assert

        expect(() => call(), throwsA(isA<CacheException>()));
      },
    );
  });

  group("cacheStarship", () {
    const tStarshipModel = StarshipModel(name: "Death Star", crew: "342,953");
    // test(
    //   'should call SharedPreferences to cache the data',
    //   () async {
    //     // act
    //     dataSource.cacheStarship(tStarshipModel);
    //     // assert
    //     final expectedJsonString = json.encode(tStarshipModel.toJson());
    //     verify(
    //         mockSharedPreferences.setString(CACHED_STARSHIP, expectedJsonString));
    //   },
    // );
  });
}
