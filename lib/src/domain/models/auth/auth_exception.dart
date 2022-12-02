import 'package:starwars_app/src/domain/models/failure.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'auth_exception.freezed.dart';

@freezed
class AuthException with _$AuthException {
  const factory AuthException({
    required AuthFailureReason failureReason,
  }) = _AuthException;
}