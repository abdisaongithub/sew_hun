class Playlist {
  List<Playlists>? _playlists;

  Playlist({List<Playlists>? playlists}) {
    if (playlists != null) {
      this._playlists = playlists;
    }
  }

  List<Playlists>? get playlists => _playlists;
  set playlists(List<Playlists>? playlists) => _playlists = playlists;

  Playlist.fromJson(Map<String, dynamic> json) {
    if (json['playlists'] != null) {
      _playlists = <Playlists>[];
      json['playlists'].forEach((v) {
        _playlists!.add(new Playlists.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this._playlists != null) {
      data['playlists'] = this._playlists!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Playlists {
  int? _id;
  String? _playlist;

  Playlists({int? id, String? playlist}) {
    if (id != null) {
      this._id = id;
    }
    if (playlist != null) {
      this._playlist = playlist;
    }
  }

  int? get id => _id;
  set id(int? id) => _id = id;
  String? get playlist => _playlist;
  set playlist(String? playlist) => _playlist = playlist;

  Playlists.fromJson(Map<String, dynamic> json) {
    _id = json['id'];
    _playlist = json['playlist'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this._id;
    data['playlist'] = this._playlist;
    return data;
  }
}
