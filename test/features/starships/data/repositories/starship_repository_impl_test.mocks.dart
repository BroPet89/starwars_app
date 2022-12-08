// Mocks generated by Mockito 5.3.2 from annotations
// in starwars_app/test/features/starships/data/repositories/starship_repository_impl_test.dart.
// Do not manually edit this file.

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'dart:async' as _i4;

import 'package:mockito/mockito.dart' as _i1;
import 'package:starwars_app/common/network/network_info.dart' as _i6;
import 'package:starwars_app/features/starships/data/data_sources/starship_local_data_source.dart'
    as _i5;
import 'package:starwars_app/features/starships/data/data_sources/starship_remote_data_source.dart'
    as _i3;
import 'package:starwars_app/features/starships/data/models/starship_model.dart'
    as _i2;

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

class _FakeStarshipModel_0 extends _i1.SmartFake implements _i2.StarshipModel {
  _FakeStarshipModel_0(
    Object parent,
    Invocation parentInvocation,
  ) : super(
          parent,
          parentInvocation,
        );
}

/// A class which mocks [StarshipRemoteDataSource].
///
/// See the documentation for Mockito's code generation for more information.
class MockStarshipRemoteDataSource extends _i1.Mock
    implements _i3.StarshipRemoteDataSource {
  MockStarshipRemoteDataSource() {
    _i1.throwOnMissingStub(this);
  }

  @override
  _i4.Future<_i2.StarshipModel> getStarshipByName(String? name) =>
      (super.noSuchMethod(
        Invocation.method(
          #getStarshipByName,
          [name],
        ),
        returnValue: _i4.Future<_i2.StarshipModel>.value(_FakeStarshipModel_0(
          this,
          Invocation.method(
            #getStarshipByName,
            [name],
          ),
        )),
      ) as _i4.Future<_i2.StarshipModel>);
  @override
  _i4.Future<_i2.StarshipModel> getRandomStarship() => (super.noSuchMethod(
        Invocation.method(
          #getRandomStarship,
          [],
        ),
        returnValue: _i4.Future<_i2.StarshipModel>.value(_FakeStarshipModel_0(
          this,
          Invocation.method(
            #getRandomStarship,
            [],
          ),
        )),
      ) as _i4.Future<_i2.StarshipModel>);
  @override
  _i4.Future<List<_i2.StarshipModel>> getListStarship() => (super.noSuchMethod(
        Invocation.method(
          #getListStarship,
          [],
        ),
        returnValue:
            _i4.Future<List<_i2.StarshipModel>>.value(<_i2.StarshipModel>[]),
      ) as _i4.Future<List<_i2.StarshipModel>>);
}

/// A class which mocks [StarshipLocalDataSource].
///
/// See the documentation for Mockito's code generation for more information.
class MockStarshipLocalDataSource extends _i1.Mock
    implements _i5.StarshipLocalDataSource {
  MockStarshipLocalDataSource() {
    _i1.throwOnMissingStub(this);
  }

  @override
  _i4.Future<_i2.StarshipModel> getLastStarshipModel() => (super.noSuchMethod(
        Invocation.method(
          #getLastStarshipModel,
          [],
        ),
        returnValue: _i4.Future<_i2.StarshipModel>.value(_FakeStarshipModel_0(
          this,
          Invocation.method(
            #getLastStarshipModel,
            [],
          ),
        )),
      ) as _i4.Future<_i2.StarshipModel>);
  @override
  _i4.Future<List<_i2.StarshipModel>> getLastStarshipModels() =>
      (super.noSuchMethod(
        Invocation.method(
          #getLastStarshipModels,
          [],
        ),
        returnValue:
            _i4.Future<List<_i2.StarshipModel>>.value(<_i2.StarshipModel>[]),
      ) as _i4.Future<List<_i2.StarshipModel>>);
  @override
  _i4.Future<void> cacheStarship(_i2.StarshipModel? starshipToCache) =>
      (super.noSuchMethod(
        Invocation.method(
          #cacheStarship,
          [starshipToCache],
        ),
        returnValue: _i4.Future<void>.value(),
        returnValueForMissingStub: _i4.Future<void>.value(),
      ) as _i4.Future<void>);
  @override
  _i4.Future<void> cacheStarships(List<_i2.StarshipModel>? starshipsToCache) =>
      (super.noSuchMethod(
        Invocation.method(
          #cacheStarships,
          [starshipsToCache],
        ),
        returnValue: _i4.Future<void>.value(),
        returnValueForMissingStub: _i4.Future<void>.value(),
      ) as _i4.Future<void>);
}

/// A class which mocks [NetworkInfo].
///
/// See the documentation for Mockito's code generation for more information.
class MockNetworkInfo extends _i1.Mock implements _i6.NetworkInfo {
  MockNetworkInfo() {
    _i1.throwOnMissingStub(this);
  }

  @override
  _i4.Future<bool> get isConnected => (super.noSuchMethod(
        Invocation.getter(#isConnected),
        returnValue: _i4.Future<bool>.value(false),
      ) as _i4.Future<bool>);
}
