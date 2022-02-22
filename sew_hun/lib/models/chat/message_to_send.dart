class MessageToSend {
  int? chatId;
  String? text;

  MessageToSend({this.chatId, this.text});

  MessageToSend.fromJson(Map<String, dynamic> json) {
    chatId = json['chat_id'];
    text = json['text'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['chat_id'] = this.chatId;
    data['text'] = this.text;
    return data;
  }
}
