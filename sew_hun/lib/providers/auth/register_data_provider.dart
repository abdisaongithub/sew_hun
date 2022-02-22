import 'package:dio/dio.dart';
import 'package:either_dart/either.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:sew_hun/dio_api.dart';
import 'package:sew_hun/models/auth/auth_token.dart';
import 'package:sew_hun/models/auth/register.dart';
import 'package:sew_hun/providers/auth/sign_in_provider.dart';
import 'package:sew_hun/static.dart';



final registerDataProvider =
    StateNotifierProvider<RegisterNotifier, Register>(
  (ref) => RegisterNotifier(ref),
);

class RegisterNotifier extends StateNotifier<Register> {
  RegisterNotifier(this.ref) : super(Register());
  final Ref ref;
  register() async {
    final _isSignedIn = ref.watch(isSignedInProvider.notifier);
    final signInError = ref.watch(signInErrorProvider.notifier);
    Response _response;
    final storage = FlutterSecureStorage();
    try {
      _response = await dio_api.post('auth/registration/',
          data: FormData.fromMap({
            kEmail: state.email,
            kPassword1: state.password1,
            kPassword2: state.password2
          }));
      final token = AuthToken.fromJson(_response.data);

      await storage.write(key: kToken, value: token.key);

      _isSignedIn.update((state) => true);

      return token;
    } on DioError catch(e){
      signInError.state = true;
      print(e.error.toString());
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
