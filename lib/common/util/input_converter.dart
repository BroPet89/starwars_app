import 'package:dartz/dartz.dart';
import 'package:starwars_app/common/error/failures.dart';

class InputConverter {
  Either<Failure, int> stringToUnsignedInt(String str) {
    try {
      final integer = int.parse(str);
      if (integer < 0) {
        throw const FormatException();
      }
      return Right(integer);
    } on FormatException {
      return Left(InvalidInputfailure());
    }
  }
}

class InvalidInputfailure extends Failure {
  @override
  List<Object?> get props => const <dynamic>[];
}
