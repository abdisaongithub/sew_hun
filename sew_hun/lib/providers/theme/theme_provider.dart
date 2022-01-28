import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

// THEME PROVIDERS

// THEMES
// light
final _theme = ThemeData();

//dark
final _darkTheme = ThemeData();

// EXTENSIONS AND CLASSES

class CustomThemeData {
  final double imageSize;
  final double color;

  CustomThemeData({
    this.imageSize = 100,
    this.color = 2,
  });
}


final _customLightTheme = CustomThemeData(
  imageSize: 150,
);

final _customDarkTheme = CustomThemeData();

extension CustomTheme on ThemeData {
  CustomThemeData get custom =>
      brightness == Brightness.dark ? _customDarkTheme : _customLightTheme;
}

// THEME PROVIDERS
final lightThemeProvider = Provider((ref) => _theme);
final darkThemeProvider = Provider((ref) => _darkTheme);
final themeModeProvider = StateProvider((ref) => ThemeMode.light);
