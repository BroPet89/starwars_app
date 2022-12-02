// Mocks generated by Mockito 5.3.2 from annotations
// in starwars_app/test/src/auth/data/state_notifier/auth_notifier_test.dart.
// Do not manually edit this file.

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'dart:async' as _i6;

import 'package:dartz/dartz.dart' as _i3;
import 'package:hooks_riverpod/hooks_riverpod.dart' as _i5;
import 'package:mockito/mockito.dart' as _i1;
import 'package:starwars_app/features/auth/data/repositories/auth_repository.dart'
    as _i10;
import 'package:starwars_app/features/auth/presentation/state/auth_notifier.dart'
    as _i4;
import 'package:starwars_app/features/auth/presentation/state/auth_state.dart'
    as _i2;
import 'package:starwars_app/src/data/current_user_provider.dart' as _i8;
import 'package:starwars_app/src/data/repositories/user_repository.dart'
    as _i13;
import 'package:starwars_app/src/domain/models/auth/auth_success.dart' as _i12;
import 'package:starwars_app/src/domain/models/failure.dart' as _i11;
import 'package:starwars_app/src/domain/models/user.dart' as _i9;
import 'package:state_notifier/state_notifier.dart' as _i7;

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

class _FakeAuthState_0 extends _i1.SmartFake implements _i2.AuthState {
  _FakeAuthState_0(
    Object parent,
    Invocation parentInvocation,
  ) : super(
          parent,
          parentInvocation,
        );
}

class _FakeEither_1<L, R> extends _i1.SmartFake implements _i3.Either<L, R> {
  _FakeEither_1(
    Object parent,
    Invocation parentInvocation,
  ) : super(
          parent,
          parentInvocation,
        );
}

