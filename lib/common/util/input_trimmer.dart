import 'package:dartz/dartz.dart';
import '../error/failures.dart';
import 'input_converter.dart';

class InputTrimmer {
  Either<Failure, String> trimWhiteSpace(String stringToBeTrimmed) {
    try {
      final returnedString = stringToBeTrimmed.trim();
      return Right(returnedString);
    } on FormatException {
      return Left(InvalidInputfailure());
    }
  }
}
