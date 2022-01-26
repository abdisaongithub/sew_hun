import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:sew_hun/static.dart';

final credentialsProvider =
StateNotifierProvider<CredentialsNotifier, Map<String, String>>((ref) {
  return CredentialsNotifier();
});

class CredentialsNotifier extends StateNotifier<Map<String, String>> {
  CredentialsNotifier() : super({kUsername: '', kPassword: ''});

  void setUsername(String username) {
    final newState = state;
    newState.update(kUsername, (value) => username);
    state = newState;
  }

  void setPassword(String password) {
    final newState = state;
    newState.update(kPassword, (value) => password);
    state = newState;
  }

}
