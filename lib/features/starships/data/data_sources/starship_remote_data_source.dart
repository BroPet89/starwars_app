import 'dart:convert';

import 'package:http/http.dart' as http;
import '../models/starship_model.dart';
import '/common/error/exceptions.dart';

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
  Future<StarshipModel> getStarshipByName(String name) async {
    final response = await client.get(
      Uri.parse("https://swapi.py4e.com/api/starships/?search=$name"),
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
  Future<StarshipModel> getRandomStarship() {
    // TODO: implement getRandomStarship
    throw UnimplementedError();
  }
}
