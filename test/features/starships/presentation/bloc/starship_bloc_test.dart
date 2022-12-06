import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:dartz/dartz.dart';
import 'package:mockito/mockito.dart';
import 'package:starwars_app/common/util/input_converter.dart';
import 'package:starwars_app/features/starships/domain/entities/starship.dart';
import 'package:starwars_app/features/starships/domain/use_cases/get_random_starship.dart';
import 'package:starwars_app/features/starships/domain/use_cases/get_starship_by_name.dart';
import 'package:starwars_app/features/starships/presentation/bloc/starship_bloc.dart';

import 'starship_bloc_test.mocks.dart';

@GenerateMocks([GetStarshipByName, GetRandomStarship, InputConverter])
void main() {
  late StarshipBloc bloc;
  late MockGetStarshipByName mockGetStarshipByName;
  late MockGetRandomStarship mockGetRandomStarship;
  late MockInputConverter mockInputConverter;

  setUp(() {
    mockGetStarshipByName = MockGetStarshipByName();
    mockGetRandomStarship = MockGetRandomStarship();
    mockInputConverter = MockInputConverter();
    bloc = StarshipBloc(
        getStarshipByName: mockGetStarshipByName,
        getRandomStarship: mockGetRandomStarship,
        inputConverter: mockInputConverter);
  });

  test(
    'initialState should be empty',
    () async {
      // assert
      expect(bloc.initialState, equals(Empty()));
    },
  );

  group("getNameForStarship", () {
    const tNumberString = "1";
    const tNumberParsed = 1;
    const tString = "Death Star";
    const tStarship = Starship(name: "Death Star", crew: "342,953");

    // test(
    //   'should call the InputConverter to validate and convert the string to an unsigned integer',
    //   () async {
    //     // arrange
    //     when(mockInputConverter.stringToUnsignedInt(tNumberString))
    //         .thenReturn(const Right(tNumberParsed));
    //     // act
    //     bloc.add(const GetNameForStarship(tString));
    //     await untilCalled(mockInputConverter.stringToUnsignedInt(any));
    //     // assert
    //     verify(mockInputConverter.stringToUnsignedInt(tNumberString));
    //   },
    // );

    test(
      'should emit [Error] when the input is invalid',
      () async {
        // arrange
        when(mockInputConverter.stringToUnsignedInt(tNumberString))
            .thenReturn(Left(InvalidInputfailure()));
        // act
        bloc.add(const GetNameForStarship(tString));
        // assert
        final expected = [
          Empty(),
          const Error(errorMessage: invalidInputFailure)
        ];
        expectLater(bloc.state, emitsInOrder(expected));
      },
    );
  });
}
