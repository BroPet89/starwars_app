import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:starwars_app/common/util/get_objects_from_returned_json.dart';
import 'package:dartz/dartz.dart';

import '../../fixtures/fixture_reader.dart';
import 'get_objects_from_returned_json_test.mocks.dart';

@GenerateMocks([http.Client])
void main() {
  late GetObjectFromReturnedJson getObjectFromReturnedJson;
  late MockClient mockHttpClient;

  setUp(() {
    getObjectFromReturnedJson = GetObjectFromReturnedJson();
    mockHttpClient = MockClient();
  });

  group("getObjectFromReturnedJson", () {
    final tResults = fixture("starship_results.json");
    final tBody = http.Response(tResults, 200);
    final tStarshipModel = json.decode(fixture("starship_double.json"));
    final tSingleBody = http.Response(fixture("starship.json"), 200);
    test(
      'should convert response body with "results" field to list of objects when searching for starship',
      () async {
        // arrange
        when(mockHttpClient.get(any, headers: anyNamed('headers')))
            .thenAnswer((_) async => tBody);
        // act
        final result =
            getObjectFromReturnedJson.getResultsFromresponse(tBody).fold(
                  (failure) => failure,
                  (response) => response,
                );
        // assert
        assert(result.runtimeType == List<Map<String, dynamic>>);
        final map = result as List<Map<String, dynamic>>;
        assert(!map.contains({"results" : []}));
      },
    );

    test(
      'should throw InvalidJsonFailure if no results field is found ',
      () async {
        // arrange
        when(mockHttpClient.get(any, headers: anyNamed('headers')))
            .thenAnswer((_) async => tSingleBody);
        // act
        final result =
            getObjectFromReturnedJson.getResultsFromresponse(tSingleBody).fold(
                  (failure) => failure,
                  (response) => response,
                );
        // assert
        expect(result, throwsA(isA<InvalidJsonFailure>()));
      },
    );
  });
}
