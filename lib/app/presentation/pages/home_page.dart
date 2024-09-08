import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:projeto_flutter01/app/blocs/moeda_bloc.dart';
import 'package:projeto_flutter01/app/presentation/widgets/moedaLoaded_widget.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      body: Container(
        decoration: const BoxDecoration(
            gradient: LinearGradient(
              colors: [Color(0xffffffff), Color(0xfff7ecf8), Color(0xffc4eaed)],
              stops: [0, 0.5, 1],
              begin: Alignment.topRight,
              end: Alignment.bottomLeft,
        )),
        child: Center(
          child: ListView(
              shrinkWrap: true,
              children: [Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                BlocBuilder<MoedaBloc, MoedaState>(builder: (context, state) {
                  if (state is MoedaLoading) {
                    return const CircularProgressIndicator();
                  } else if (state is MoedaLoaded) {
                    return const MoedaloadedWidget();
                  } else if (state is MoedaError) {
                    return Text(state.mensagem); //Mensagem de erro
                  } else {
                    return const Text('Selection a moeda');
                  }
                }),
              ],
            ),]
          ),
        ),
      ),
    );
  }
}
