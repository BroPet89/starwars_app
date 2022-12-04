import 'dart:convert';

import 'package:flutter_test/flutter_test.dart';
import 'package:starwars_app/features/starships/data/models/starship_model.dart';
import 'package:starwars_app/features/starships/domain/entities/starship.dart';

import '../../../../fixtures/fixture_reader.dart';

void main() {
  const tStarshipModel = StarshipModel(name: "Death Star", crew: "342,953");

  group("Starship model tests", () {
    test("should be a subclass of Starship entity", () async {
      expect(tStarshipModel, isA<Starship>());
    });
  });

  group("fromJson", () {
    test("should return valid model when the JSON name is a String", () async {
      // arrange
      final Map<String, dynamic> jsonMap =
          json.decode(fixture('starship.json'));
      // act
      final result = StarshipModel.fromJson(jsonMap);
      // assert
      expect(result, tStarshipModel);
    });
  });

  group("toJson", () {
    test("should return a JSON map containing the proper data", () async {
      final result = tStarshipModel.toJson();

      final expectMap = {
        "name": "Death Star",
        "crew": "342,953",
      };
      expect(result, expectMap);
    });
  });
}
