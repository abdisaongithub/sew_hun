import 'dart:convert';
/// key : "cfbcac4cc2b112caf7728096d239510d4ab697d6"

AuthToken authTokenFromJson(String str) => AuthToken.fromJson(json.decode(str));
String authTokenToJson(AuthToken data) => json.encode(data.toJson());

class AuthToken {
  AuthToken({
      String? key,}){
    _key = key;
}

  AuthToken.fromJson(dynamic json) {
    _key = json['key'];
  }
  String? _key;

  String? get key => _key;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['key'] = _key;
    return map;
  }

}