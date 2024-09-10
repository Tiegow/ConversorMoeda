import 'package:flutter/material.dart';

class MyCustomExtention extends ThemeExtension<MyCustomExtention> {
  final LinearGradient? containerGradient;

  MyCustomExtention({this.containerGradient});

  @override
  ThemeExtension<MyCustomExtention> copyWith({LinearGradient? containerGradient}) {
    return MyCustomExtention(
      containerGradient: containerGradient ?? this.containerGradient,
    );
  }

  @override
  //Interpolação entre os temas
  ThemeExtension<MyCustomExtention> lerp(covariant ThemeExtension<MyCustomExtention>? other, double t) {
    if (other is! MyCustomExtention) {
      return this;
    }
    return MyCustomExtention(
      containerGradient: LinearGradient.lerp(containerGradient, other.containerGradient, t)
    );
  }
  
}