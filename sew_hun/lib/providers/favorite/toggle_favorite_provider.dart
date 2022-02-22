import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:sew_hun/dio_api.dart';
import 'package:sew_hun/providers/auth/token_provider.dart';
import 'package:sew_hun/providers/landing/landingProvider.dart';
import 'package:sew_hun/static.dart';

final toggleFavoriteProvider = FutureProvider.family<bool, String>(
  (ref, String post) async {
    final token = ref.watch(localTokenProvider);
    Response _response = await dio_api.post(
      'blog/favorites/',
      data: FormData.fromMap({'post': post}),
      options: Options(headers: {kAuthorization: 'Token ${token.value}'}),
    );

    ref.refresh(landingProvider);

    if (_response.statusCode == 200) {
      return true;
    } else {
      return false;
    }
  },
);
