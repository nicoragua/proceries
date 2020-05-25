import 'package:json_annotation/json_annotation.dart';
import 'package:proceries/models/AmountTypes.dart';

@JsonSerializable()

class Amount {
  var value;
  AmountTypes amountType;

  Amount(this.value, this.amountType);

  String toString() => "$value " + amountType.name;

  Amount.fromJson(Map<String, dynamic> json)
      : value = json['value'],
      amountType = json['amountType'];

  Map<String, dynamic> toJson() =>
      {
        'value': value,
        'amountType': amountType,
      };
}
