import 'package:flutter/material.dart';

Color primary = Colors.grey.shade500;
Color primaryText = Colors.grey.shade700;
Color darkText = Colors.grey.shade900;
Color secondary = Colors.grey.shade200;
Color background = Colors.grey.shade300;
Color tertiary = Colors.white;

ThemeData lightModeTheme = ThemeData(
  colorScheme: ColorScheme.light(
    background: background,
    primary: primary,
    secondary: secondary,
    tertiary: tertiary,
    inversePrimary: background,
  ),
  scaffoldBackgroundColor: background,
  dividerTheme: const DividerThemeData(color: Colors.transparent),
  drawerTheme: DrawerThemeData(backgroundColor: background),
  listTileTheme: ListTileThemeData(
      iconColor: primary,
      textColor: primaryText,
      selectedTileColor: darkText,
      selectedColor: tertiary,
      titleTextStyle: TextStyle(fontSize: 18)),
  iconTheme: IconThemeData(color: primary),
  textTheme: TextTheme(bodyMedium: TextStyle(fontSize: 16, color: primary)),
  inputDecorationTheme: InputDecorationTheme(
      fillColor: secondary,
      filled: true,
      hintStyle: TextStyle(color: primary),
      enabledBorder:
          OutlineInputBorder(borderSide: BorderSide(color: tertiary)),
      focusedBorder:
          OutlineInputBorder(borderSide: BorderSide(color: primary))),
  filledButtonTheme: FilledButtonThemeData(
      style: ButtonStyle(
          minimumSize: MaterialStateProperty.resolveWith(
              (states) => Size.fromHeight(50)),
          // padding: MaterialStateProperty.resolveWith(
          //     (states) => EdgeInsets.fromLTRB(30, 10, 30, 10)),
          textStyle: MaterialStateTextStyle.resolveWith(
              (states) => TextStyle(fontSize: 20)))),
  // textButtonTheme: TextButtonThemeData(
  //     style: ButtonStyle(
  //         backgroundColor:
  //             MaterialStateColor.resolveWith((states) => secondary),
  //         textStyle: MaterialStateTextStyle.resolveWith(
  //             (states) => TextStyle(fontSize: 20))))
);
