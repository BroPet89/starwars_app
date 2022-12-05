part of 'starship_bloc.dart';

@immutable
abstract class StarshipEvent extends Equatable {
  const StarshipEvent([List props = const <dynamic>[]]) : super();
}

class GetNameForStarship extends StarshipEvent {
  final String searchTerm;

  const GetNameForStarship(this.searchTerm) : super();

  @override
  List<Object?> get props => const <dynamic>[];
}

class GetRandomForStarship extends StarshipEvent {
  @override
  List<Object?> get props => const <dynamic>[];
}
