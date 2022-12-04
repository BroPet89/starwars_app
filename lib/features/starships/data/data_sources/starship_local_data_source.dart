import '../models/starship_model.dart';

abstract class StarshipLocalDataSource {
  Future<StarshipModel> getLastStarshipModel();
  Future<void> cacheStarship(StarshipModel starshipToCache);
}
