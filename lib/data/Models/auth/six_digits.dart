// To parse this JSON data, do
//
//     final sixDigits = sixDigitsFromJson(jsonString);
import 'dart:convert';

SixDigits sixDigitsFromJson(String str) => SixDigits.fromJson(json.decode(str));

String sixDigitsToJson(SixDigits data) => json.encode(data.toJson());

class SixDigits {
  SixDigits({
    required this.id,
  });

  String id;

  factory SixDigits.fromJson(Map<String, dynamic> json) => SixDigits(
        id: json["id"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
      };
}

class EmailAndId {
  String? email;
  String? id;

  EmailAndId({
    required this.email,
    required this.id,
  });
}
