import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:youtube_explode_dart/youtube_explode_dart.dart';

final channelProvider = FutureProvider<Channel>(
  (ref) async {
    final yt = YoutubeExplode();
    Channel _channel = await yt.channels.get('UCyEPtN21cZOvL4YyCVDo_BA');
    yt.close();
    return _channel;
  },
);
