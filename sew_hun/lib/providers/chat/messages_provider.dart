import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:sew_hun/dio_api.dart';
import 'package:sew_hun/models/chat/text_message_to_send.dart';
import 'package:sew_hun/models/chat/messages.dart';
import 'package:sew_hun/models/chat/new_message.dart';
import 'package:sew_hun/models/chat/voice_message_to_send.dart';
import 'package:sew_hun/providers/auth/sign_in_provider.dart';
import 'package:sew_hun/providers/auth/token_provider.dart';
import 'package:sew_hun/providers/chat/chat_id_provider.dart';
import 'package:sew_hun/static.dart';

final messagesProvider = FutureProvider<Messages>(
  (ref) async {
    final token = ref.watch(localTokenProvider);
    final chatId = ref.watch(chatIdProvider.state).state;
    Response _response = await dio_api.get(
      'chat/messages/$chatId/',
      options: Options(headers: {kAuthorization: 'Token ${token.value}'}),
    );

    return Messages.fromJson(_response.data);
  },
);

// final sendMessageProvider =
//     FutureProvider.family<NewMessage, TextMessageToSend>((ref, message) async {
//   final token = ref.watch(localTokenProvider);
//   // final chatId = ref.watch(chatIdProvider.state).state;
//   Response _response = await dio_api.post(
//     'chat/messages/',
//     options: Options(headers: {kAuthorization: 'Token ${token.value}'}),
//     data: FormData.fromMap(
//       {
//         kChatId: message.chatId,
//         kText: message.text,
//       },
//     ),
//   );
//
//   return NewMessage.fromJson(_response.data);
// });

final messageProvider = StateNotifierProvider<MessageNotifier, NewMessage>(
  (ref) => MessageNotifier(ref),
);

class MessageNotifier extends StateNotifier<NewMessage> {
  MessageNotifier(this._ref) : super(NewMessage());
  final Ref _ref;

  void sendText(TextMessageToSend _textToSend) async {
    final error = _ref.watch(networkErrorProvider.state);
    final token = _ref.watch(localTokenProvider);

    try {
      Response _response = await dio_api.post(
        'chat/messages/',
        options: Options(headers: {kAuthorization: 'Token ${token.value}'}),
        data: FormData.fromMap(
          {
            kChatId: _textToSend.chatId,
            kText: _textToSend.text,
          },
        ),
      );
      // print(_response.statusCode);

      state = NewMessage.fromJson(_response.data);
    } on DioError catch (e) {
      error.state = e;
    }
  }

  void sendVoice(VoiceMessageToSend _voice) async {

    final error = _ref.watch(networkErrorProvider.state);
    final token = _ref.watch(localTokenProvider);
    final chatId = _ref.watch(chatIdProvider.state).state;

    try {
      Response _response = await dio_api.post(
        'chat/messages/$chatId/',
        options: Options(headers: {kAuthorization: 'Token ${token.value}'}),
        data: FormData.fromMap(
          {
            kChatId: _voice.chatId,
            kText: _voice.audio,
          },
        ),
      );
      // print(_response.statusCode);
      state = NewMessage.fromJson(_response.data);
    } on DioError catch (e) {
      error.state = e;
    }
  }
}
