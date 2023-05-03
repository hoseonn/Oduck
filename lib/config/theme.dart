import 'package:flutter/material.dart';

const Color primaryColor = Color(0xFFB58BC1);

ThemeData whiteTheme = ThemeData(
  brightness: Brightness.light,
  primaryColor: primaryColor,
  primarySwatch: Colors.pink,
  appBarTheme: const AppBarTheme(
    iconTheme: IconThemeData(
      color: Colors.black,
    ),
    titleTextStyle: TextStyle(
      color: Colors.black,
      fontWeight: FontWeight.bold,
      fontSize: 18,
    ),
  ),
);

ThemeData darkTheme = ThemeData(
  brightness: Brightness.dark,
  primaryColor: primaryColor,
);
