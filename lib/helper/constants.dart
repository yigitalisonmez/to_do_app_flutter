import 'package:flutter/material.dart';

const kLightModePrimaryColor = Color(0xff44336ff);

ThemeData lightMode = ThemeData(
  brightness: Brightness.light,
  colorScheme: const ColorScheme.light(
    background: kLightModePrimaryColor,
    primary: Colors.cyan /*Colors.grey.shade50*/,
    secondary: Colors.blueAccent,
    brightness: Brightness.light,
  ),
);

ThemeData darkMode = ThemeData(
  brightness: Brightness.dark,
  colorScheme: ColorScheme.dark(
      background: Colors.deepPurple, brightness: Brightness.dark),
);
