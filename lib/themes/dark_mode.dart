import 'package:flutter/material.dart';

ThemeData darkmode = ThemeData(
  brightness: Brightness.dark,
  scaffoldBackgroundColor: const Color(0xFF121212), // Deep dark background
  colorScheme: const ColorScheme.dark(
    surface: Color(0xFF1E1E1E), // Card/section background
    primary: Color(0xFFBB86FC), // Purple accent
    secondary: Color(0xFFFF5722), // Orange accent (for buttons, highlights)
    tertiary: Color(0xFF2C2C2C), // For containers
    inversePrimary: Colors.white, // Text color
  ),
  appBarTheme: const AppBarTheme(
    backgroundColor: Color(0xFF1E1E1E),
    foregroundColor: Colors.white,
    elevation: 0,
  ),
  textTheme: const TextTheme(
    bodyLarge: TextStyle(color: Colors.white),
    bodyMedium: TextStyle(color: Colors.white70),
    titleLarge: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
  ),
  elevatedButtonTheme: ElevatedButtonThemeData(
    style: ElevatedButton.styleFrom(
      backgroundColor: Color(0xFFFF5721), // orange
      foregroundColor: Colors.white,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      textStyle: const TextStyle(fontWeight: FontWeight.bold),
    ),
  ),
  cardTheme: CardTheme(
    color: const Color(0xFF1E1E1E),
    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
    elevation: 4,
    shadowColor: Colors.black.withOpacity(0.4),
  ),
);
