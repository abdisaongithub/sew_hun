class NewMessage {
  Data? data;

  NewMessage({this.data});

  NewMessage.fromJson(Map<String, dynamic> json) {
    data = json['data'] != null ? new Data.fromJson(json['data']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.data != null) {
      data['data'] = this.data!.toJson();
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
  String? chat;

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
