class VoiceMessageToSend {
  int? chatId;
  String? audio;

  VoiceMessageToSend({this.chatId, this.audio});

  VoiceMessageToSend.fromJson(Map<String, dynamic> json) {
    chatId = json['chat_id'];
    audio = json['audio'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['chat_id'] = this.chatId;
    data['audio'] = this.audio;
    return data;
  }
}
