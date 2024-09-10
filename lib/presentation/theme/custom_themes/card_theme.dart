import 'package:flutter/material.dart';

import '../theme_colors.dart';

class MyCardTheme {
  MyCardTheme._();

  static CardTheme lightCardTheme = CardTheme(
      color: MyColors.branco,
      elevation: 5,
  );
  static CardTheme darkCardTheme = CardTheme(
      color: MyColors.preto,
      elevation: 5,
  );
}