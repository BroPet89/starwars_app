import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:dartz/dartz.dart';
import 'package:mockito/mockito.dart';
import 'package:starwars_app/common/util/input_converter.dart';
import 'package:starwars_app/features/starships/domain/entities/starship.dart';
import 'package:starwars_app/features/starships/domain/use_cases/get_list_starship.dart';
import 'package:starwars_app/features/starships/domain/use_cases/get_random_starship.dart';
import 'package:starwars_app/features/starships/domain/use_cases/get_starship_by_name.dart';
import 'package:starwars_app/features/starships/presentation/bloc/starship_bloc.dart';

import 'starship_bloc_test.mocks.dart';

@GenerateMocks(
    [GetStarshipByName, GetRandomStarship, GetListStarship, InputConverter])
void main() {
  late StarshipBloc bloc;
  late MockGetStarshipByName mockGetStarshipByName;
  late MockGetRandomStarship mockGetRandomStarship;
  late MockGetListStarship mockGetListStarship;
  late MockInputConverter mockInputConverter;

  setUp(() {
    mockGetStarshipByName = MockGetStarshipByName();
    mockGetRandomStarship = MockGetRandomStarship();
    mockGetListStarship = MockGetListStarship();
    mockInputConverter = MockInputConverter();
    bloc = StarshipBloc(
        getStarshipByName: mockGetStarshipByName,
        getRandomStarship: mockGetRandomStarship,
        getListStarship: mockGetListStarship,
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

    void setUpMockInputConverterSuccess() =>
        when(mockInputConverter.stringToUnsignedInt(any))
            .thenReturn(const Right(tNumberParsed));

    test(
      'should call the InputConverter to validate and convert the string to an unsigned integer',
      () async {
        // arrange
        setUpMockInputConverterSuccess();
        // act
        bloc.add(const GetNameForStarship(tNumberString));
        await untilCalled(mockInputConverter.stringToUnsignedInt(any));
        // assert
        verify(mockInputConverter.stringToUnsignedInt(tNumberString));
      },
    );

    test(
      'should emit [Error] when the input is invalid',
      () async {
        // arrange
        setUpMockInputConverterSuccess();

        // assert
        final expected = [
          Empty(),
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
        bloc.add(const GetNameForStarship(tString));
        await untilCalled(mockGetStarshipByName(any));
        // assert
        verify(mockGetStarshipByName(const Params(searchTerm: tString)));
      },
    );
  });
}
