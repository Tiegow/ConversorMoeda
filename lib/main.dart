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
    return BlocProvider(
      create: (_) => MoedaBloc(repo: MoedaRepository())..add(FetchMoeda(tipoConversao: "USD")),
      child: MaterialApp(
        themeMode: ThemeMode.system,
        theme: MyTheme.lightTheme,
        darkTheme: MyTheme.darkTheme,
        debugShowCheckedModeBanner: false,
        home: HomePage(),
      ),
    );
  }
}
