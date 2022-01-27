import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:sew_hun/dio_api.dart';
import 'package:sew_hun/models/auth/auth_token.dart';
import 'package:sew_hun/providers/auth/sign_in_provider.dart';
import 'package:sew_hun/static.dart';
import 'credentials_provider.dart';

// final authTokenProvider = FutureProvider<AuthToken>(
//   (ref) async {
//     final creds = ref.watch(credentialsProvider);
//     Response _response = await dio_api.post(
//       'auth/login/',
//       data: FormData.fromMap({
//         kEmail: creds[kEmail],
//         kPassword: creds[kPassword],
//       }),
//     );
//     return AuthToken.fromJson(_response.data.toString());
//   },
// );

final newAuth = StateNotifierProvider<AuthNotifier, AuthToken>(
  (ref) => AuthNotifier(ref),
);

class AuthNotifier extends StateNotifier<AuthToken> {
  AuthNotifier(this._ref) : super(AuthToken(key: 'error'));
  final Ref _ref;

  void login() async {

    final creds = _ref.watch(credentialsProvider);
    final isSignedIn = _ref.watch(isSignedInProvider.notifier);
    final signInError = _ref.watch(signInErrorProvider.notifier);

    try {
      Response _response = await dio_api.post(
        'auth/login/',
        data: FormData.fromMap({
          kEmail: creds[kEmail],
          kPassword: creds[kPassword],
        }),
      );
      // print(_response.statusCode);
      if (_response.statusCode == 200){
        isSignedIn.state = true;
      }
      state = AuthToken.fromJson(_response.data);
      // print('Key: ' + state.key.toString());
    } on DioError{
      signInError.state = true;
      print('Network Error');
    } catch (e) {
      // print(e.toString());
      print('Error Occurred');
    }
  }
}
