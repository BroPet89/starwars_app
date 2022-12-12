import 'dart:convert';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:http/http.dart' as http;
import 'package:mockito/mockito.dart';
import 'package:starwars_app/common/error/exceptions.dart';
import 'package:starwars_app/features/starships/data/data_sources/starship_remote_data_source.dart';
import 'package:starwars_app/features/starships/data/models/starship_model.dart';

import '../../../../fixtures/fixture_reader.dart';
import 'starship_remote_data_source_test.mocks.dart';

@GenerateMocks([StarshipRemoteDataSourceImpl, http.Client])
void main() {
  late StarshipRemoteDataSourceImpl dataSource;
  late MockClient mockHttpClient;

  setUp(() {
    mockHttpClient = MockClient();
    dataSource = StarshipRemoteDataSourceImpl(client: mockHttpClient);
  });

  void setUpMockHttpClientSuccess200() {
    when(mockHttpClient.get(any, headers: anyNamed('headers')))
        .thenAnswer((_) async => http.Response(fixture('starship.json'), 200));
  }

  void setUpMockHttpClientSuccess200Results() {
    when(mockHttpClient.get(any, headers: anyNamed('headers'))).thenAnswer(
        (_) async => http.Response(fixture('starship_results.json'), 200));
  }

  void setUpMockHttpClientSuccess200WithList() {
    when(mockHttpClient.get(any, headers: anyNamed('headers')))
        .thenAnswer((_) async => http.Response(fixture('starships.json'), 200));
  }

  void setUpMockHttpClientFailure404() {
    when(mockHttpClient.get(any, headers: anyNamed('headers')))
        .thenAnswer((_) async => http.Response('Something went wrong', 404));
  }

  group("getStarshipByName", () {
    const tString = "Death Star";
    final tStringStarshipModel =
        StarshipModel.fromJson(json.decode(fixture('starship.json')));
    test(
      '''should perform a GET request on a URL with string
       being the endpoint and with an application/json header''',
      () async {
        // arrange
        setUpMockHttpClientSuccess200();
        // act
        dataSource.getStarshipByName(tString);
        // assert
        verify(mockHttpClient.get(
            Uri.parse('https://swapi.py4e.com/api/starships/?search=$tString'),
            headers: {'content-type': 'application/json'}));
      },
    );

    test(
      'should return Starship when the response code is 200 (success)',
      () async {
        // arrange
        setUpMockHttpClientSuccess200();
        // act
        final result = await dataSource.getStarshipByName(tString);
        // assert
        expect(result, equals(tStringStarshipModel));
      },
    );

    test(
      'should throw a ServerException when the response code is not 200',
      () async {
        // arrange
        setUpMockHttpClientFailure404();
        // act
        final call = dataSource.getStarshipByName;
        // assert
        expect(() => call(tString), throwsA(isA<ServerException>()));
      },
    );
  });

  group("getRandomStarship", () {
    final tStringStarshipModel =
        StarshipModel.fromJson(json.decode(fixture('starship.json')));
    test(
      '''should perform a GET request on a URL with string
       being the endpoint and with an application/json header''',
      () async {
        // arrange
        setUpMockHttpClientSuccess200();
        // act
        dataSource.getRandomStarship();
        // assert
        verify(mockHttpClient.get(
            Uri.parse('https://swapi.py4e.com/api/starships/2'),
            headers: {'content-type': 'application/json'}));
      },
    );

    test(
      'should return Starship when the response code is 200 (success)',
      () async {
        // arrange
        setUpMockHttpClientSuccess200();
        // act
        final result = await dataSource.getRandomStarship();
        // assert
        expect(result, equals(tStringStarshipModel));
      },
    );

    test(
      'should throw a ServerException when the response code is not 200',
      () async {
        // arrange
        setUpMockHttpClientFailure404();
        // act
        final call = dataSource.getRandomStarship;
        // assert
        expect(() => call(), throwsA(isA<ServerException>()));
      },
    );
  });

  group("getListStarship", () {
    List<StarshipModel> tStarshipModels = [];
    var parsedShipList = json.decode(fixture('starships_results.json'));
    for (Map<String, dynamic> p in parsedShipList["results"]) {
      tStarshipModels.add(StarshipModel.fromJson(p));
    }

    test(
      '''should perform a GET request on a URL with string
       being the endpoint and with an application/json header''',
      () async {
        // arrange
        setUpMockHttpClientSuccess200WithList();
        // act
        dataSource.getListStarship();
        // assert
        verify(mockHttpClient.get(
            Uri.parse('https://swapi.py4e.com/api/starships?format=json'),
            headers: {'content-type': 'application/json'}));
      },
    );

    test(
      'should return list of starships when the response code is 200 (success)',
      () async {
        // arrange
        setUpMockHttpClientSuccess200WithList();
        // act
        final result = await dataSource.getListStarship();
        // assert
        expect(result, equals(tStarshipModels));
      },
    );

    test(
      'should throw a ServerException when the response code is not 200',
      () async {
        // arrange
        setUpMockHttpClientFailure404();
        // act
        final call = dataSource.getListStarship;
        // assert
        expect(() => call(), throwsA(isA<ServerException>()));
      },
    );
  });
}
