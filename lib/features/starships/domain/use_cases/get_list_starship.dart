import 'package:dartz/dartz.dart';

import '../../../../common/error/failures.dart';
import '../../../../common/use_cases/use_case.dart';
import '../entities/starship.dart';
import '../repositories/starship_repository.dart';

class GetListStarship implements Usecase<List<Starship>, NoParams> {
  final StarshipRepository repository;

  GetListStarship(this.repository);

  @override
  Future<Either<Failure, List<Starship>>> call(NoParams params) async {
   return await repository.getListStarship();
  }
}
