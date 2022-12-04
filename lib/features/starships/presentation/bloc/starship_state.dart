part of 'starship_bloc.dart';

abstract class StarshipState extends Equatable {
  const StarshipState();

  @override
  List<Object> get props => [];
}

class Empty extends StarshipState {}

class Loading extends StarshipState {}

class Loaded extends StarshipState {
  final Starship starship;

  const Loaded({
    required this.starship
    }) : super();
}

class Error extends StarshipState {
  final String errorMessage;

  const Error({
    required this.errorMessage
    }) : super();
}
