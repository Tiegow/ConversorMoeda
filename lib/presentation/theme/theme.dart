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
    cardColor: Colors.black54,
    appBarTheme: MyAppBarTheme.lightBarTheme,
    extensions: [MyCustomExtention(
      containerGradient: const LinearGradient(
        colors: [Color(0xffffffff), Color(0xfff7ecf8), Color(0xffc4eaed)],
        stops: [0, 0.5, 1],
        begin: Alignment.topRight,
        end: Alignment.bottomLeft,),
    )]
  );

  static ThemeData darkTheme = ThemeData(
    useMaterial3: true,
    brightness: Brightness.dark,
    canvasColor: const Color(0xE53D3000),
    textTheme: MyTextTheme.darkTextTheme,
    cardTheme: MyCardTheme.darkCardTheme,
    cardColor: Colors.black54,
    appBarTheme: MyAppBarTheme.darkBarTheme,
    extensions: [MyCustomExtention(
      containerGradient: const LinearGradient(
        colors: [Color(0xFF3D3000), Color(0xFF201D17), Color(0xFF080808)],
        stops: [0, 0.5, 1],
        begin: Alignment.topRight,
        end: Alignment.bottomLeft,),
    )]
  );
}