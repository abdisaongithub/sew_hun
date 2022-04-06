import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:sew_hun/static.dart';

// THEME PROVIDERS

// THEMES
// light
final _lightTheme = ThemeData.light();

//dark
final _darkTheme = ThemeData.dark();

// EXTENSIONS AND CLASSES

class CustomThemeData {
  final double defaultPadding = 20.0;
  final double smallPadding = 10.0;
  final double largePadding = 30.0;

  final Color textColor;
  final Color bgColor;
  final Color appBarColor;
  final Color linkColor;
  final Color bgThemeColor;
  final Color btnColor;
  final Color pillColor;
  final Color searchAppBarColor;
  final Color chatContainerColor;

  final TextStyle textStyle;

  CustomThemeData({
    this.textColor = const Color(0xFF775CB8),
    required this.bgColor,
    required this.textStyle,
    required this.appBarColor,
    required this.linkColor,
    required this.bgThemeColor,
    required this.btnColor,
    required this.pillColor,
    required this.searchAppBarColor,
    required this.chatContainerColor,
  });
}

final _customLightTheme = CustomThemeData(
  textColor: Colors.black,
  bgColor: Colors.white,
  textStyle: TextStyle(color: Colors.black),
  appBarColor: Colors.white,
  linkColor: Colors.blue,
  bgThemeColor: Colors.white,
  btnColor: Color(0xFF9BECF6),
  pillColor: Color(0xFFE5F5F7),
  searchAppBarColor: Color(0xFF9497F3),
  chatContainerColor: Color(0xFF30C270),
);

final _customDarkTheme = CustomThemeData(
  textColor: Colors.white,
  bgColor: Colors.black26,
  textStyle: TextStyle(color: Colors.white),
  appBarColor: Colors.black12,
  linkColor: Colors.blue,
  bgThemeColor: Colors.black,
  btnColor: Color(0xFF9BECF6),
  pillColor: Color(0xFFE5F5F7),
  searchAppBarColor: Color(0xFFA8AAEF),
  chatContainerColor: Color(0xFF30C270),
);

extension CustomTheme on ThemeData {
  CustomThemeData get custom => brightness == Brightness.dark ? _customDarkTheme : _customLightTheme;
}

// THEME PROVIDERS
final lightThemeProvider = Provider((ref) => _lightTheme);
final darkThemeProvider = Provider((ref) => _darkTheme);

final themeModeProvider = StateProvider((ref) {
  final theme = ref.watch(savedThemeProvider);
  if (theme.value == kLight) {
    return ThemeMode.light;
  } else if (theme.value == kDark) {
    return ThemeMode.dark;
  }
});

final savedThemeProvider = FutureProvider<String>((ref) async {
  final storage = FlutterSecureStorage();
  try {
    final res = await storage.read(key: kTheme);
    return res!;
  } catch (e) {
    await storage.write(key: kTheme, value: kLight);
    return kLight;
  }
});
