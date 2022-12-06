import 'dart:convert';

import 'package:flutter_test/flutter_test.dart';
import 'package:starwars_app/features/starships/data/models/starship_model.dart';
import 'package:starwars_app/features/starships/domain/entities/starship.dart';

import '../../../../fixtures/fixture_reader.dart';

void main() {
  final tStarshipModel = StarshipModel.fromJson(json.decode(fixture("starship.json")));

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
        "model": "DS-1 Orbital Battle Station",
        "manufacturer": "Imperial Department of Military Research, Sienar Fleet Systems",
        "cost_in_credits": "1000000000000",
        "length": "120000",
        "max_atmosphering_speed": "n/a",
        "crew": "342,953",
        "passengers": "843,342",
        "cargo_capacity": "1000000000000",
        "consumables": "3 years",
        "hyperdrive_rating": "4.0",
        "MGLT": "10",
        "starship_class": "Deep Space Mobile Battlestation",
        "pilots": [],
        "films": [
          "https://swapi.py4e.com/api/films/1/"
        ],
        "url": "https://swapi.py4e.com/api/starships/9/"
      };
      expect(result, expectMap);
    });
  });
}
