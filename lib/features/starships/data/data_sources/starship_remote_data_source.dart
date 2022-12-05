import 'dart:convert';
import 'dart:math';

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
}

class StarshipRemoteDataSourceImpl implements StarshipRemoteDataSource {
  final http.Client client;

  StarshipRemoteDataSourceImpl({required this.client});

  @override
  Future<StarshipModel> getStarshipByName(String name) =>
      _getStarshipFromURL("https://swapi.py4e.com/api/starships/?search=$name");

  @override
  Future<StarshipModel> getRandomStarship() => _getStarshipFromURL(
      "https://swapi.py4e.com/api/starships/${Random().nextInt(17)}");

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
}
