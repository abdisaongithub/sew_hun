import 'package:flutter_riverpod/flutter_riverpod.dart';

final isSignedInProvider = StateProvider<bool>((ref) => false);

final signInErrorProvider = StateProvider<bool>((ref) => false);

