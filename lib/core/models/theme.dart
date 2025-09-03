import 'package:flutter/material.dart';

class AppThemes {
  static const Color primaryColor = Color.fromARGB(255, 252, 204, 74);
  static const Color secondaryColor = Color(0xFF072447);
  static const Color secondaryDarkColor = Color(0xFF1E1E1E);

  static final lightTheme = ThemeData(
    fontFamily: 'Geist',
    brightness: Brightness.light,
    primaryColor: primaryColor,
    scaffoldBackgroundColor: Colors.grey[100],
    colorScheme: const ColorScheme.light(
      primary: primaryColor,
      secondary: secondaryColor,
      surface: Colors.white,
      onPrimary: Colors.black,
      onSecondary: Colors.white,
      onSurface: Colors.black87,
    ),
    inputDecorationTheme: InputDecorationTheme(
      errorStyle: TextStyle(fontSize: 14),
      filled: true,
      fillColor: Colors.white,
      border: OutlineInputBorder(
        borderSide: BorderSide.none,
        borderRadius: BorderRadius.circular(12),
      ),
      hintStyle: const TextStyle(fontSize: 18)
    ),
    textTheme: const TextTheme(
      bodyLarge: TextStyle(
        color: Color.fromARGB(255, 1, 1, 1),
        letterSpacing: -0.5,
      ),
      bodyMedium: TextStyle(
        color: Color.fromARGB(221, 2, 2, 2),
        letterSpacing: -0.5,
      ),
      headlineMedium: TextStyle(color: Colors.black, letterSpacing: -0.5),
    ),
    textButtonTheme: TextButtonThemeData(
      style: TextButton.styleFrom(
        foregroundColor: AppThemes.primaryColor,
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 18),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
        textStyle: TextStyle(
          fontWeight: FontWeight.bold,
        )
      ),
    ),
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        backgroundColor: secondaryColor,
        foregroundColor: Colors.white,
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 18),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
        shadowColor: const Color.fromARGB(0, 158, 158, 158),
        textStyle: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)
      ),
    ),
    outlinedButtonTheme: OutlinedButtonThemeData(
      style: OutlinedButton.styleFrom(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 18),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
        iconColor: Colors.black,
        foregroundColor: Colors.black,
      ),
    ),
    iconButtonTheme: IconButtonThemeData(
      style: ButtonStyle(
        backgroundColor: WidgetStateProperty.all<Color>(
          Color.fromARGB(0, 7, 36, 71),
        ),
        foregroundColor: WidgetStateProperty.all<Color>(
          Color.fromARGB(0, 7, 36, 71),
        ),
        iconColor: WidgetStateProperty.resolveWith<Color>((states) {
          if (states.contains(WidgetState.pressed)) {
            return Colors.black;
          }
          return Colors.black; // default color
        }),
        padding: WidgetStateProperty.all<EdgeInsets>(EdgeInsets.all(8)),
        shape: WidgetStateProperty.all<OutlinedBorder>(CircleBorder()),
      ),
    ),
    appBarTheme: AppBarTheme(
      backgroundColor: Colors.grey[50],
      foregroundColor: Colors.black,
      titleTextStyle: TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: Colors.black),
    ),
  );

  static final darkTheme = ThemeData(
    fontFamily: 'Arial',
    brightness: Brightness.dark,
    primaryColor: primaryColor,
    scaffoldBackgroundColor: const Color(0xFF121212),
    colorScheme: const ColorScheme.dark(
      primary: primaryColor,
      secondary: secondaryColor,
      surface: secondaryDarkColor,
      onPrimary: Colors.black,
      onSecondary: Colors.white,
      onSurface: Colors.white70,
    ),
    textTheme: const TextTheme(
      bodyLarge: TextStyle(color: Colors.white),
      bodyMedium: TextStyle(color: Colors.white70),
      headlineMedium: TextStyle(color: Colors.white),
    ),
    appBarTheme: const AppBarTheme(
      backgroundColor: primaryColor,
      foregroundColor: Colors.black,
    ),
  );
}

