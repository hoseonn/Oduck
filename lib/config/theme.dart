import 'package:flutter/material.dart';

/// Colors from Tailwind CSS (v3.0) - June 2022
///
/// https://tailwindcss.com/docs/customizing-colors

const Color primaryColor = Color(0xFFB58BC1);

const int _textColor = 0xFF9CA3AF;
const MaterialColor textSwatch = MaterialColor(_textColor, <int, Color>{
  000: Color(0xFFFFFFFF),
  100: Color(0xFFF7F9FA),
  200: Color(0xFFF1F4F6),
  300: Color(0xFFDADEE5),
  400: Color(0xFFC2C6CE),
  500: Color(_textColor),
  600: Color(0xFF787E89),
  700: Color(0xFF5A616B),
  800: Color(0xFF363C45),
  900: Color(0xFF141C21),
});

const Color errorColor = Color(0xFFDC2626); // red-600

final ColorScheme lightColorScheme = ColorScheme.light(
  // primary: primarySwatch.shade500,
  // secondary: primarySwatch.shade500,
  onSecondary: Colors.white,
  error: errorColor,
  background: textSwatch.shade200,
  onBackground: textSwatch.shade500,
  onSurface: textSwatch.shade500,
  // surface: textSwatch.shade50,
  surfaceVariant: Colors.white,
  shadow: textSwatch.shade900.withOpacity(.1),
);

final ColorScheme darkColorScheme = ColorScheme.dark(
  // primary: primarySwatch.shade500,
  // secondary: primarySwatch.shade500,
  onSecondary: Colors.white,
  error: errorColor,
  background: const Color(0xFF171724),
  onBackground: textSwatch.shade400,
  onSurface: textSwatch.shade300,
  surface: const Color(0xFF262630),
  surfaceVariant: const Color(0xFF282832),
  shadow: textSwatch.shade900.withOpacity(.2),
);

final ThemeData lightTheme = ThemeData(
  colorScheme: lightColorScheme,
  textTheme: TextTheme(
    displayLarge: TextStyle(
      color: textSwatch.shade700,
    ),
    displayMedium: TextStyle(
      color: textSwatch.shade600,
    ),
    displaySmall: TextStyle(
      color: textSwatch.shade500,
    ),
    headlineLarge: TextStyle(
      color: textSwatch.shade700,
    ),
    headlineMedium: TextStyle(
      color: textSwatch.shade600,
    ),
    headlineSmall: TextStyle(
      color: textSwatch.shade500,
    ),
    titleLarge: TextStyle(
      color: textSwatch.shade700,
    ),
    titleMedium: TextStyle(
      color: textSwatch.shade600,
    ),
    titleSmall: TextStyle(
      color: textSwatch.shade500,
    ),
    bodyLarge: TextStyle(
      color: textSwatch.shade700,
    ),
    bodyMedium: TextStyle(
      color: textSwatch.shade600,
    ),
    bodySmall: TextStyle(
      color: textSwatch.shade500,
    ),
    labelLarge: TextStyle(
      color: textSwatch.shade700,
    ),
    labelMedium: TextStyle(
      color: textSwatch.shade600,
    ),
    labelSmall: TextStyle(
      color: textSwatch.shade500,
    ),
  ),
);

final ThemeData darkTheme = lightTheme.copyWith(
  colorScheme: darkColorScheme,
  textTheme: TextTheme(
    displayLarge: TextStyle(
      color: textSwatch.shade200,
    ),
    displayMedium: TextStyle(
      color: textSwatch.shade300,
    ),
    displaySmall: TextStyle(
      color: textSwatch.shade400,
    ),
    headlineLarge: TextStyle(
      color: textSwatch.shade200,
    ),
    headlineMedium: TextStyle(
      color: textSwatch.shade300,
    ),
    headlineSmall: TextStyle(
      color: textSwatch.shade400,
    ),
    titleLarge: TextStyle(
      color: textSwatch.shade200,
    ),
    titleMedium: TextStyle(
      color: textSwatch.shade300,
    ),
    titleSmall: TextStyle(
      color: textSwatch.shade400,
    ),
    bodyLarge: TextStyle(
      color: textSwatch.shade200,
    ),
    bodyMedium: TextStyle(
      color: textSwatch.shade300,
    ),
    bodySmall: TextStyle(
      color: textSwatch.shade400,
    ),
    labelLarge: TextStyle(
      color: textSwatch.shade200,
    ),
    labelMedium: TextStyle(
      color: textSwatch.shade300,
    ),
    labelSmall: TextStyle(
      color: textSwatch.shade400,
    ),
  ),
);
