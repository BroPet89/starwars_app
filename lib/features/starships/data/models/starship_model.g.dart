// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'starship_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

StarshipModel _$StarshipModelFromJson(Map<String, dynamic> json) =>
    StarshipModel(
      name: json['name'] as String,
      model: json['model'] as String?,
      manufacturer: json['manufacturer'] as String?,
      costInCredits: json['cost_in_credits'] as String?,
      length: json['length'] as String?,
      maxAtmospheringSpeed: json['max_atmosphering_speed'] as String?,
      crew: json['crew'] as String,
      passengers: json['passengers'] as String?,
      cargoCapacity: json['cargo_capacity'] as String?,
      consumables: json['consumables'] as String?,
      hyperdriveRating: json['hyperdrive_rating'] as String?,
      mGLT: json['MGLT'] as String?,
      starshipClass: json['starship_class'] as String?,
      pilots:
          (json['pilots'] as List<dynamic>?)?.map((e) => e as String).toList(),
      films:
          (json['films'] as List<dynamic>?)?.map((e) => e as String).toList(),
      url: json['url'] as String?,
    );

Map<String, dynamic> _$StarshipModelToJson(StarshipModel instance) =>
    <String, dynamic>{
      'name': instance.name,
      'model': instance.model,
      'manufacturer': instance.manufacturer,
      'cost_in_credits': instance.costInCredits,
      'length': instance.length,
      'max_atmosphering_speed': instance.maxAtmospheringSpeed,
      'crew': instance.crew,
      'passengers': instance.passengers,
      'cargo_capacity': instance.cargoCapacity,
      'consumables': instance.consumables,
      'hyperdrive_rating': instance.hyperdriveRating,
      'MGLT': instance.mGLT,
      'starship_class': instance.starshipClass,
      'pilots': instance.pilots,
      'films': instance.films,
      'url': instance.url,
    };
