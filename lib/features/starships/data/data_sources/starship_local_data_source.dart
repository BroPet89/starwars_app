import '../../domain/entities/starship.dart';

import '../models/starship_model.dart';

abstract class StarshipLocalDataSource {
  Future<StarshipModel> getLastStarshipModel();
  Future<void> cacheStarship(Starship starshipToCache);
}
