import 'dart:convert';

import 'package:dartz/dartz.dart';
import 'package:starwars_app/common/error/failures.dart';
import 'package:http/http.dart' as http;

class GetObjectFromReturnedJson {
  Either<Failure, List<Map<String, dynamic>>> getResultsFromresponse(
      http.Response response) {
    List<Map<String, dynamic>> results = [];
    try {
      final parsedJson = json.decode(response.body);
      for (Map<String, dynamic> p in parsedJson["results"]) {
        results.add(p);
      }
      return Right(results);
    } on Exception {
      return Left(InvalidJsonFailure());
    }
  }
}

class InvalidJsonFailure extends Failure {
  @override
  List<Object?> get props => const <dynamic>[];
}
