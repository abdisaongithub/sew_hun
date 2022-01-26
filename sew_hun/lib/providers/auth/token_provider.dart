import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:sew_hun/dio_api.dart';
import 'package:sew_hun/models/auth/auth_token.dart';
import 'package:sew_hun/static.dart';
import 'credentials_provider.dart';

final authTokenProvider = FutureProvider<AuthToken>(
  (ref) async {
    final creds = ref.watch(credentialsProvider);
    Response _response = await dio_api.post(
      'auth/login/',
      data: FormData.fromMap({
        kUsername: creds[kUsername],
        kPassword: creds[kPassword],
      }),
    );
    return AuthToken.fromJson(_response.data.toString());
  },
);
