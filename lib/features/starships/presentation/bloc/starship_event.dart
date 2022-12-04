part of 'starship_bloc.dart';

abstract class StarshipEvent extends Equatable {
  const StarshipEvent();

  @override
  List<Object> get props => [];
}

class GetStarshipByName extends StarshipEvent {
  final String searchTerm;

  const GetStarshipByName(this.searchTerm);
}
