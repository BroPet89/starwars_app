import '../../domain/entities/starship.dart';

class StarshipModel extends Starship  {
  const StarshipModel({required String name, required String crew})
      : super(name: name, crew: crew);

  factory StarshipModel.fromJson(Map<String, dynamic> json) {
    return StarshipModel(name: json['name'], crew: json['crew']);
  }

  Map<String, dynamic> toJson() {
    return {
      "name": name, 
      "crew": crew
    };
  }
}
