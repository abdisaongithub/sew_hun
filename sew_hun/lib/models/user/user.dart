import 'dart:convert';

/// id : 3
/// last_login : "2022-01-27T00:46:55.476787Z"
/// is_superuser : true
/// username : "abdiabdi"
/// first_name : ""
/// last_name : ""
/// is_staff : true
/// date_joined : "2022-01-07T00:27:46.195003Z"
/// email : "abdisa@mail.com"

User userFromJson(String str) => User.fromJson(json.decode(str));
String userToJson(User data) => json.encode(data.toJson());
class User {
  User({
      int? id, 
      String? lastLogin, 
      bool? isSuperuser, 
      String? username, 
      String? firstName, 
      String? lastName, 
      bool? isStaff, 
      String? dateJoined, 
      String? email,}){
    _id = id;
    _lastLogin = lastLogin;
    _isSuperuser = isSuperuser;
    _username = username;
    _firstName = firstName;
    _lastName = lastName;
    _isStaff = isStaff;
    _dateJoined = dateJoined;
    _email = email;
}

  User.fromJson(dynamic json) {
    _id = json['id'];
    _lastLogin = json['last_login'];
    _isSuperuser = json['is_superuser'];
    _username = json['username'];
    _firstName = json['first_name'];
    _lastName = json['last_name'];
    _isStaff = json['is_staff'];
    _dateJoined = json['date_joined'];
    _email = json['email'];
  }
  int? _id;
  String? _lastLogin;
  bool? _isSuperuser;
  String? _username;
  String? _firstName;
  String? _lastName;
  bool? _isStaff;
  String? _dateJoined;
  String? _email;

  int? get id => _id;
  String? get lastLogin => _lastLogin;
  bool? get isSuperuser => _isSuperuser;
  String? get username => _username;
  String? get firstName => _firstName;
  String? get lastName => _lastName;
  bool? get isStaff => _isStaff;
  String? get dateJoined => _dateJoined;
  String? get email => _email;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = _id;
    map['last_login'] = _lastLogin;
    map['is_superuser'] = _isSuperuser;
    map['username'] = _username;
    map['first_name'] = _firstName;
    map['last_name'] = _lastName;
    map['is_staff'] = _isStaff;
    map['date_joined'] = _dateJoined;
    map['email'] = _email;
    return map;
  }

}