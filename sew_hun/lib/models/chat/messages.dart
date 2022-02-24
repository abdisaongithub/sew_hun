class Messages {
  List<Data>? data;
  bool? isAdmin;
  Chat? chat;

  Messages({this.data, this.isAdmin, this.chat});

  Messages.fromJson(Map<String, dynamic> json) {
    if (json['data'] != null) {
      data = <Data>[];
      json['data'].forEach((v) {
        data!.add(new Data.fromJson(v));
      });
    }
    isAdmin = json['isAdmin'];
    chat = json['chat'] != null ? new Chat.fromJson(json['chat']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.data != null) {
      data['data'] = this.data!.map((v) => v.toJson()).toList();
    }
    data['isAdmin'] = this.isAdmin;
    if (this.chat != null) {
      data['chat'] = this.chat!.toJson();
    }
    return data;
  }
}

class Data {
  int? id;
  String? text;
  String? audio;
  bool? isFromAdmin;
  bool? adminRead;
  bool? clientRead;
  String? timestamp;
  int? chat;

  Data(
      {this.id,
        this.text,
        this.audio,
        this.isFromAdmin,
        this.adminRead,
        this.clientRead,
        this.timestamp,
        this.chat});

  Data.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    text = json['text'];
    audio = json['audio'];
    isFromAdmin = json['is_from_admin'];
    adminRead = json['admin_read'];
    clientRead = json['client_read'];
    timestamp = json['timestamp'];
    chat = json['chat'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['text'] = this.text;
    data['audio'] = this.audio;
    data['is_from_admin'] = this.isFromAdmin;
    data['admin_read'] = this.adminRead;
    data['client_read'] = this.clientRead;
    data['timestamp'] = this.timestamp;
    data['chat'] = this.chat;
    return data;
  }
}

class Chat {
  int? id;
  Admin? admin;
  Admin? client;

  Chat({this.id, this.admin, this.client});

  Chat.fromJson(Map<String, dynamic> json) {
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
