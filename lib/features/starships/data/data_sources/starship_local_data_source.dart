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

  Future<void> cacheStarship(StarshipModel starshipToCache);
}

const CACHED_STARSHIP = "CACHED_STARSHIP";

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
}
