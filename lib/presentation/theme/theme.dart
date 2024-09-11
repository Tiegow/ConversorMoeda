import 'package:Conversor_moedas/presentation/theme/custom_themes/app_bar_theme.dart';
import 'package:Conversor_moedas/presentation/theme/custom_themes/card_theme.dart';
import 'package:Conversor_moedas/presentation/theme/custom_themes/text_theme.dart';
import 'package:Conversor_moedas/presentation/theme/custom_themes/theme_extention.dart';
import 'package:Conversor_moedas/presentation/theme/theme_colors.dart';
import 'package:flutter/material.dart';

class MyTheme {
  MyTheme._(); //Construtor privado (AppTheme não precisa ser instanciado)

  //Membros estáticos da classe
  static ThemeData lightTheme = ThemeData(
    useMaterial3: true,
    brightness: Brightness.light,
    canvasColor: const Color(0xe5c4eaed),
    textTheme: MyTextTheme.lightTextTheme,
    cardTheme: MyCardTheme.lightCardTheme,
    appBarTheme: MyAppBarTheme.lightBarTheme,
    extensions: [MyCustomExtention(
      containerGradient: MyColors.backGroundLightGradient,
    )]
  );

  static ThemeData darkTheme = ThemeData(
    useMaterial3: true,
    brightness: Brightness.dark,
    canvasColor: const Color(0xE53D3000),
    textTheme: MyTextTheme.darkTextTheme,
    cardTheme: MyCardTheme.darkCardTheme,
    appBarTheme: MyAppBarTheme.darkBarTheme,
    extensions: [MyCustomExtention(
      containerGradient: MyColors.backGroundDarkGradient,
    )]
  );
}