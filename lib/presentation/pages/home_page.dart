import 'package:Conversor_moedas/presentation/theme/custom_themes/theme_extention.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../blocs/moeda_bloc.dart';
import '../widgets/moedaLoaded_widget.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      body: Container(
        decoration:BoxDecoration(
            gradient: Theme.of(context).extension<MyCustomExtention>()?.containerGradient),
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
