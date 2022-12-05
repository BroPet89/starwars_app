import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

@JsonSerializable()
class Starship extends Equatable {
  final String name;
  final String model;
  final String manufacturer;
  @JsonKey(name: 'cost_in_credits')
  final String costInCredits;
  final String length;
   @JsonKey(name: 'max_atmosphering_speed')
  final String maxAtmospheringSpeed;
  final String crew;
  final String passengers;
  @JsonKey(name: 'cargo_capacity')
  final String cargoCapacity;
  final String consumables;
  @JsonKey(name: 'hyperdrive_rating')
  final String hyperdriveRating;
  @JsonKey(name: 'MGLT')
  final String mGLT;
  @JsonKey(name: 'starship_class')
  final String starshipClass;
  final List<String> pilots;
  final List<String> films;
  final String url;

   const Starship({
    required this.name, 
    required this.model, 
    required this.manufacturer,
    required this.costInCredits,
    required this.length,
    required this.maxAtmospheringSpeed,
    required this.crew,    
    required this.passengers,
    required this.cargoCapacity,
    required this.consumables,
    required this.hyperdriveRating,
    required this.mGLT,
    required this.starshipClass,
    required this.pilots,
    required this.films,
    required this.url
   });

  @override
  List<Object> get props => [
    name, 
    model, 
    manufacturer, 
    costInCredits, 
    length, 
    maxAtmospheringSpeed, 
    crew,
    passengers,
    cargoCapacity,
    consumables,
    hyperdriveRating,
    mGLT,
    starshipClass,
    pilots,
    films,
    url];
}
