import 'package:dartz/dartz.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:starwars_app/features/starships/domain/entities/starship.dart';
import 'package:starwars_app/features/starships/domain/repositories/starship_repository.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:starwars_app/features/starships/domain/use_cases/get_starship_by_name.dart';

import 'get_starship_by_name_test.mocks.dart';

@GenerateMocks(
  [StarshipRepository])

void main() {
  late MockStarshipRepository mockStarshipRepository;
  late GetStarshipByName usecase;

  setUp(() {
    mockStarshipRepository = MockStarshipRepository();
    usecase = GetStarshipByName(mockStarshipRepository);
  });

  const tString = "death%20star";
  const tStarship = Starship(name: "Death Star", crew: "342,953");

  group("get starship tests", () {
    test("should get starship by name from the repository", () async {
      // arrange
      when(mockStarshipRepository.getStarshipByName(tString))
          .thenAnswer((_) async => const Right(tStarship));

      // act
      final result = await usecase.execute(searchTerm: tString);
      // assert
      expect(result, const Right(tStarship));
      verify(mockStarshipRepository.getStarshipByName(tString));
      verifyNoMoreInteractions(mockStarshipRepository);
    });
  });
}
