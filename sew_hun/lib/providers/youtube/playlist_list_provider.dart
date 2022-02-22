import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:sew_hun/dio_api.dart';
import 'package:sew_hun/models/youtube/Playlist.dart';
import 'package:sew_hun/providers/auth/token_provider.dart';

import '../../static.dart';

final playlistListProvider = FutureProvider<Playlist>(
  (ref) async {
    final token = ref.watch(localTokenProvider);
    Response _response = await dio_api.get(
      'blog/playlists/',
      options: Options(headers: {kAuthorization: 'Token ${token.value}'}),
    );

    return Playlist.fromJson(_response.data);
  },
);
