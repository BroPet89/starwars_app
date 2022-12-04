import '../models/starship_model.dart';

abstract class StarshipRemoteDataSource {
  Future<StarshipModel> getStarshipByName(String name);
  Future<StarshipModel> getRandomStarship();
}