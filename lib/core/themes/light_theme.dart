import 'package:flutter/material.dart';

abstract class LightTheme {
  static final ThemeData data = ThemeData(
    scaffoldBackgroundColor: Colors.white,
    textTheme: TextTheme(),
    colorScheme: ColorScheme(
      brightness: Brightness.light,
      primary: Colors.blue,
      onPrimary: Colors.white,
      secondary: Color(0xff1e223b),
      tertiary: Color(0xff3c5480),
      onTertiary: Colors.white,
      onSecondary: Colors.white,
      error: Colors.red,
      onError: Colors.white,
      surface: Colors.white,
      onSurface: Colors.black,
    ),
  );
}
