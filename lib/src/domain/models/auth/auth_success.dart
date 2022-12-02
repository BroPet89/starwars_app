import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:starwars_app/src/domain/models/user.dart';

part 'auth_success.freezed.dart';

@freezed
class AuthSuccess with _$AuthSuccess {
  const factory AuthSuccess({
    required bool registrationComplete,
    required User user,
  }) = _AuthSuccess;
}