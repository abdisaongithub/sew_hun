class Chat {
  List<Chats>? _chats;

  Chat({List<Chats>? chats}) {
    if (chats != null) {
      this._chats = chats;
    }
  }

  List<Chats>? get chats => _chats;
  set chats(List<Chats>? chats) => _chats = chats;

  Chat.fromJson(Map<String, dynamic> json) {
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
  int? _admin;
  int? _client;

  Chats({int? id, int? admin, int? client}) {
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
  int? get admin => _admin;
  set admin(int? admin) => _admin = admin;
  int? get client => _client;
  set client(int? client) => _client = client;

  Chats.fromJson(Map<String, dynamic> json) {
    _id = json['id'];
    _admin = json['admin'];
    _client = json['client'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this._id;
    data['admin'] = this._admin;
    data['client'] = this._client;
    return data;
  }
}
