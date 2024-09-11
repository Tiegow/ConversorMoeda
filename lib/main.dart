import 'package:Conversor_moedas/blocs/theme_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'blocs/moeda_bloc.dart';
import 'presentation/pages/home_page.dart';
import 'presentation/theme/theme.dart';
import 'repositories/moeda_repository.dart';

void main() async {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (_) => MoedaBloc(repo: MoedaRepository())
            ..add(FetchMoeda(tipoConversao: "USD")),
        ),
        BlocProvider(
          create: (_) => ThemeCubit(),
        ),
      ],
      child: BlocBuilder<ThemeCubit, ThemeState>(
        builder: (context, state) {
          return MaterialApp(
            themeMode: state.mode,
            theme: MyTheme.lightTheme,
            darkTheme: MyTheme.darkTheme,
            debugShowCheckedModeBanner: false,
            home: HomePage(),
          );
        },
      ),
    );
  }
}
