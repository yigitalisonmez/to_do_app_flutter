import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'theme_constants.dart';

class ThemeProvider extends ChangeNotifier {
  ThemeData _currTheme = darkMode;
  bool isDark = true;

  get currTheme => _currTheme;

  void toggleTheme() {
    isDark ? (_currTheme = lightMode) : (_currTheme = darkMode);
    isDark = !isDark;
    notifyListeners();
  }
}
