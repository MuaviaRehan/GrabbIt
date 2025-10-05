import 'package:flutter/material.dart';

ThemeData lightmode = ThemeData(
  colorScheme: ColorScheme.light(
    surface: Colors.grey.shade100,             // Backgrounds
    primary: Colors.deepPurple.shade100,       // Buttons / highlights
    secondary: Colors.deepPurple,     // Cards / accents
    tertiary: Colors.white,                    // Tiles / containers
    inversePrimary: Colors.black87,            // Text/icons
  ),
  scaffoldBackgroundColor: Colors.grey.shade100,
  appBarTheme: AppBarTheme(
    backgroundColor: Colors.transparent,
    elevation: 0,
    foregroundColor: Colors.deepPurple.shade400,
  ),
);
