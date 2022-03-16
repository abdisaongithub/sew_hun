import 'dart:io';

import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:sew_hun/dio_api.dart';
import 'package:sew_hun/models/auth/auth_token.dart';
import 'package:sew_hun/models/auth/register.dart';
import 'package:sew_hun/providers/auth/sign_in_provider.dart';
import 'package:sew_hun/static.dart';

final registerDataProvider =
    StateNotifierProvider.autoDispose<RegisterNotifier, Register>(
  (ref) => RegisterNotifier(ref),
);

class RegisterNotifier extends StateNotifier<Register> {
  RegisterNotifier(this.ref) : super(Register());
  final Ref ref;

  register({required Register register}) async {
    final _isSignedIn = ref.watch(isSignedInProvider.notifier);
    final signInError = ref.watch(signInErrorProvider.notifier);
    final error = ref.watch(networkErrorProvider.notifier);

    Response _response;

    final storage = FlutterSecureStorage();

    try {
      var formData = {
        kEmail: register.email,
        kPassword1: register.password1,
        kPassword2: register.password2,
      };
      print('register called');
      _response = await dio_api.post(
        'auth/registration/',
        options: Options(
          headers: {HttpHeaders.hostHeader: hostAddress},
        ),
        data: FormData.fromMap(formData),
      );

      print('_response received');

      final token = AuthToken.fromJson(_response.data);

      await storage.write(key: kToken, value: token.key);

      _isSignedIn.update((state) => true);

      return token;

    } on DioError catch (e) {
      print(e.response!.data);
      signInError.state = true;
      error.state = e;
    }
  }

  void addEmail(String email) {
    state = state.copyWith(email: email);
  }

  void addPassword1(String password1) {
    state = state.copyWith(password1: password1);
  }

  void addPassword2(String password2) {
    state = state.copyWith(password2: password2);
  }
}
