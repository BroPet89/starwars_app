import 'package:equatable/equatable.dart';

class Starship extends Equatable {
  final String name;
  final String crew;

   const Starship({
    required this.name, 
    required this.crew
    });

  @override
  List<Object> get props => [name, crew];
}
