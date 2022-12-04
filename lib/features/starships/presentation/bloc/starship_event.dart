part of 'starship_bloc.dart';

@immutable
abstract class StarshipEvent extends Equatable {
  const StarshipEvent([List props = const <dynamic>[]]) : super();
}

class GetStarshipByName extends StarshipEvent {
  final String searchTerm;

  const GetStarshipByName(this.searchTerm) : super();

  @override
  List<Object?> get props => const <dynamic>[];
}

class GetRandomStarship extends StarshipEvent {
  @override
  List<Object?> get props => const <dynamic>[];
}
