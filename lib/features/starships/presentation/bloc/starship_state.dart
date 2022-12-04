part of 'starship_bloc.dart';

abstract class StarshipState extends Equatable {
  const StarshipState();
  
  @override
  List<Object> get props => [];
}

class StarshipInitial extends StarshipState {}
