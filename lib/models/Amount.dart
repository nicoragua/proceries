import 'package:json_annotation/json_annotation.dart';
import 'package:proceries/models/AmountTypes.dart';

@JsonSerializable()

class Amount {
  var value;
  AmountTypes amountType;

  Amount(var value, AmountTypes amountType) {
    this.value = value;
    this.amountType = amountType;
  }

  String toString() => "$value " + amountType.name;

  Amount.fromJson(Map<String, dynamic> json)
      : value = json['value'];

  Map<String, dynamic> toJson() =>
      {
        'value': value,
      };
}
