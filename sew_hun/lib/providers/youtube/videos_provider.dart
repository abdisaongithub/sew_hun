import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:youtube_explode_dart/youtube_explode_dart.dart';

final videosProvider = FutureProvider<ChannelUploadsList>((ref) async {

  final yt = YoutubeExplode();
  ChannelUploadsList _channelUploadsList;
    _channelUploadsList = await yt.channels.getUploadsFromPage('UCyEPtN21cZOvL4YyCVDo_BA', VideoSorting.newest);

  return _channelUploadsList;
});