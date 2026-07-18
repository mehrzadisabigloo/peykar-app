import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:resturant_app/core/themes/theme_main.dart';


class ThemeManager {
  final FlutterSecureStorage preferences;
  ThemeManager(this.preferences);

  static const String _themeKey = 'theme_index';

  Future<ThemeData> get theme async {
    final themeIndex = await preferences.read(
      key: _themeKey,
    );

    switch (themeIndex) {
      case '1':
        return ThemeMain.theme();
      default:
        return ThemeMain.theme();
    }
  }

  Future<void> saveTheme(int index) async {
    await preferences.write(key: _themeKey, value: index.toString());
  }
}
