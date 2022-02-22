import 'dart:convert';

/// email : "abd@mail.com"
/// password1 : "svibrnd"
/// password2 : "svibrnd"

Register registerFromJson(String str) => Register.fromJson(json.decode(str));

String registerToJson(Register data) => json.encode(data.toJson());

class Register {
  Register({
    this.email,
    this.password1,
    this.password2,
  });

  Register.fromJson(dynamic json) {
    email = json['email'];
    password1 = json['password1'];
    password2 = json['password2'];
  }

  String? email;
  String? password1;
  String? password2;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['email'] = email;
    map['password1'] = password1;
    map['password2'] = password2;
    return map;
  }

  Register copyWith({String? email, String? password1, String? password2}) {
    return Register(
        email: email ?? this.email,
        password1: password1 ?? this.password1,
        password2: password2 ?? this.password2);
  }
}
