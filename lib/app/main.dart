import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:projeto_flutter01/app/blocs/moeda_bloc.dart';
import 'package:projeto_flutter01/app/presentation/pages/home_page.dart';
import 'package:projeto_flutter01/app/repositories/moeda_repository.dart';

void main() async {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => MoedaBloc(repo: MoedaRepository())..add(FetchMoeda(tipoConversao: "USD")),
      child: const MaterialApp(
        debugShowCheckedModeBanner: false,
        home: HomePage(),
      ),
    );
  }
}
