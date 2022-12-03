import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';

import '../../../../common/error/failures.dart';
import '../../../../common/use_cases/use_case.dart';
import '../entities/starship.dart';
import '../repositories/starship_repository.dart';

class GetStarshipByName implements Usecase<Starship, Params> {
  final StarshipRepository repository;

  GetStarshipByName(this.repository);

  @override
  Future<Either<Failure, Starship>> call(Params params) async {
    return await repository.getStarshipByName(params.searchTerm);
  }
}

class Params extends Equatable {
  final String searchTerm;

  const Params({required this.searchTerm});
  
  @override
  List<Object?> get props => [searchTerm];
}
