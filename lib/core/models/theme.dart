import 'package:flutter/material.dart';

class AppThemes {
  static const Color primaryColor = Color.fromARGB(255, 252, 204, 74);
  static const Color secondaryColor = Color(0xFF072447);
  static const Color secondaryDarkColor = Color(0xFF1E1E1E);

  static final lightTheme = ThemeData(
    fontFamily: 'Geist',
    brightness: Brightness.light,
    primaryColor: primaryColor,
    scaffoldBackgroundColor: Colors.white,
    colorScheme: const ColorScheme.light(
      primary: primaryColor,
      secondary: secondaryColor,
      surface: Colors.white,
      onPrimary: Colors.black,
      onSecondary: Colors.white,
      onSurface: Colors.black87,
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
        backgroundColor: Color.fromARGB(0, 7, 36, 71),
        foregroundColor: Colors.black,
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 18),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      ),
    ),
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        backgroundColor: secondaryColor,
        foregroundColor: Colors.white,
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
        shadowColor: const Color.fromARGB(0, 158, 158, 158),
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
      titleTextStyle: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
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

// BuildContext extension for easier access to colors and styles
extension ThemeHelpers on BuildContext {
  Color get primaryColor => Theme.of(this).colorScheme.primary;
  Color get secondaryColor => Theme.of(this).colorScheme.secondary;
  Color get backgroundColor => Theme.of(this).colorScheme.surface;
  Color get surfaceColor => Theme.of(this).colorScheme.surface;

  TextStyle get bodyLarge => Theme.of(this).textTheme.bodyLarge!;
  TextStyle get bodyMedium => Theme.of(this).textTheme.bodyMedium!;
  TextStyle get headlineMedium => Theme.of(this).textTheme.headlineMedium!;
}
