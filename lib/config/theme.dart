import 'package:flutter/material.dart';

/// Colors from Tailwind CSS (v3.0) - June 2022
///
/// https://tailwindcss.com/docs/customizing-colors

const Color primaryColor = Color(0xFFB58BC1);

const int _textColor = 0xFF9CA3AF;
const MaterialColor textSwatch = MaterialColor(_textColor, <int, Color>{
  50: Color(0xFFFFFFFF),
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

const Color grey000 = Color(0xFFFFFFFF);
const Color grey100 = Color(0xFFF7F9FA);
const Color grey200 = Color(0xFFF1F4F6);
const Color grey300 = Color(0xFFDADEE5);
const Color grey400 = Color(0xFFC2C6CE);
const Color grey500 = Color(0xFF9CA3AF);
const Color grey600 = Color(0xFF787E89);
const Color grey700 = Color(0xFF5A616B);
const Color grey800 = Color(0xFF363C45);
const Color grey900 = Color(0xFF141C21);

const Color errorColor = Color(0xFFDC2626); // red-600

