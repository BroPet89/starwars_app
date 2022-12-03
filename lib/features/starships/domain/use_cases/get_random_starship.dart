import 'package:dartz/dartz.dart';

import '../../../../common/error/failures.dart';
import '../../../../common/use_cases/use_case.dart';
import '../entities/starship.dart';
import '../repositories/starship_repository.dart';

class GetRandomStarship implements Usecase<Starship, NoParams> {
  final StarshipRepository repository;

  GetRandomStarship(this.repository);
  @override

  Future<Either<Failure, Starship>> call(NoParams params) async {
    return await repository.getRandomStarship();
  }
}

