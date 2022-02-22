class UserProfile {
  User? _user;

  UserProfile({User? user}) {
    if (user != null) {
      this._user = user;
    }
  }

  User? get user => _user;
  set user(User? user) => _user = user;

  UserProfile.fromJson(Map<String, dynamic> json) {
    _user = json['user'] != null ? new User.fromJson(json['user']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this._user != null) {
      data['user'] = this._user!.toJson();
    }
    return data;
  }
}

class User {
  int? _id;
  Profile? _profile;
  String? _lastLogin;
  bool? _isSuperuser;
  String? _username;
  String? _firstName;
  String? _lastName;
  bool? _isStaff;
  String? _dateJoined;
  String? _email;

  User(
      {int? id,
        Profile? profile,
        String? lastLogin,
        bool? isSuperuser,
        String? username,
        String? firstName,
        String? lastName,
        bool? isStaff,
        String? dateJoined,
        String? email}) {
    if (id != null) {
      this._id = id;
    }
    if (profile != null) {
      this._profile = profile;
    }
    if (lastLogin != null) {
      this._lastLogin = lastLogin;
    }
    if (isSuperuser != null) {
      this._isSuperuser = isSuperuser;
    }
    if (username != null) {
      this._username = username;
    }
    if (firstName != null) {
      this._firstName = firstName;
    }
    if (lastName != null) {
      this._lastName = lastName;
    }
    if (isStaff != null) {
      this._isStaff = isStaff;
    }
    if (dateJoined != null) {
      this._dateJoined = dateJoined;
    }
    if (email != null) {
      this._email = email;
    }
  }

  int? get id => _id;
  set id(int? id) => _id = id;
  Profile? get profile => _profile;
  set profile(Profile? profile) => _profile = profile;
  String? get lastLogin => _lastLogin;
  set lastLogin(String? lastLogin) => _lastLogin = lastLogin;
  bool? get isSuperuser => _isSuperuser;
  set isSuperuser(bool? isSuperuser) => _isSuperuser = isSuperuser;
  String? get username => _username;
  set username(String? username) => _username = username;
  String? get firstName => _firstName;
  set firstName(String? firstName) => _firstName = firstName;
  String? get lastName => _lastName;
  set lastName(String? lastName) => _lastName = lastName;
  bool? get isStaff => _isStaff;
  set isStaff(bool? isStaff) => _isStaff = isStaff;
  String? get dateJoined => _dateJoined;
  set dateJoined(String? dateJoined) => _dateJoined = dateJoined;
  String? get email => _email;
  set email(String? email) => _email = email;

  User.fromJson(Map<String, dynamic> json) {
    _id = json['id'];
    _profile =
    json['profile'] != null ? new Profile.fromJson(json['profile']) : null;
    _lastLogin = json['last_login'];
    _isSuperuser = json['is_superuser'];
    _username = json['username'];
    _firstName = json['first_name'];
    _lastName = json['last_name'];
    _isStaff = json['is_staff'];
    _dateJoined = json['date_joined'];
    _email = json['email'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this._id;
    if (this._profile != null) {
      data['profile'] = this._profile!.toJson();
    }
    data['last_login'] = this._lastLogin;
    data['is_superuser'] = this._isSuperuser;
    data['username'] = this._username;
    data['first_name'] = this._firstName;
    data['last_name'] = this._lastName;
    data['is_staff'] = this._isStaff;
    data['date_joined'] = this._dateJoined;
    data['email'] = this._email;
    return data;
  }
}

class Profile {
  int? _id;
  List<Role>? _role;
  String? _phone;
  String? _city;
  String? _subCity;
  String? _specialName;
  String? _bio;
  String? _photo;
  int? _user;

  Profile(
      {int? id,
        List<Role>? role,
        String? phone,
        String? city,
        String? subCity,
        String? specialName,
        String? bio,
        String? photo,
        int? user}) {
    if (id != null) {
      this._id = id;
    }
    if (role != null) {
      this._role = role;
    }
    if (phone != null) {
      this._phone = phone;
    }
    if (city != null) {
      this._city = city;
    }
    if (subCity != null) {
      this._subCity = subCity;
    }
    if (specialName != null) {
      this._specialName = specialName;
    }
    if (bio != null) {
      this._bio = bio;
    }
    if (photo != null) {
      this._photo = photo;
    }
    if (user != null) {
      this._user = user;
    }
  }

  int? get id => _id;
  set id(int? id) => _id = id;
  List<Role>? get role => _role;
  set role(List<Role>? role) => _role = role;
  String? get phone => _phone;
  set phone(String? phone) => _phone = phone;
  String? get city => _city;
  set city(String? city) => _city = city;
  String? get subCity => _subCity;
  set subCity(String? subCity) => _subCity = subCity;
  String? get specialName => _specialName;
  set specialName(String? specialName) => _specialName = specialName;
  String? get bio => _bio;
  set bio(String? bio) => _bio = bio;
  String? get photo => _photo;
  set photo(String? photo) => _photo = photo;
  int? get user => _user;
  set user(int? user) => _user = user;

  Profile.fromJson(Map<String, dynamic> json) {
    _id = json['id'];
    if (json['role'] != null) {
      _role = <Role>[];
      json['role'].forEach((v) {
        _role!.add(new Role.fromJson(v));
      });
    }
    _phone = json['phone'];
    _city = json['city'];
    _subCity = json['sub_city'];
    _specialName = json['special_name'];
    _bio = json['bio'];
    _photo = json['photo'];
    _user = json['user'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this._id;
    if (this._role != null) {
      data['role'] = this._role!.map((v) => v.toJson()).toList();
    }
    data['phone'] = this._phone;
    data['city'] = this._city;
    data['sub_city'] = this._subCity;
    data['special_name'] = this._specialName;
    data['bio'] = this._bio;
    data['photo'] = this._photo;
    data['user'] = this._user;
    return data;
  }
}

class Role {
  int? _id;
  String? _role;

  Role({int? id, String? role}) {
    if (id != null) {
      this._id = id;
    }
    if (role != null) {
      this._role = role;
    }
  }

  int? get id => _id;
  set id(int? id) => _id = id;
  String? get role => _role;
  set role(String? role) => _role = role;

  Role.fromJson(Map<String, dynamic> json) {
    _id = json['id'];
    _role = json['role'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this._id;
    data['role'] = this._role;
    return data;
  }
}
