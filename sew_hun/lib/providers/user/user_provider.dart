import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:sew_hun/dio_api.dart';
import 'package:sew_hun/models/user/user.dart';
import 'package:sew_hun/providers/auth/token_provider.dart';
import 'package:sew_hun/static.dart';

final userProvider = FutureProvider<User>((ref) async {
  final token = ref.watch(localTokenProvider);
  print(token.value.toString());
  Response _response = await dio_api.get(
    'me/',
    options: Options(
      headers: {
        kAuthorization: 'Token ${token.value}'
      }
    ),
  );

  return User.fromJson(_response.data);

});
