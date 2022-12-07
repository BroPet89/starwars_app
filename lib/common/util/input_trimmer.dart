import 'package:dartz/dartz.dart';
import '../error/failures.dart';

class InputTrimmer {
  Either<Failure, String> trimWhiteSpace(String stringToBeTrimmed) {
    try {
      final returnedString = stringToBeTrimmed.trim();
      return Right(returnedString);
    } on FormatException {
      return Left(InvalidInputFailure());
    }
  }
}

class InvalidInputFailure extends Failure {
  @override
  List<Object?> get props => const <dynamic>[];
}
