import 'package:dartz/dartz.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:starwars_app/common/use_cases/use_case.dart';
import 'package:starwars_app/features/starships/domain/entities/starship.dart';
import 'package:starwars_app/features/starships/domain/repositories/starship_repository.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:starwars_app/features/starships/domain/use_cases/get_random_starship.dart';

import 'get_starship_by_name_test.mocks.dart';

@GenerateMocks(
  [StarshipRepository])

void main() {
  late MockStarshipRepository mockStarshipRepository;
  late GetRandomStarship usecase;

  setUp(() {
    mockStarshipRepository = MockStarshipRepository();
    usecase = GetRandomStarship(mockStarshipRepository);
  });

  const tStarship = Starship(name: "Death Star", crew: "342,953");

  group("Get starship tests", () {
    test("should get a random starship from the repository", () async {
      // arrange
      when(mockStarshipRepository.getRandomStarship())
          .thenAnswer((_) async => const Right(tStarship));

      // act
      final result = await usecase(NoParams());
      // assert
      expect(result, const Right(tStarship));
      verify(mockStarshipRepository.getRandomStarship());
      verifyNoMoreInteractions(mockStarshipRepository);
    });
  });
}
