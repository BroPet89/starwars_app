import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

@JsonSerializable()
class Starship extends Equatable {
  final String name;
  final String? model;
  final String? manufacturer;
  @JsonKey(name: 'cost_in_credits')
  final String? costInCredits;
  final String? length;
   @JsonKey(name: 'max_atmosphering_speed')
  final String? maxAtmospheringSpeed;
  final String crew;
  final String? passengers;
  @JsonKey(name: 'cargo_capacity')
  final String? cargoCapacity;
  final String? consumables;
  @JsonKey(name: 'hyperdrive_rating')
  final String? hyperdriveRating;
  @JsonKey(name: 'MGLT')
  final String? mGLT;
  @JsonKey(name: 'starship_class')
  final String? starshipClass;
  final List<String>? pilots;
  final List<String>? films;
  final String? url;

   const Starship({
    required this.name, 
    this.model, 
    this.manufacturer,
    this.costInCredits,
    this.length,
    this.maxAtmospheringSpeed,
    required this.crew,    
    this.passengers,
    this.cargoCapacity,
    this.consumables,
    this.hyperdriveRating,
    this.mGLT,
    this.starshipClass,
    this.pilots,
    this.films,
    this.url
   });

  @override
  List<Object> get props => [name, crew];
}
