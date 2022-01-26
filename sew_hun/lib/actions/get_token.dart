import 'package:dio/dio.dart';
import 'package:sew_hun/dio_api.dart';
import 'package:sew_hun/models/token.dart';

class GetToken {
  static Future<Token> get_token(FormData formData) async {
    Token token;
    Response response = await dio_api.post('auth/login/', data: formData);
    if (response.statusCode == 200) {
      token = Token.fromMap(response.data);
    } else {
      token = Token(key: 'Error');
    }
    return token;
  }
}
