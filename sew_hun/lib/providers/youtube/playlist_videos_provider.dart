import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:youtube_explode_dart/youtube_explode_dart.dart';

final playlistVideosProvider = FutureProvider<Stream<Video>>(
  (ref) {
    final yt = YoutubeExplode();
    Stream<Video> _stream =
        yt.playlists.getVideos('PLfHJBDkfSvdBH-rojMOSxxZmbW4lurHUI');
    yt.close();
    return _stream;
  },
);
