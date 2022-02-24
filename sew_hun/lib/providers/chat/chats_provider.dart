import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:sew_hun/dio_api.dart';
import 'package:sew_hun/models/chat/new_chat.dart';
import 'package:sew_hun/models/user/chat_user_profile.dart';
import 'package:sew_hun/providers/auth/token_provider.dart';
import 'package:sew_hun/static.dart';

final chatsProvider = FutureProvider<ChatUserProfile>((ref) async {
  final token = ref.watch(localTokenProvider);
  Response _response = await dio_api.get(
    'chat/',
    options: Options(
      headers: {
        kAuthorization: 'Token ${token.value}',
      },
    ),
  );

  return ChatUserProfile.fromJson(_response.data);
});

final createChatProvider = FutureProvider.family<NewChat, int>((ref, id) async {
  final token = ref.watch(localTokenProvider);
  Response _response = await dio_api.post(
    'chat/',
    options: Options(
      headers: {
        kAuthorization: 'Token ${token.value}',
      },
    ),
    data: FormData.fromMap({
      'id': id.toString(),
    }),
  );

  return NewChat.fromJson(_response.data);
});