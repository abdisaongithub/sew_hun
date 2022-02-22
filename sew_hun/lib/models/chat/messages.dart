class Messages {
  List<Data>? data;

  Messages({this.data});

  Messages.fromJson(Map<String, dynamic> json) {
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
  String? text;
  String? audio;
  bool? isFromAdmin;
  String? timestamp;
  bool? adminRead;
  bool? clientRead;
  int? chat;

  Data(
      {this.id,
        this.text,
        this.audio,
        this.isFromAdmin,
        this.timestamp,
        this.adminRead,
        this.clientRead,
        this.chat});

  Data.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    text = json['text'];
    audio = json['audio'];
    isFromAdmin = json['is_from_admin'];
    timestamp = json['timestamp'];
    adminRead = json['admin_read'];
    clientRead = json['client_read'];
    chat = json['chat'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['text'] = this.text;
    data['audio'] = this.audio;
    data['is_from_admin'] = this.isFromAdmin;
    data['timestamp'] = this.timestamp;
    data['admin_read'] = this.adminRead;
    data['client_read'] = this.clientRead;
    data['chat'] = this.chat;
    return data;
  }
}
