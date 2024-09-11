import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:meta/meta.dart';

part 'theme_state.dart';

class ThemeCubit extends Cubit<ThemeState> {
  ThemeCubit() : super(ThemeInitial());

  void switchTheme () {
    if (state.mode == ThemeMode.dark) {
      emit(const ThemeSwitched(ThemeMode.light));
    }
    else if (state.mode == ThemeMode.light) {
      emit(const ThemeSwitched(ThemeMode.dark));
    }
  }
}
