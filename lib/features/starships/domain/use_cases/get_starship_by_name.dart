import 'package:dartz/dartz.dart';

import '../../../../common/error/failures.dart';
import '../entities/starship.dart';
import '../repositories/starship_repository.dart';

class GetStarshipByName {
  final StarshipRepository repository;

  GetStarshipByName(this.repository);

  Future<Either<Failure, Starship>> execute(
      {required String searchTerm}) async {
    return await repository.getStarshipByName(searchTerm);
  }
}
