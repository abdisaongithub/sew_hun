import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:sew_hun/dio_api.dart';
import 'package:sew_hun/models/favorite/favorite.dart';
import 'package:sew_hun/providers/auth/token_provider.dart';
import 'package:sew_hun/static.dart';

final favoritesProvider = FutureProvider<Favorite>(
  (ref) async {
    final token = ref.watch(localTokenProvider);
    Response _response = await dio_api.get(
      'blog/favorites/',
      options: Options(
        headers: {
          kAuthorization: 'Token ${token.value}',
        },
      ),
    );
    return Favorite.fromJson(_response.data);
  },
);
