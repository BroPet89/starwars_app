import '../../../../common/error/exceptions.dart';

import '../../../../common/platform/network_info.dart';
import '../data_sources/starship_local_data_source.dart';
import '../data_sources/starship_remote_data_source.dart';

import '../../domain/entities/starship.dart';
import '../../../../common/error/failures.dart';
import 'package:dartz/dartz.dart';
import '../../domain/repositories/starship_repository.dart';

class StarshipRepositoryImpl implements StarshipRepository {
  final StarshipRemoteDataSource starshipRemoteDataSource;
  final StarshipLocalDataSource starshipLocalDataSource;
  final NetworkInfo networkInfo;

  StarshipRepositoryImpl(
      {required this.starshipRemoteDataSource,
      required this.starshipLocalDataSource,
      required this.networkInfo});

  @override
  Future<Either<Failure, Starship>> getRandomStarship() {
    // TODO: implement getRandomStarship
    throw UnimplementedError();
  }

  @override
  Future<Either<Failure, Starship>> getStarshipByName(String name) async {
    networkInfo.isConnected;
    try {
      final remoteStarship = await starshipRemoteDataSource.getStarshipByName(name);
      starshipLocalDataSource.cacheStarship(remoteStarship);
      return Right(remoteStarship);
    } on ServerException {
      return Left(ServerFailure());
    }
  }
}
