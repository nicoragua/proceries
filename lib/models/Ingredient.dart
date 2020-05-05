import 'package:json_annotation/json_annotation.dart';

@JsonSerializable()

class Ingredient {
  String name;
  var amount;

  Ingredient(String name, var amount)  {
    this.name = name;
    this.amount = amount;
  }

  Ingredient.fromJson(Map<String, dynamic> json)
      : name = json['name'],
        amount = json['amount'];

  Map<String, dynamic> toJson() =>
      {
        'name': name,
        'amount': amount,
      };
}