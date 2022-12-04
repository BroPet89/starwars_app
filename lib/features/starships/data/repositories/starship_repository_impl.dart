import 'package:starwars_app/common/platform/network_info.dart';
import 'package:starwars_app/features/starships/data/data_sources/starship_local_data_source.dart';
import 'package:starwars_app/features/starships/data/data_sources/starship_remote_data_source.dart';

import '../../domain/entities/starship.dart';
import '../../../../common/error/failures.dart';
import 'package:dartz/dartz.dart';
import '../../domain/repositories/starship_repository.dart';

class StarshipRepositoryImpl implements StarshipRepository {
  final StarshipRemoteDataSource starshipRemoteDataSource;
  final StarshipLocalDataSource starshipLocalDataSource;
  final NetworkInfo networkInfo;

  StarshipRepositoryImpl({
    required this.starshipRemoteDataSource,
    required this.starshipLocalDataSource,
    required this.networkInfo
  });
  
  @override
  Future<Either<Failure, Starship>> getRandomStarship() {
    // TODO: implement getRandomStarship
    throw UnimplementedError();
  }

  @override
  Future<Either<Failure, Starship>> getStarshipByName(String name) {
    // TODO: implement getStarshipByName
    throw UnimplementedError();
  }
}
