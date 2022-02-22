class Admins {
  List<Data>? data;

  Admins({this.data});

  Admins.fromJson(Map<String, dynamic> json) {
    if (json['data'] != null) {
      data = <Data>[];
      json['data'].forEach((v) {
        data!.add(new Data.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.data != null) {
      data['data'] = this.data!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Data {
  int? id;
  Profile? profile;
  String? username;
  String? email;

  Data({this.id, this.profile, this.username, this.email});

  Data.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    profile =
    json['profile'] != null ? new Profile.fromJson(json['profile']) : null;
    username = json['username'];
    email = json['email'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    if (this.profile != null) {
      data['profile'] = this.profile!.toJson();
    }
    data['username'] = this.username;
    data['email'] = this.email;
    return data;
  }
}

class Profile {
  int? id;
  String? photo;

  Profile({this.id, this.photo});

  Profile.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    photo = json['photo'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['photo'] = this.photo;
    return data;
  }
}
