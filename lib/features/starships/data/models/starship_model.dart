import '../../domain/entities/starship.dart';

import 'package:json_annotation/json_annotation.dart';

part 'starship_model.g.dart';

@JsonSerializable()
class StarshipModel extends Starship {
  const StarshipModel({
    required String name, 
    String? model, 
    String? manufacturer,
    String? costInCredits,
    String? length,
    String? maxAtmospheringSpeed,
    required String crew,    
    String? passengers,
    String? cargoCapacity,
    String? consumables,
    String? hyperdriveRating,
    String? mGLT,
    String? starshipClass,
    List<String>? pilots,
    List<String>? films,
    String? url})
      : super(
        name: name,
        model: model, 
        manufacturer: manufacturer,
        costInCredits: costInCredits,
        length: length,
        maxAtmospheringSpeed: maxAtmospheringSpeed,
        crew: crew,
        passengers: passengers,
        cargoCapacity: cargoCapacity,
        consumables: consumables,
        hyperdriveRating: hyperdriveRating,
        mGLT: mGLT,
        starshipClass: starshipClass,
        pilots: pilots,
        films: films,
        url: url);

  factory StarshipModel.fromJson(Map<String, dynamic> json) => _$StarshipModelFromJson(json);

  Map<String, dynamic> toJson() => _$StarshipModelToJson(this);
}