/// A class which mocks [AuthNotifier].
///
/// See the documentation for Mockito's code generation for more information.
class MockAuthNotifier extends _i1.Mock implements _i4.AuthNotifier {
  @override
  set onError(_i5.ErrorListener? _onError) => super.noSuchMethod(
        Invocation.setter(
          #onError,
          _onError,
        ),
        returnValueForMissingStub: null,
      );
  @override
  bool get mounted => (super.noSuchMethod(
        Invocation.getter(#mounted),
        returnValue: false,
        returnValueForMissingStub: false,
      ) as bool);
  @override
  _i6.Stream<_i2.AuthState> get stream => (super.noSuchMethod(
        Invocation.getter(#stream),
        returnValue: _i6.Stream<_i2.AuthState>.empty(),
        returnValueForMissingStub: _i6.Stream<_i2.AuthState>.empty(),
      ) as _i6.Stream<_i2.AuthState>);
  @override
  _i2.AuthState get state => (super.noSuchMethod(
        Invocation.getter(#state),
        returnValue: _FakeAuthState_0(
          this,
          Invocation.getter(#state),
        ),
        returnValueForMissingStub: _FakeAuthState_0(
          this,
          Invocation.getter(#state),
        ),
      ) as _i2.AuthState);
  @override
  set state(_i2.AuthState? value) => super.noSuchMethod(
        Invocation.setter(
          #state,
          value,
        ),
        returnValueForMissingStub: null,
      );
  @override
  _i2.AuthState get debugState => (super.noSuchMethod(
        Invocation.getter(#debugState),
        returnValue: _FakeAuthState_0(
          this,
          Invocation.getter(#debugState),
        ),
        returnValueForMissingStub: _FakeAuthState_0(
          this,
          Invocation.getter(#debugState),
        ),
      ) as _i2.AuthState);
  @override
  bool get hasListeners => (super.noSuchMethod(
        Invocation.getter(#hasListeners),
        returnValue: false,
        returnValueForMissingStub: false,
      ) as bool);
  @override
  _i6.Future<void> checkIfAuthenticated() => (super.noSuchMethod(
        Invocation.method(
          #checkIfAuthenticated,
          [],
        ),
        returnValue: _i6.Future<void>.value(),
        returnValueForMissingStub: _i6.Future<void>.value(),
      ) as _i6.Future<void>);
  @override
  _i6.Future<void> signIn() => (super.noSuchMethod(
        Invocation.method(
          #signIn,
          [],
        ),
        returnValue: _i6.Future<void>.value(),
        returnValueForMissingStub: _i6.Future<void>.value(),
      ) as _i6.Future<void>);
  @override
  _i6.Future<void> signOut() => (super.noSuchMethod(
        Invocation.method(
          #signOut,
          [],
        ),
        returnValue: _i6.Future<void>.value(),
        returnValueForMissingStub: _i6.Future<void>.value(),
      ) as _i6.Future<void>);
  @override
  bool updateShouldNotify(
    _i2.AuthState? old,
    _i2.AuthState? current,
  ) =>
      (super.noSuchMethod(
        Invocation.method(
          #updateShouldNotify,
          [
            old,
            current,
          ],
        ),
        returnValue: false,
        returnValueForMissingStub: false,
      ) as bool);
  @override
  _i5.RemoveListener addListener(
    _i7.Listener<_i2.AuthState>? listener, {
    bool? fireImmediately = true,
  }) =>
      (super.noSuchMethod(
        Invocation.method(
          #addListener,
          [listener],
          {#fireImmediately: fireImmediately},
        ),
        returnValue: () {},
        returnValueForMissingStub: () {},
      ) as _i5.RemoveListener);
  @override
  void dispose() => super.noSuchMethod(
        Invocation.method(
          #dispose,
          [],
        ),
        returnValueForMissingStub: null,
      );
}

/// A class which mocks [UserProvider].
///
/// See the documentation for Mockito's code generation for more information.
class MockUserProvider extends _i1.Mock implements _i8.UserProvider {
  MockUserProvider() {
    _i1.throwOnMissingStub(this);
  }

  @override
  String get id => (super.noSuchMethod(
        Invocation.getter(#id),
        returnValue: '',
      ) as String);
  @override
  String get firebaseDocPath => (super.noSuchMethod(
        Invocation.getter(#firebaseDocPath),
        returnValue: '',
      ) as String);
  @override
  _i6.Stream<_i9.User> get userChanges => (super.noSuchMethod(
        Invocation.getter(#userChanges),
        returnValue: _i6.Stream<_i9.User>.empty(),
      ) as _i6.Stream<_i9.User>);
  @override
  _i6.Future<dynamic> setup() => (super.noSuchMethod(
        Invocation.method(
          #setup,
          [],
        ),
        returnValue: _i6.Future<dynamic>.value(),
      ) as _i6.Future<dynamic>);
  @override
  _i6.Future<dynamic> deleteUserData() => (super.noSuchMethod(
        Invocation.method(
          #deleteUserData,
          [],
        ),
        returnValue: _i6.Future<dynamic>.value(),
      ) as _i6.Future<dynamic>);
}

/// A class which mocks [AuthRepository].
///
/// See the documentation for Mockito's code generation for more information.
class MockAuthRepository extends _i1.Mock implements _i10.AuthRepository {
  MockAuthRepository() {
    _i1.throwOnMissingStub(this);
  }

  @override
  _i6.Future<_i3.Either<_i11.Failure, _i12.AuthSuccess>> signIn() =>
      (super.noSuchMethod(
        Invocation.method(
          #signIn,
          [],
        ),
        returnValue:
            _i6.Future<_i3.Either<_i11.Failure, _i12.AuthSuccess>>.value(
                _FakeEither_1<_i11.Failure, _i12.AuthSuccess>(
          this,
          Invocation.method(
            #signIn,
            [],
          ),
        )),
      ) as _i6.Future<_i3.Either<_i11.Failure, _i12.AuthSuccess>>);
  @override
  _i6.Future<_i3.Either<_i11.Failure, _i3.Unit>> signOut() =>
      (super.noSuchMethod(
        Invocation.method(
          #signOut,
          [],
        ),
        returnValue: _i6.Future<_i3.Either<_i11.Failure, _i3.Unit>>.value(
            _FakeEither_1<_i11.Failure, _i3.Unit>(
          this,
          Invocation.method(
            #signOut,
            [],
          ),
        )),
      ) as _i6.Future<_i3.Either<_i11.Failure, _i3.Unit>>);
  @override
  _i6.Future<bool> isRegistrationComplete() => (super.noSuchMethod(
        Invocation.method(
          #isRegistrationComplete,
          [],
        ),
        returnValue: _i6.Future<bool>.value(false),
      ) as _i6.Future<bool>);
}

/// A class which mocks [UserRepository].
///
/// See the documentation for Mockito's code generation for more information.
class MockUserRepository extends _i1.Mock implements _i13.UserRepository {
  MockUserRepository() {
    _i1.throwOnMissingStub(this);
  }

  @override
  _i6.Future<_i3.Either<_i11.Failure, _i9.User>> createUser(
          {required _i9.User? user}) =>
      (super.noSuchMethod(
        Invocation.method(
          #createUser,
          [],
          {#user: user},
        ),
        returnValue: _i6.Future<_i3.Either<_i11.Failure, _i9.User>>.value(
            _FakeEither_1<_i11.Failure, _i9.User>(
          this,
          Invocation.method(
            #createUser,
            [],
            {#user: user},
          ),
        )),
      ) as _i6.Future<_i3.Either<_i11.Failure, _i9.User>>);
  @override
  String collectionPath(String? document) => (super.noSuchMethod(
        Invocation.method(
          #collectionPath,
          [document],
        ),
        returnValue: '',
      ) as String);
}
