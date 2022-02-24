import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:youtube_explode_dart/youtube_explode_dart.dart';

final playlistProvider = FutureProvider<Playlist>((ref) async {
  final yt = YoutubeExplode();
  Playlist _playlist;
  _playlist = await yt.playlists.get('PLfHJBDkfSvdBH-rojMOSxxZmbW4lurHUI');
  return _playlist;
});
