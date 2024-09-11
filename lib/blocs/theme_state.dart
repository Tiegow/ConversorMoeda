part of 'theme_cubit.dart';

@immutable
sealed class ThemeState {
  final ThemeMode mode;

  const ThemeState({required this.mode});
}

final class ThemeInitial extends ThemeState {
  const ThemeInitial() : super(mode: ThemeMode.light);
}

final class ThemeSwitched extends ThemeState {
  const ThemeSwitched(ThemeMode switchedMode) : super(mode: switchedMode);
}
