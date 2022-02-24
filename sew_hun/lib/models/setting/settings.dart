class Settings {
  Data? data;

  Settings({this.data});

  Settings.fromJson(Map<String, dynamic> json) {
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
  bool? isSubscribed;
  bool? darkMode;
  bool? isActive;
  int? user;

  Data({this.id, this.isSubscribed, this.darkMode, this.isActive, this.user});

  Data.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    isSubscribed = json['is_subscribed'];
    darkMode = json['dark_mode'];
    isActive = json['is_active'];
    user = json['user'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['is_subscribed'] = this.isSubscribed;
    data['dark_mode'] = this.darkMode;
    data['is_active'] = this.isActive;
    data['user'] = this.user;
    return data;
  }
}
