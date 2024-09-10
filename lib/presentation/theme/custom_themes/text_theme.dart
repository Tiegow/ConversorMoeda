import 'package:flutter/material.dart';

class MyTextTheme {
  MyTextTheme._();

  static TextTheme lightTextTheme = TextTheme(
    bodyMedium: const TextStyle().copyWith(color: Colors.black, fontWeight: FontWeight.bold)
  );

  static TextTheme darkTextTheme = TextTheme(
    bodyMedium: const TextStyle().copyWith(color: Colors.white, fontWeight: FontWeight.bold)
  );
}