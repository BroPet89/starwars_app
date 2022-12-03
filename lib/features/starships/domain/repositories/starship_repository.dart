import 'package:dartz/dartz.dart';
import '../../../../common/error/failures.dart';
import '../entities/starship.dart';

abstract class StarshipRepository {
  Future<Either<Failure, Starship>> getStarshipByName(String name);
  Future<Either<Failure, Starship>> getRandomStarship();
}
