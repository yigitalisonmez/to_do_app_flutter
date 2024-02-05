import 'package:flutter/material.dart';

const kLightModePrimaryColor = Color(0xff44336ff);
const TERTIARY_COLOR_DARK = Color(0xff4A4A4A);
const kIconButtonBackgroundColorDark = Color(0xff4A4A4A);
const kScaffoldBackgroundColorLight = Color(0xffff7e61);
const kScaffoldBackgroundColorDark = Color(0xff0a0e11);
const kIconButtonBackgroundColorLight = Color(0xff4A4A4A); //Todo
const kLightBlue = Color(0xfffcfff2);

const kCheckboxFillColorDark = Color(0xff4A4A4A);
const kCheckboxFillColorLight = Color(0xffc2cef9);

const kCheckboxCheckColorDark = Colors.white;
const kCheckboxCheckColorLight = Colors.black;
//

ThemeData lightMode = ThemeData(
  brightness: Brightness.light,
  colorScheme: const ColorScheme.light(
    background: kScaffoldBackgroundColorLight,
    primary: kLightBlue /*Colors.grey.shade50*/,
    secondary: Colors.blueAccent,
    brightness: Brightness.light,
  ),
  scaffoldBackgroundColor: kScaffoldBackgroundColorLight,

  ///ICON BUTTON
  iconButtonTheme: const IconButtonThemeData(
      style: ButtonStyle(
          backgroundColor: MaterialStatePropertyAll<Color>(
              kIconButtonBackgroundColorLight))),

  ///FLOATING ACTION BUTTON
  floatingActionButtonTheme: const FloatingActionButtonThemeData(
      backgroundColor: kScaffoldBackgroundColorLight),

  ///CHECKBOX
  checkboxTheme: CheckboxThemeData(
    checkColor: MaterialStateProperty.all(kCheckboxCheckColorLight),
    fillColor: MaterialStateProperty.all(kCheckboxFillColorLight),
    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(4)),
    side: BorderSide(width: 1.0),
  ),

  ///INPUT DECORATION
  inputDecorationTheme: InputDecorationTheme(
    border: OutlineInputBorder(),
    focusedBorder: OutlineInputBorder(
      borderSide: BorderSide(
        color: Colors.black,
      ),
      borderRadius: BorderRadius.circular(15.0),
    ),
    enabledBorder: OutlineInputBorder(
      borderSide: BorderSide(
        color: Colors.black,
      ),
      borderRadius: BorderRadius.circular(15.0),
    ),
  ),
);

ThemeData darkMode = ThemeData(
  brightness: Brightness.dark,
  colorScheme: ColorScheme.dark(
      brightness: Brightness.dark,
      background: Color(0xff0A0E11),
      primary: Color(0xff2B2C2E),
      secondary: Colors.grey.shade700,
      tertiary: TERTIARY_COLOR_DARK),
  scaffoldBackgroundColor: kScaffoldBackgroundColorDark,

  /// ICON BUTTON
  iconButtonTheme: const IconButtonThemeData(
    style: ButtonStyle(
        backgroundColor:
            MaterialStatePropertyAll<Color>(kIconButtonBackgroundColorDark)),
  ),

  ///FLOATING ACTION BUTTON
  floatingActionButtonTheme: FloatingActionButtonThemeData(
      backgroundColor: kScaffoldBackgroundColorDark),

  ///CHECKBOX
  checkboxTheme: CheckboxThemeData(
      checkColor: MaterialStateProperty.all(kCheckboxCheckColorDark),
      fillColor: MaterialStateProperty.all(kCheckboxFillColorDark),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(4)),
      side: BorderSide(width: 0)),

  ///INPUT DECORATION
  inputDecorationTheme: InputDecorationTheme(
    border: OutlineInputBorder(),
    focusedBorder: OutlineInputBorder(
      borderSide: BorderSide(
        color: Colors.black,
      ),
      borderRadius: BorderRadius.circular(15.0),
    ),
    enabledBorder: OutlineInputBorder(
      borderSide: BorderSide(
        color: Colors.black,
      ),
      borderRadius: BorderRadius.circular(15.0),
    ),
  ),
);
