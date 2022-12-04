import 'package:dartz/dartz.dart';
import 'package:starwars_app/common/error/failures.dart';

class InputConverter {
  Either<Failure, int> stringToUnsignedInt(String str) {
    try {
      return Right(int.parse(str));
    } on FormatException {
      return Left(InvalidInputfailure());
    }
  }
}

class InvalidInputfailure extends Failure {
  @override
  List<Object?> get props => const <dynamic>[];
}
