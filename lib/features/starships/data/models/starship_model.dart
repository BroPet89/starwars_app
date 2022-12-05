import '../../domain/entities/starship.dart';

import 'package:json_annotation/json_annotation.dart';

part 'starship_model.g.dart';

@JsonSerializable()
class StarshipModel extends Starship  {
  const StarshipModel({
    required String name, 
    required String model, 
    required String manufacturer,
    required String costInCredits,
    required String length,
    required String maxAtmospheringSpeed,
    required String crew,    
    required String passengers,
    required String cargoCapacity,
    required String consumables,
    required String hyperdriveRating,
    required String mGLT,
    required String starshipClass,
    required List<String> pilots,
    required List<String> films,
    required String url})
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
