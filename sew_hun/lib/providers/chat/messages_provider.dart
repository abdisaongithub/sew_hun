import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:sew_hun/dio_api.dart';
import 'package:sew_hun/models/chat/message_to_send.dart';
import 'package:sew_hun/models/chat/messages.dart';
import 'package:sew_hun/models/chat/new_message.dart';
import 'package:sew_hun/providers/auth/token_provider.dart';
import 'package:sew_hun/providers/chat/chat_id_provider.dart';
import 'package:sew_hun/static.dart';

final messagesProvider = FutureProvider<Messages>(
  (ref) async {
    final token = ref.watch(localTokenProvider);
    final chatId = ref.watch(chatIdProvider.state).state;
    Response _response = await dio_api.get(
      'chat/messages/',
      options: Options(headers: {kAuthorization: 'Token ${token.value}'}),
    );

    return Messages.fromJson(_response.data);
  },
);

final createMessageProvider =
    FutureProvider.family<NewMessage, MessageToSend>((ref, val) async {
  final token = ref.watch(localTokenProvider);
  final chatId = ref.watch(chatIdProvider.state).state;
  Response _response = await dio_api.post(
    'chat/messages/',
    options: Options(headers: {kAuthorization: 'Token ${token.value}'}),
    data: FormData.fromMap(
      {
        'chat_id': val.chatId,
        'text': val.text,
      },
    ),
  );

  return NewMessage.fromJson(_response.data);
});
