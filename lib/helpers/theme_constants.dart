import 'package:flutter/material.dart';

const kBackgroundColorDark = Color(0xff9BA4B5);
const kPrimaryColorDark = Color(0xff212A3E);
const kSecondaryColorDark = Color(0xff394867);
const kTertiaryColorDark = Color(0xffF1F6F9);

const kLightModePrimaryColor = Color(0xfffcfff2);
const TERTIARY_COLOR_DARK = Color(0xff4A4A4A);

const kScaffoldBackgroundColorLight = Color(0xffbbdfed); //0xffff7e61
const kScaffoldBackgroundColorDark = Color(0xff363434);

const kCheckboxFillColorDark = Color(0xff4A4A4A);
const kCheckboxFillColorLight = Color(0xffc2cef9);

const kCheckboxCheckColorDark = Colors.white;
const kCheckboxCheckColorLight = Colors.black;

const kDrawerColorLight = Color(0xffc2cef9);

const temp = Color(0xff6a8cec);
const kTaskListBackgroundLight = Color(0xfffff1eb);

const kShimmerBaseColor = Colors.grey;
const kShimmerHighlightColor = Colors.white60;

const List<Color> cardColors = [
  Color(0xfff5f378),
  Color(0xffdcc1ff),
  Color(0xffec704b)
];

const kBgColor = Color(0xff6A9C89);
const kPrimaryColor = Color(0xff16423C);
const kSecondaryColor = Color(0xff5d8978);
const kTertiaryColor = Color(0xffE9EFEC);

/// DARK THEME
ThemeData darkMode = ThemeData(
  textSelectionTheme: const TextSelectionThemeData(cursorColor: Colors.white),
  brightness: Brightness.dark,
  primaryColor: kPrimaryColor,

  colorScheme: const ColorScheme.dark(
    brightness: Brightness.dark,
    background: kBgColor,
    primary: kPrimaryColor,
    secondary: kSecondaryColor,
    tertiary: kTertiaryColorDark,
  ),
  scaffoldBackgroundColor: kBgColor,

  /// TEXT THEME
  textTheme: const TextTheme(
    displayMedium: TextStyle(fontFamily: 'DotGothic16'),
    bodySmall: TextStyle(fontFamily: 'Roboto'),
    bodyMedium: TextStyle(fontFamily: 'Roboto'),
    bodyLarge: TextStyle(fontFamily: 'Roboto'),
  ),

  ///FLOATING ACTION BUTTON
  floatingActionButtonTheme:
      const FloatingActionButtonThemeData(backgroundColor: kSecondaryColor),

  ///CHECKBOX
  checkboxTheme: CheckboxThemeData(
      checkColor: MaterialStateProperty.all(kCheckboxCheckColorDark),
      fillColor: MaterialStateProperty.all(kCheckboxFillColorDark),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(4)),
      side: const BorderSide(width: 0)),

  ///INPUT DECORATION
  inputDecorationTheme: InputDecorationTheme(
    filled: true,
    fillColor: const Color(0xff1a1a1a),
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
  appBarTheme: const AppBarTheme(backgroundColor: kSecondaryColor),

  drawerTheme:
      const DrawerThemeData(backgroundColor: kSecondaryColor, elevation: 4.0),

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

  /// LIST TILE THEME
  listTileTheme: ListTileThemeData(
    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
  ),
);
//------------------------------------------------------------------------------

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
    fillColor: const Color(0xfff2f2f7),
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
  dialogTheme: const DialogTheme(
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
