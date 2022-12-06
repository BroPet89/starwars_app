import 'dart:convert';

import 'package:http/http.dart' as http;

import '/common/error/exceptions.dart';
import '../models/starship_model.dart';

abstract class StarshipRemoteDataSource {
  /// calls the "https://swapi.py4e.com/api/starships/?search={name}" endpoint.
  ///
  /// Throws a [ServerException] for all error codes.
  Future<StarshipModel> getStarshipByName(String name);

  /// calls the "https://swapi.py4e.com/api/starships/{random_number}" endpoint.
  ///
  /// Throws a [ServerException] for all error codes.
  Future<StarshipModel> getRandomStarship();

  /// calls the "https://swapi.py4e.com/api/starships" endpoint.
  ///
  /// Throws a [ServerException] for all error codes.
  Future<List<StarshipModel>> getListStarship();
}

class StarshipRemoteDataSourceImpl implements StarshipRemoteDataSource {
  final http.Client client;

  StarshipRemoteDataSourceImpl({required this.client});

  @override
  Future<StarshipModel> getStarshipByName(String name) =>
      _getStarshipFromURL("https://swapi.py4e.com/api/starships/?search=$name");

  @override
  Future<StarshipModel> getRandomStarship() =>
      _getStarshipFromURL("https://swapi.py4e.com/api/starships/2");

  Future<StarshipModel> _getStarshipFromURL(String url) async {
    final response = await client.get(
      Uri.parse(url),
      headers: {
        'content-type': 'application/json',
      },
    );
    if (response.statusCode == 200) {
      return StarshipModel.fromJson(json.decode(response.body));
    } else {
      throw ServerException();
    }
  }

  @override
  Future<List<StarshipModel>> getListStarship() async {
    final response = await client.get(
      Uri.parse("https://swapi.py4e.com/api/starships"),
      headers: {
        'content-type': 'application/json',
      },
    );
    if (response.statusCode == 200) {
      final returnedJson = json.decode(response.body);
      List<StarshipModel> starships = List<StarshipModel>.from(
          returnedJson["results"].map((model) => StarshipModel.fromJson(model)));
      return starships;
    } else {
      throw ServerException();
    }
  }
}
