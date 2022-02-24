class ChatUserProfile {
  List<Chats>? chats;
  bool? isAdmin;

  ChatUserProfile({this.chats, this.isAdmin});

  ChatUserProfile.fromJson(Map<String, dynamic> json) {
    if (json['chats'] != null) {
      chats = <Chats>[];
      json['chats'].forEach((v) {
        chats!.add(new Chats.fromJson(v));
      });
    }
    isAdmin = json['isAdmin'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.chats != null) {
      data['chats'] = this.chats!.map((v) => v.toJson()).toList();
    }
    data['isAdmin'] = this.isAdmin;
    return data;
  }
}

class Chats {
  int? id;
  Admin? admin;
  Admin? client;

  Chats({this.id, this.admin, this.client});

  Chats.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    admin = json['admin'] != null ? new Admin.fromJson(json['admin']) : null;
    client = json['client'] != null ? new Admin.fromJson(json['client']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    if (this.admin != null) {
      data['admin'] = this.admin!.toJson();
    }
    if (this.client != null) {
      data['client'] = this.client!.toJson();
    }
    return data;
  }
}

class Admin {
  int? id;
  Profile? profile;
  String? username;
  String? email;

  Admin({this.id, this.profile, this.username, this.email});

  Admin.fromJson(Map<String, dynamic> json) {
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
