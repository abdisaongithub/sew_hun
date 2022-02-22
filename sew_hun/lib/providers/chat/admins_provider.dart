import 'package:dio/dio.dart';
import 'package:riverpod/riverpod.dart';
import 'package:sew_hun/dio_api.dart';
import 'package:sew_hun/models/chat/admins.dart';
import 'package:sew_hun/providers/auth/token_provider.dart';
import 'package:sew_hun/static.dart';

final adminsProvider = FutureProvider<Admins>((ref) async {
  final token = ref.watch(localTokenProvider);
  Response _response = await dio_api.get(
    'chat/admins/',
    options: Options(
      headers: {
        kAuthorization: 'Token ${token.value}',
      },
    ),
  );

  return Admins.fromJson(_response.data);
});