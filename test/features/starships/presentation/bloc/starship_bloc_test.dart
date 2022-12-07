import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:dartz/dartz.dart';
import 'package:mockito/mockito.dart';
import 'package:starwars_app/common/error/failures.dart';
import 'package:starwars_app/common/util/input_trimmer.dart';
import 'package:starwars_app/features/starships/domain/entities/starship.dart';
import 'package:starwars_app/features/starships/domain/use_cases/get_list_starship.dart';
import 'package:starwars_app/features/starships/domain/use_cases/get_random_starship.dart';
import 'package:starwars_app/features/starships/domain/use_cases/get_starship_by_name.dart';
import 'package:starwars_app/features/starships/presentation/bloc/starship_bloc.dart';

import 'starship_bloc_test.mocks.dart';

@GenerateMocks(
    [GetStarshipByName, GetRandomStarship, GetListStarship, InputTrimmer])
void main() {
  late StarshipBloc bloc;
  late MockGetStarshipByName mockGetStarshipByName;
  late MockGetRandomStarship mockGetRandomStarship;
  late MockGetListStarship mockGetListStarship;
  late MockInputTrimmer mockInputTrimmer;

  setUp(() {
    mockGetStarshipByName = MockGetStarshipByName();
    mockGetRandomStarship = MockGetRandomStarship();
    mockGetListStarship = MockGetListStarship();
    mockInputTrimmer = MockInputTrimmer();
    bloc = StarshipBloc(
        getStarshipByName: mockGetStarshipByName,
        getRandomStarship: mockGetRandomStarship,
        getListStarship: mockGetListStarship,
        inputTrimmer: mockInputTrimmer);
  });

  test(
    'initialState should be empty',
    () async {
      // assert
      expect(bloc.state, equals(Empty()));
    },
  );

  group("getNameForStarship", () {
    const tUntrimmed = "       Death Star        ";
    const tString = "Death Star";
    const tStarship = Starship(name: "Death Star", crew: "342,953");

    void setUpMockInputConverterSuccess() =>
        when(mockInputTrimmer.trimWhiteSpace(any))
            .thenReturn(const Right(tString));

    // test(
    //   'should call the InputTrimmer to validate and convert the string to a trimmed string',
    //   () async {
    //     // arrange
    //     setUpMockInputConverterSuccess();
    //     // act
    //     bloc.add(const GetNameForStarship(tUntrimmed));
    //     await untilCalled(mockInputTrimmer.trimWhiteSpace(any));
    //     // assert
    //     verify(mockInputTrimmer.trimWhiteSpace(tUntrimmed));
    //   },
    // );

    test(
      'should emit [Error] when the input is invalid',
      () async {
        // arrange
        when(mockInputTrimmer.trimWhiteSpace(any))
            .thenReturn(Left(InvalidInputFailure()));

        // assert
        final expected = [
          // Empty(),
          const Error(errorMessage: invalidInputFailure)
        ];
        expectLater(bloc.stream.asBroadcastStream(), emitsInOrder(expected));
        bloc.add(const GetNameForStarship(tString));
      },
    );

    test(
      'should get data from the byName use case',
      () async {
        // arrange
        setUpMockInputConverterSuccess();
        when(mockGetStarshipByName(any))
            .thenAnswer((_) async => const Right(tStarship));
        // act
        bloc.add(const GetNameForStarship(tUntrimmed));
        await untilCalled(mockGetStarshipByName(any));
        // assert
        verify(mockGetStarshipByName(const Params(searchTerm: tString)));
      },
    );

    test(
      'should emit [Loading, Loaded] when data is gotten successfully',
      () async {
        // arrange
        setUpMockInputConverterSuccess();
        when(mockGetStarshipByName(any))
            .thenAnswer((_) async => const Right(tStarship));
        // assert later
        final expected = [Loading(), const Loaded(starship: tStarship)];
        expectLater(bloc.stream.asBroadcastStream(), emitsInOrder(expected));
        // act
        bloc.add(const GetNameForStarship(tUntrimmed));
      },
    );

     test(
      'should emit [Loading, Error] when getting data fails',
      () async {
        // arrange
        setUpMockInputConverterSuccess();
        when(mockGetStarshipByName(any))
            .thenAnswer((_) async => Left(ServerFailure()));
        // assert later
        final expected = [Loading(), const Error(errorMessage: serverFailureMessage)];
        expectLater(bloc.stream.asBroadcastStream(), emitsInOrder(expected));
        // act
        bloc.add(const GetNameForStarship(tUntrimmed));
      },
    );

    test(
      'should emit [Loading, Error] with proper message for the error when getting data fails',
      () async {
        // arrange
        setUpMockInputConverterSuccess();
        when(mockGetStarshipByName(any))
            .thenAnswer((_) async => Left(CacheFailure()));
        // assert later
        final expected = [Loading(), const Error(errorMessage: cacheFailureMessage)];
        expectLater(bloc.stream.asBroadcastStream(), emitsInOrder(expected));
        // act
        bloc.add(const GetNameForStarship(tUntrimmed));
      },
    );
  });
}
