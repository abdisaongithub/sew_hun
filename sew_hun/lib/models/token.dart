import 'dart:convert';

class Token {
  Token({
    required this.key,
  });

  String key;

  Token copyWith({
    required String key,
  }) =>
      Token(
        key: key,
      );

  factory Token.fromJson(String str) => Token.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory Token.fromMap(Map<String, dynamic> json) => Token(
        key: json["key"],
      );

  Map<String, dynamic> toMap() => {
        "key": key,
      };
}
