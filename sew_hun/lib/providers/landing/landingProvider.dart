import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:sew_hun/dio_api.dart';
import 'package:sew_hun/models/landing/landing.dart';
import 'package:sew_hun/providers/auth/token_provider.dart';
import 'package:sew_hun/providers/favorite/toggle_favorite_provider.dart';
import 'package:sew_hun/static.dart';

final landingProvider = FutureProvider<Landing>((ref) async {
  final token = ref.watch(localTokenProvider);
  print('landing provider');
  Response _response = await dio_api.get(
    'blog/landing/',
    options: Options(
      headers: {
        kAuthorization: 'Token ${token.value}',
      },
    ),
  );
  final landing = Landing.fromJson(_response.data);
  ref.read(favListProvider.notifier).add(favs: landing.favorites!);
  print(_response.statusCode);
  return landing;
});
