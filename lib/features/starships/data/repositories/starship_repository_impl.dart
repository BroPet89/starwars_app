import 'package:dartz/dartz.dart';
import 'package:starwars_app/common/util/json_parser.dart';

import '../../../../common/error/exceptions.dart';
import '../../../../common/error/failures.dart';
import '../../../../common/network/network_info.dart';
import '../../domain/entities/starship.dart';
import '../../domain/repositories/starship_repository.dart';
import '../data_sources/starship_local_data_source.dart';
import '../data_sources/starship_remote_data_source.dart';
import '../models/starship_model.dart';

typedef _ConcreteOrRandomPicker = Future<StarshipModel> Function();

class StarshipRepositoryImpl implements StarshipRepository {
  final StarshipRemoteDataSource starshipRemoteDataSource;
  final StarshipLocalDataSource starshipLocalDataSource;
  final JsonParser jsonParser;
  final NetworkInfo networkInfo;

  StarshipRepositoryImpl(
      {required this.starshipRemoteDataSource,
      required this.starshipLocalDataSource,
      required this.jsonParser,
      required this.networkInfo});

  @override
  Future<Either<Failure, Starship>> getStarshipByName(String name) async {
    return await _getStarship(() {
      return starshipRemoteDataSource.getStarshipByName(name);
    });
  }

  @override
  Future<Either<Failure, Starship>> getRandomStarship() async {
    return await _getStarship(() {
      return starshipRemoteDataSource.getRandomStarship();
    });
  }

  Future<Either<Failure, Starship>> _getStarship(
    _ConcreteOrRandomPicker getStarshipOrRandom,
  ) async {
    if (await networkInfo.isConnected) {
      try {
        final remoteStarship = await getStarshipOrRandom();
        starshipLocalDataSource.cacheStarship(remoteStarship);
        return Right(remoteStarship);
      } on ServerException {
        return Left(ServerFailure());
      }
    } else {
      try {
        final localStarship =
            await starshipLocalDataSource.getLastStarshipModel();
        return Right(localStarship);
      } on CacheException {
        return Left(CacheFailure());
      }
    }
  }

  @override
  Future<Either<Failure, List<Starship>>> getListStarship() async {
    if (await networkInfo.isConnected) {
      try {
        final remoteStarships =
            await starshipRemoteDataSource.getListStarship();
        var parsedResponse = jsonParser.getResultsFromresponse(remoteStarships);
        parsedResponse.fold((failure) {
          throw ServerException();
        }, (mapList) {
          List<StarshipModel> starships = List<StarshipModel>.from(mapList);
          starshipLocalDataSource.cacheStarships(starships);
          return Right(starships);
        });
        throw ServerException();
      } on ServerException {
        return Left(ServerFailure());
      }
    } else {
      try {
        final localStarships =
            await starshipLocalDataSource.getLastStarshipModels();
        return Right(localStarships);
      } on CacheException {
        return Left(CacheFailure());
      }
    }
  }
}
