// ignore_for_file: constant_identifier_names

import 'dart:convert';

import 'package:shared_preferences/shared_preferences.dart';

import '/common/error/exceptions.dart';
import '../models/starship_model.dart';

abstract class StarshipLocalDataSource {
  /// Get the cached [StarshipModel] which was gotten the last time
  /// the user had an internet connection
  ///
  /// Throws [CacheException] if no cached data is present
  Future<StarshipModel> getLastStarshipModel();

  /// Get the cached [List<StarshipModel>] which was gotten the last time
  /// the user had an internet connection
  ///
  /// Throws [CacheException] if no cached data is present
  Future<List<StarshipModel>> getLastStarshipModels();

  Future<void> cacheStarship(StarshipModel starshipToCache);
  Future<void> cacheStarships(List<StarshipModel> starshipsToCache);
}

const CACHED_STARSHIP = "CACHED_STARSHIP";
const CACHED_STARSHIPS = "CACHED_STARSHIPS";

class StarshipLocalDataSourceImpl implements StarshipLocalDataSource {
  final SharedPreferences sharedPreferences;

  StarshipLocalDataSourceImpl({required this.sharedPreferences});

  @override
  Future<StarshipModel> getLastStarshipModel() {
    final jsonString = sharedPreferences.getString(CACHED_STARSHIP);
    if (jsonString != null) {
      return Future.value(StarshipModel.fromJson(json.decode(jsonString)));
    } else {
      throw CacheException();
    }
  }

  @override
  Future<void> cacheStarship(StarshipModel starshipToCache) {
    return sharedPreferences.setString(
        CACHED_STARSHIP, json.encode(starshipToCache.toJson()));
  }

  @override
  Future<List<StarshipModel>> getLastStarshipModels() {
    final jsonString = sharedPreferences.getString(CACHED_STARSHIPS);
    if (jsonString != null) {
      var mappedString = json.decode(jsonString);
      return Future.value(List<StarshipModel>.from(mappedString));
    } else {
      throw CacheException();
    }
  }

  @override
  Future<void> cacheStarships(List<StarshipModel> starshipsToCache) {
    var mappedStarships = starshipsToCache.asMap();
    return sharedPreferences.setString(
        CACHED_STARSHIPS, json.encode(mappedStarships));
  }
}
