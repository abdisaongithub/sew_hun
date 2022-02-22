import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:sew_hun/dio_api.dart';
import 'package:sew_hun/models/user/chat_user_profile.dart';
import 'package:sew_hun/providers/auth/token_provider.dart';
import 'package:sew_hun/static.dart';

final chatUserProfileProvider = FutureProvider<ChatUserProfile>((ref) async {
  final token = ref.watch(localTokenProvider);
  Response _response;
  _response = await dio_api.get(
    'account/profile/',
    options: Options(
        headers: {
          kAuthorization: 'Token ${token.value}'
        }
    ),
  );
  return ChatUserProfile.fromJson(_response.data);
});