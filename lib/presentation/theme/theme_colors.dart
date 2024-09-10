import 'package:flutter/material.dart';

class MyColors {
  MyColors._();

  static Color branco = const Color(0xE6FFFFFF);
  static Color preto = const Color(0xCD0C0C0C);
  static LinearGradient backGroundGradient = const LinearGradient(
      colors: [Color(0xffffffff), Color(0xfff7ecf8), Color(0xffc4eaed)],
      stops: [0, 0.5, 1],
      begin: Alignment.topRight,
      end: Alignment.bottomLeft,
  );
}
