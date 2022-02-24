import 'package:flutter_riverpod/flutter_riverpod.dart';

final isAdminProvider = FutureProvider<bool>((ref) async {
  return false;
});