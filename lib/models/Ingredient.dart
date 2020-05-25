import 'package:json_annotation/json_annotation.dart';
import 'package:proceries/models/Amount.dart';

@JsonSerializable()

class Ingredient {
  String name;
  Amount amount;

  Ingredient(this.name, this.amount);

  String toString() => "$name, " + amount.toString();

  Ingredient.fromJson(Map<String, dynamic> json)
      : name = json['name'],
        amount = json['amount'];

  Map<String, dynamic> toJson() =>
      {
        'name': name,
        'amount': amount,
      };
}