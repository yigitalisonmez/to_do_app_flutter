import 'package:flutter/material.dart';

const kLightModePrimaryColor = Color(0xfffcfff2);
const TERTIARY_COLOR_DARK = Color(0xff4A4A4A);

const kScaffoldBackgroundColorLight = Color(0xffbbdfed); //0xffff7e61
const kScaffoldBackgroundColorDark = Color(0xff1a1a1a);

const kCheckboxFillColorDark = Color(0xff4A4A4A);
const kCheckboxFillColorLight = Color(0xffc2cef9);

const kCheckboxCheckColorDark = Colors.white;
const kCheckboxCheckColorLight = Colors.black;

const kDrawerColorLight = Color(0xffc2cef9);

const temp = Color(0xff6a8cec);
const kTaskListBackgroundLight = Color(0xfffff1eb);

const List<Color> homePagePalette = [
  Color(0xfffffdfa),
  Color(0xfffff1eb),
  Color(0xfffd8466),
  Color(0xff6a8cec)
];
const List<Color> cardColors = [
  Color(0xfff5f378),
  Color(0xffdcc1ff),
  Color(0xffec704b)
];

ThemeData darkMode = ThemeData(
  textSelectionTheme: const TextSelectionThemeData(cursorColor: Colors.white),
  brightness: Brightness.dark,
  primaryColor: const Color(0xff1a1a1a),
  colorScheme: ColorScheme.dark(
      brightness: Brightness.dark,
      background: const Color(0xff0A0E11),
      primary: const Color(0xff2B2C2E),
      secondary: Colors.grey.shade700,
      tertiary: TERTIARY_COLOR_DARK),
  scaffoldBackgroundColor: kScaffoldBackgroundColorDark,

  /// TEXT THEME
  textTheme: const TextTheme(
    displayMedium: TextStyle(fontFamily: 'DotGothic16'),
    bodySmall: TextStyle(fontFamily: 'Roboto'),
    bodyMedium: TextStyle(fontFamily: 'Roboto'),
    bodyLarge: TextStyle(fontFamily: 'Roboto'),
  ),

  ///FLOATING ACTION BUTTON
  floatingActionButtonTheme: const FloatingActionButtonThemeData(
      backgroundColor: kScaffoldBackgroundColorDark),

  ///CHECKBOX
  checkboxTheme: CheckboxThemeData(
      checkColor: MaterialStateProperty.all(kCheckboxCheckColorDark),
      fillColor: MaterialStateProperty.all(kCheckboxFillColorDark),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(4)),
      side: const BorderSide(width: 0)),

  ///INPUT DECORATION
  inputDecorationTheme: InputDecorationTheme(
    filled: true,
    fillColor: Color(0xff1a1a1a),
    border: const OutlineInputBorder(),
    focusedBorder: OutlineInputBorder(
      borderSide: const BorderSide(),
      borderRadius: BorderRadius.circular(15.0),
    ),
    enabledBorder: OutlineInputBorder(
      borderSide: const BorderSide(
        color: Colors.black,
      ),
      borderRadius: BorderRadius.circular(15.0),
    ),
  ),

  ///APP BAR THEME
  appBarTheme: const AppBarTheme(backgroundColor: kScaffoldBackgroundColorDark),

  /// DIALOG THEME
  dialogTheme: const DialogTheme(
    backgroundColor: Colors.black,
  ),

  /// TEXT BUTTON THEME
  textButtonTheme: TextButtonThemeData(
    style: ButtonStyle(
      backgroundColor: MaterialStateProperty.all(cardColors[1]),
    ),
  ),
);

ThemeData lightMode = ThemeData(
  textSelectionTheme: const TextSelectionThemeData(cursorColor: Colors.black),
  brightness: Brightness.light,
  colorScheme: const ColorScheme.light(
    background: kScaffoldBackgroundColorLight,
    primary: kLightModePrimaryColor /*Colors.grey.shade50*/,
    secondary: Colors.blueAccent,
    brightness: Brightness.light,
  ),

  scaffoldBackgroundColor: kScaffoldBackgroundColorLight,
  /*homePagePalette[0]*/

  ///APPBAR THEME
  appBarTheme:
      const AppBarTheme(backgroundColor: kScaffoldBackgroundColorLight),

  ///FLOATING ACTION BUTTON
  floatingActionButtonTheme: const FloatingActionButtonThemeData(
      backgroundColor: kScaffoldBackgroundColorLight),

  ///CHECKBOX
  checkboxTheme: CheckboxThemeData(
    checkColor: MaterialStateProperty.all(kCheckboxCheckColorLight),
    fillColor: MaterialStateProperty.all(kCheckboxFillColorLight),
    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(4)),
    side: const BorderSide(width: 1.0),
  ),

  ///INPUT DECORATION
  inputDecorationTheme: InputDecorationTheme(
    filled: true,
    fillColor: Color(0xfff2f2f7),
    border: const OutlineInputBorder(),
    focusedBorder: OutlineInputBorder(
      borderSide: const BorderSide(
        color: Colors.white,
      ),
      borderRadius: BorderRadius.circular(15.0),
    ),
    enabledBorder: OutlineInputBorder(
      borderSide: const BorderSide(
        color: Colors.white,
      ),
      borderRadius: BorderRadius.circular(15.0),
    ),
  ),

  ///DRAWER THEME
  drawerTheme: const DrawerThemeData(backgroundColor: kDrawerColorLight),

  /// DIALOG THEME
  dialogTheme: DialogTheme(
    backgroundColor: Colors.white,
  ),

  /// TEXT BUTTON THEME
  textButtonTheme: TextButtonThemeData(
    style: ButtonStyle(
      textStyle: MaterialStateProperty.all(
          const TextStyle(color: Colors.black, fontWeight: FontWeight.w900)),
      backgroundColor: MaterialStateProperty.all(kScaffoldBackgroundColorLight),
    ),
  ),
);
