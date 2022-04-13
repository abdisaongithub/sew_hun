import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:sew_hun/dio_api.dart';
import 'package:sew_hun/models/landing/landing.dart';
import 'package:sew_hun/providers/auth/token_provider.dart';
import 'package:sew_hun/static.dart';

final landingProvider = FutureProvider<Landing>((ref) async {
  final token = ref.watch(localTokenProvider);

  Response _response = await dio_api.get(
    'blog/landing/',
    options: Options(
      headers: {
        kAuthorization: 'Token ${token.value}',
      },
    ),
  );
  return Landing.fromJson(_response.data);
});
