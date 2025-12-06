import 'dart:ui';
import 'package:flutter/material.dart';

abstract class AppColors {
  // Dynamic colors (تتغير في runtime)
  static Color primaryColor = const Color.fromARGB(255, 26, 9, 90);
  static Color shadeColor = const Color.fromARGB(255, 161, 96, 96);

  static Color primaryTextColor = Colors.black;
  static Color secondaryTextColor = Colors.white;

  static const Color lightPrimary = Color.fromARGB(255, 26, 9, 90);
  static const Color lightShade = Color.fromARGB(255, 161, 96, 96);
  static const Color lightText = Colors.black;
  static const Color lightSecondaryText = Colors.white;
  static const Color lightBackground = Color(0xFFFFFFFF);

  // Dark theme constants
  static const Color darkPrimary = Colors.white;
  static const Color darkShade = Color(0xFFBBBBBB);
  static const Color darkText = Colors.white;
  static const Color darkSecondaryText = Colors.black;
  static const Color darkBackground = Color(0xFF121212);

  // Apply light mode
  static void setLightMode() {
    primaryColor = primaryColor;
    shadeColor = lightShade;
    primaryTextColor = lightText;
    secondaryTextColor = lightSecondaryText;
  }

  // Apply dark mode
  static void setDarkMode() {
    primaryColor = darkPrimary;
    shadeColor = darkShade;
    primaryTextColor = darkText;
    secondaryTextColor = darkSecondaryText;
  }
}
