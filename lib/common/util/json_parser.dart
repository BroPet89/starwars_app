import 'package:dartz/dartz.dart';
import 'package:starwars_app/common/error/exceptions.dart';
import 'package:starwars_app/common/error/failures.dart';

class JsonParser {
  Either<Failure, List<Map<String, dynamic>>> getResultsFromresponse(
      Map<String, dynamic> parsedJson) {
    List<Map<String, dynamic>> results = [];
    try {
      if(parsedJson.containsKey("results")) {
        for (Map<String, dynamic> p in parsedJson["results"]) {
          results.add(p);
        }
        return Right(results);
      } else {
        throw InvalidJsonException();
      }
    } on InvalidJsonException {
      return Left(InvalidJsonFailure());
    }
  }
}

class InvalidJsonFailure extends Failure {
  @override
  List<Object?> get props => const <dynamic>[];
}
