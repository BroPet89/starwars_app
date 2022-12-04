// Mocks generated by Mockito 5.3.2 from annotations
// in starwars_app/test/features/starships/domain/use_cases/get_random_starship_test.dart.
// Do not manually edit this file.

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'dart:async' as _i4;

import 'package:dartz/dartz.dart' as _i2;
import 'package:mockito/mockito.dart' as _i1;
import 'package:starwars_app/common/error/failures.dart' as _i5;
import 'package:starwars_app/features/starships/domain/entities/starship.dart'
    as _i6;
import 'package:starwars_app/features/starships/domain/repositories/starship_repository.dart'
    as _i3;

// ignore_for_file: type=lint
// ignore_for_file: avoid_redundant_argument_values
// ignore_for_file: avoid_setters_without_getters
// ignore_for_file: comment_references
// ignore_for_file: implementation_imports
// ignore_for_file: invalid_use_of_visible_for_testing_member
// ignore_for_file: prefer_const_constructors
// ignore_for_file: unnecessary_parenthesis
// ignore_for_file: camel_case_types
// ignore_for_file: subtype_of_sealed_class

class _FakeEither_0<L, R> extends _i1.SmartFake implements _i2.Either<L, R> {
  _FakeEither_0(
    Object parent,
    Invocation parentInvocation,
  ) : super(
          parent,
          parentInvocation,
        );
}

/// A class which mocks [StarshipRepository].
///
/// See the documentation for Mockito's code generation for more information.
class MockStarshipRepository extends _i1.Mock
    implements _i3.StarshipRepository {
  MockStarshipRepository() {
    _i1.throwOnMissingStub(this);
  }

  @override
  _i4.Future<_i2.Either<_i5.Failure, _i6.Starship>> getStarshipByName(
          String? name) =>
      (super.noSuchMethod(
        Invocation.method(
          #getStarshipByName,
          [name],
        ),
        returnValue: _i4.Future<_i2.Either<_i5.Failure, _i6.Starship>>.value(
            _FakeEither_0<_i5.Failure, _i6.Starship>(
          this,
          Invocation.method(
            #getStarshipByName,
            [name],
          ),
        )),
      ) as _i4.Future<_i2.Either<_i5.Failure, _i6.Starship>>);
  @override
  _i4.Future<_i2.Either<_i5.Failure, _i6.Starship>> getRandomStarship() =>
      (super.noSuchMethod(
        Invocation.method(
          #getRandomStarship,
          [],
        ),
        returnValue: _i4.Future<_i2.Either<_i5.Failure, _i6.Starship>>.value(
            _FakeEither_0<_i5.Failure, _i6.Starship>(
          this,
          Invocation.method(
            #getRandomStarship,
            [],
          ),
        )),
      ) as _i4.Future<_i2.Either<_i5.Failure, _i6.Starship>>);
}
