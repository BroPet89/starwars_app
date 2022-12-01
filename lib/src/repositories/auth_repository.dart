import 'package:dartz/dartz.dart';
import 'package:starwars_app/features/auth/data/repositories/auth_repository.dart';
import 'package:starwars_app/src/domain/data_source_exception.dart';
import 'package:starwars_app/src/domain/models/auth/auth_exception.dart';
import 'package:starwars_app/src/domain/models/auth/auth_success.dart';
import 'package:starwars_app/src/domain/models/failure.dart';
import 'package:starwars_app/src/domain/models/user.dart';
import 'package:starwars_app/features/auth/data/datasources/auth_local_data_source.dart';
import 'package:starwars_app/features/auth/data/datasources/auth_remote_data_source.dart';


class AuthRepository implements IAuthRepository {
  final AuthRemoteDataSource _authRemoteDataSource;
  final AuthLocalDataSource _authLocalDataSource;


  AuthRepository(this._authRemoteDataSource, this._authLocalDataSource);


  @override
  Future<Either<Failure, AuthSuccess>> signIn() async {
    try {
      final userCredentials = await _authRemoteDataSource.googleSignIn();
      await _authLocalDataSource.storeUserCredentials(userCredentials);
      final isRegistrationComplete =
          await _authRemoteDataSource.isRegistrationComplete();
      final user = User(id: userCredentials.uid, email: userCredentials.email);


      return Right(AuthSuccess(
          registrationComplete: isRegistrationComplete, user: user));
    } on AuthException catch (e) {
      return Left(Failure.authenticationFailure(e.failureReason));
    } on AuthLocalDataSourceException {
      return const Left(Failure.authenticationLocalDataSourceFailure());
    }
  }


  @override
  Future<Either<Failure, Unit>> signOut() async {
    try {
      await _authRemoteDataSource.googleSignOut();
      return const Right(unit);
    } catch (e) {
      return const Left(Failure.signOutError());
    }
  }


  @override
  Future<bool> isRegistrationComplete() async {
    return _authRemoteDataSource.isRegistrationComplete();
  }
}