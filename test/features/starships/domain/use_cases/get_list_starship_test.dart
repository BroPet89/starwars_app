import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:mockito/annotations.dart';
import 'package:starwars_app/common/use_cases/use_case.dart';
import 'package:starwars_app/features/starships/domain/entities/starship.dart';
import 'package:starwars_app/features/starships/domain/repositories/starship_repository.dart';
import 'package:starwars_app/features/starships/domain/use_cases/get_list_starship.dart';

import 'get_list_starship_test.mocks.dart';

@GenerateMocks([StarshipRepository])
void main() {
  late MockStarshipRepository mockStarshipRepository;
  late GetListStarship usecase;

  setUp(() {
    mockStarshipRepository = MockStarshipRepository();
    usecase = GetListStarship(mockStarshipRepository);
  });

  const tStarships = [
    Starship(name: "ship", crew: "100"),
    Starship(name: "ship", crew: "100"),
    Starship(name: "ship", crew: "100")
  ];
  test(
    'should get a list of starships from the repository',
    () async {
      // arrange
      when(mockStarshipRepository.getListStarship())
          .thenAnswer((_) async => const Right(tStarships));
      // act
      final result = await usecase(NoParams());
      // assert
      expect(result, const Right(tStarships));
      verify(mockStarshipRepository.getListStarship());
      verifyNoMoreInteractions(mockStarshipRepository);
    },
  );
}
