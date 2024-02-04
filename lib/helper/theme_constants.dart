import 'package:flutter/material.dart';

const kLightModePrimaryColor = Color(0xff44336ff);
const TERTIARY_COLOR_DARK = Color(0xff4A4A4A);
const kIconButtonBackgroundColorDark = Color(0xff4A4A4A);
const kScaffoldBackgroundColorLight = Color(0xffff7e61);
const kScaffoldBackgroundColorDark = Color(0xff0a0e11);
const kIconButtonBackgroundColorLight = Color(0xff4A4A4A); //Todo
const kLightBlue = Color(0xffe1ebf4);

ThemeData lightMode = ThemeData(
    brightness: Brightness.light,
    colorScheme: ColorScheme.light(
      background: kScaffoldBackgroundColorLight,
      primary: kLightBlue /*Colors.grey.shade50*/,
      secondary: Colors.blueAccent,
      brightness: Brightness.light,
    ),
    scaffoldBackgroundColor: kScaffoldBackgroundColorLight,
    iconButtonTheme: const IconButtonThemeData(
        style: ButtonStyle(
            backgroundColor: MaterialStatePropertyAll<Color>(
                kIconButtonBackgroundColorLight))),
    floatingActionButtonTheme: FloatingActionButtonThemeData(
        backgroundColor: kScaffoldBackgroundColorLight));

ThemeData darkMode = ThemeData(
    brightness: Brightness.dark,
    colorScheme: ColorScheme.dark(
        brightness: Brightness.dark,
        background: Color(0xff0A0E11),
        primary: Color(0xff2B2C2E),
        secondary: Colors.grey.shade700,
        tertiary: TERTIARY_COLOR_DARK),
    scaffoldBackgroundColor: kScaffoldBackgroundColorDark,
    iconButtonTheme: const IconButtonThemeData(
      style: ButtonStyle(
          backgroundColor:
              MaterialStatePropertyAll<Color>(kIconButtonBackgroundColorDark)),
    ),
    floatingActionButtonTheme: FloatingActionButtonThemeData(
        backgroundColor: kScaffoldBackgroundColorDark));
