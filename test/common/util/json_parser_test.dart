import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:starwars_app/common/util/json_parser.dart';
import 'package:dartz/dartz.dart';

import '../../fixtures/fixture_reader.dart';
import 'json_parser_test.mocks.dart';

@GenerateMocks([http.Client])
void main() {
  late JsonParser jsonParser;
  late MockClient mockHttpClient;

  setUp(() {
    jsonParser = JsonParser();
    mockHttpClient = MockClient();
  });

  group("getObjectFromReturnedJson", () {
    final tBody = json.decode(fixture("starship_results.json"));
    final tSingleBodyresponse = json.decode(fixture("starship.json"));
    final tSingleBody = http.Response(fixture("starship.json"), 200);
    test(
      'should convert response body with "results" field to list of objects when searching for starship',
      () async {
        // arrange
        when(mockHttpClient.get(any, headers: anyNamed('headers')))
            .thenAnswer((_) async => tBody);
        // act
        final result = jsonParser.getResultsFromresponse(tBody).fold(
              (failure) => failure,
              (response) => response,
            );
        // assert
        assert(result.runtimeType == List<Map<String, dynamic>>);
        final map = result as List<Map<String, dynamic>>;
        assert(!map.contains({"results": []}));
      },
    );

    test(
      'should throw InvalidJsonFailure if no results field is found ',
      () async {
        // arrange
        when(mockHttpClient.get(any, headers: anyNamed('headers')))
            .thenAnswer((_) async => tSingleBody);
        // act
        final result = jsonParser.getResultsFromresponse(tSingleBodyresponse);
        // assert
        expect(result, Left(InvalidJsonFailure()));
      },
    );
  });
}
