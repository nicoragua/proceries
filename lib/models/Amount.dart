import 'package:json_annotation/json_annotation.dart';

@JsonSerializable()

class Amount {
  var value;

  Amount(var value) {
    this.value = value;
  }

  // TODO
  String toString() => "";

  Amount.fromJson(Map<String, dynamic> json)
      : value = json['value'];

  Map<String, dynamic> toJson() =>
      {
        'value': value,
      };
}
