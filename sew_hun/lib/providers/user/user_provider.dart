import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:sew_hun/dio_api.dart';
import 'package:sew_hun/models/user/user_profile.dart';
import 'package:sew_hun/providers/auth/token_provider.dart';
import 'package:sew_hun/static.dart';

final userProvider = FutureProvider.autoDispose<UserProfile>((ref) async {
  final token = ref.watch(localTokenProvider);
  Response _response = await dio_api.get(
    'account/me/',
    options: Options(
      headers: {
        kAuthorization: 'Token ${token.value}'
      }
    ),
  );

  return UserProfile.fromJson(_response.data);
});
