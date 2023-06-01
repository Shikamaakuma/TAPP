import 'dart:math';

import 'package:flutter/material.dart';

/// Main theme of the application
class AppTheme {

  static MaterialColor primaryColor = MaterialColorGenerator.from(const Color.fromRGBO(215, 35, 35, 1.0));
  static MaterialColor primaryBackground = MaterialColorGenerator.from(const Color.fromRGBO(58, 71, 80, 1.0));
  static MaterialColor primaryTextColor = MaterialColorGenerator.from(Colors.white);

  static ThemeData lightTheme = ThemeData(
      primarySwatch: primaryColor,
    primaryColor: primaryColor,
    scaffoldBackgroundColor: primaryBackground,
    textTheme: TextTheme(
      displayLarge: TextStyle(color: primaryTextColor),
      displayMedium: TextStyle(color: primaryTextColor),
      displaySmall: TextStyle(color: primaryTextColor),
      headlineLarge: TextStyle(color: primaryTextColor),
      headlineMedium: TextStyle(color: primaryTextColor),
      headlineSmall: TextStyle(color: primaryTextColor),
      bodyLarge: TextStyle(color: primaryTextColor),
      bodyMedium: TextStyle(color: primaryTextColor),
      bodySmall: TextStyle(color: Colors.grey),
      titleLarge: TextStyle(color: primaryColor),
      titleMedium: TextStyle(color: primaryTextColor),
      titleSmall: TextStyle(color: primaryTextColor),
    )
  );

}

/// Generate a Matrial color from a color
/// From https://mixable.blog/flutter-how-to-create-a-better-materialcolor-from-color/
class MaterialColorGenerator{
  static MaterialColor from(Color color) {
    return MaterialColor(color.value, {
      50: tintColor(color, 0.9),
      100: tintColor(color, 0.8),
      200: tintColor(color, 0.6),
      300: tintColor(color, 0.4),
      400: tintColor(color, 0.2),
      500: color,
      600: shadeColor(color, 0.1),
      700: shadeColor(color, 0.2),
      800: shadeColor(color, 0.3),
      900: shadeColor(color, 0.4),
    });
  }

  static Color shadeColor(Color color, double factor) => Color.fromRGBO(
      shadeValue(color.red, factor),
      shadeValue(color.green, factor),
      shadeValue(color.blue, factor),
      1);

  static int shadeValue(int value, double factor) =>
      max(0, min(value - (value * factor).round(), 255));

  static Color tintColor(Color color, double factor) => Color.fromRGBO(
      tintValue(color.red, factor),
      tintValue(color.green, factor),
      tintValue(color.blue, factor),
      1);

  static int tintValue(int value, double factor) =>
      max(0, min((value + ((255 - value) * factor)).round(), 255));
}