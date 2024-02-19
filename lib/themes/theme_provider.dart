import 'package:flutter/material.dart';
import 'package:flutter_app/themes/dark_mode.dart';
import 'package:flutter_app/themes/light_mode.dart';

class ThemeProvider extends ChangeNotifier {
  static final ThemeData _initThemeData = lightModeTheme;

  ThemeData _themeData = _initThemeData;

  ThemeData get themeData => _themeData;

  bool get isDarkMode => _themeData == darkModeTheme;

  set themeData(ThemeData themeData) {
    _setThemeData(themeData);
  }

  void toggleTheme() {
    if (isDarkMode) {
      _setThemeData(lightModeTheme);
    } else {
      _setThemeData(darkModeTheme);
    }
  }

  void reset() {
    _setThemeData(_initThemeData);
  }

  void _setThemeData(ThemeData themeData) {
    _themeData = themeData;
    notifyListeners();
  }
}
