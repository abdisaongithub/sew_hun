import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:sew_hun/dio_api.dart';
import 'package:sew_hun/models/blog/post.dart';
import 'package:sew_hun/providers/auth/token_provider.dart';
import 'package:sew_hun/static.dart';

final postProvider = FutureProvider.family<Post, int>((ref, id) async {
  final token = ref.watch(localTokenProvider);
  Response _response = await dio_api.get(
    'blog/posts/${id}/',
    options: Options(
      headers: {
        kAuthorization: 'Token ${token.value}',
      },
    ),
  );

  return Post.fromJson(_response.data);
});
