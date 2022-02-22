class ChatUserProfile {
  List<Chats>? _chats;

  ChatUserProfile({List<Chats>? chats}) {
    if (chats != null) {
      this._chats = chats;
    }
  }

  List<Chats>? get chats => _chats;
  set chats(List<Chats>? chats) => _chats = chats;

  ChatUserProfile.fromJson(Map<String, dynamic> json) {
    if (json['chats'] != null) {
      _chats = <Chats>[];
      json['chats'].forEach((v) {
        _chats!.add(new Chats.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this._chats != null) {
      data['chats'] = this._chats!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Chats {
  int? _id;
  Admin? _admin;
  Admin? _client;

  Chats({int? id, Admin? admin, Admin? client}) {
    if (id != null) {
      this._id = id;
    }
    if (admin != null) {
      this._admin = admin;
    }
    if (client != null) {
      this._client = client;
    }
  }

  int? get id => _id;
  set id(int? id) => _id = id;
  Admin? get admin => _admin;
  set admin(Admin? admin) => _admin = admin;
  Admin? get client => _client;
  set client(Admin? client) => _client = client;

  Chats.fromJson(Map<String, dynamic> json) {
    _id = json['id'];
    _admin = json['admin'] != null ? new Admin.fromJson(json['admin']) : null;
    _client =
    json['client'] != null ? new Admin.fromJson(json['client']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this._id;
    if (this._admin != null) {
      data['admin'] = this._admin!.toJson();
    }
    if (this._client != null) {
      data['client'] = this._client!.toJson();
    }
    return data;
  }
}

class Admin {
  int? _id;
  Profile? _profile;
  String? _username;
  String? _email;

  Admin({int? id, Profile? profile, String? username, String? email}) {
    if (id != null) {
      this._id = id;
    }
    if (profile != null) {
      this._profile = profile;
    }
    if (username != null) {
      this._username = username;
    }
    if (email != null) {
      this._email = email;
    }
  }

  int? get id => _id;
  set id(int? id) => _id = id;
  Profile? get profile => _profile;
  set profile(Profile? profile) => _profile = profile;
  String? get username => _username;
  set username(String? username) => _username = username;
  String? get email => _email;
  set email(String? email) => _email = email;

  Admin.fromJson(Map<String, dynamic> json) {
    _id = json['id'];
    _profile =
    json['profile'] != null ? new Profile.fromJson(json['profile']) : null;
    _username = json['username'];
    _email = json['email'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this._id;
    if (this._profile != null) {
      data['profile'] = this._profile!.toJson();
    }
    data['username'] = this._username;
    data['email'] = this._email;
    return data;
  }
}

class Profile {
  int? _id;
  String? _photo;

  Profile({int? id, String? photo}) {
    if (id != null) {
      this._id = id;
    }
    if (photo != null) {
      this._photo = photo;
    }
  }

  int? get id => _id;
  set id(int? id) => _id = id;
  String? get photo => _photo;
  set photo(String? photo) => _photo = photo;

  Profile.fromJson(Map<String, dynamic> json) {
    _id = json['id'];
    _photo = json['photo'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this._id;
    data['photo'] = this._photo;
    return data;
  }
}
