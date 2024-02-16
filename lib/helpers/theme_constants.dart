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

ThemeData darkMode = ThemeData(
  textSelectionTheme: TextSelectionThemeData(cursorColor: Colors.white),
  brightness: Brightness.dark,
  primaryColor: const Color(0xff1a1a1a),
  colorScheme: ColorScheme.dark(
      brightness: Brightness.dark,
      background: const Color(0xff0A0E11),
      primary: const Color(0xff2B2C2E),
      secondary: Colors.grey.shade700,
      tertiary: TERTIARY_COLOR_DARK),
  scaffoldBackgroundColor: kScaffoldBackgroundColorDark,
  textTheme:
      const TextTheme(displayMedium: TextStyle(fontFamily: 'DotGothic16')),

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
    border: const OutlineInputBorder(),
    focusedBorder: OutlineInputBorder(
      borderSide: const BorderSide(
        color: Colors.black,
      ),
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

  ///TEXT THEME
);

ThemeData lightMode = ThemeData(
  textSelectionTheme: TextSelectionThemeData(cursorColor: Colors.black),
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
    border: const OutlineInputBorder(),
    focusedBorder: OutlineInputBorder(
      borderSide: const BorderSide(
        color: Colors.black,
      ),
      borderRadius: BorderRadius.circular(15.0),
    ),
    enabledBorder: OutlineInputBorder(
      borderSide: const BorderSide(
        color: Colors.black,
      ),
      borderRadius: BorderRadius.circular(15.0),
    ),
  ),

  ///DRAWER THEME
  drawerTheme: const DrawerThemeData(backgroundColor: kDrawerColorLight),

  ///LIST TILE THEME
  //listTileTheme: ListTileThemeData(tileColor: homePagePalette[2]),

  /// DIALOG THEME
  //dialogTheme:DialogTheme(backgroundColor: ),
);
