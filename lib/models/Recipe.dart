import 'package:json_annotation/json_annotation.dart';

@JsonSerializable()

class Recipe {
  String name;
  var ingredients = new List();

  Recipe(this.name, this.ingredients);

  Recipe.fromJson(Map<String, dynamic> json)
      : name = json['name'],
        ingredients = json['ingredients'];

  Map<String, dynamic> toJson() =>
      {
        'name': name,
        'ingredients': ingredients,
      };
}