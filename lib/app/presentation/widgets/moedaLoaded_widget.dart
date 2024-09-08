import 'package:extended_masked_text/extended_masked_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:projeto_flutter01/app/blocs/moeda_bloc.dart';

class MoedaloadedWidget extends StatefulWidget {
  const MoedaloadedWidget({super.key});

  @override
  State<MoedaloadedWidget> createState() => _MoedaloadedWidgetState();
}

class _MoedaloadedWidgetState extends State<MoedaloadedWidget> {
  late MoedaBloc bloc;
  late MoneyMaskedTextController moedaTextController1;
  late MoneyMaskedTextController moedaTextController2;

  @override
  void initState() {
    bloc = BlocProvider.of<MoedaBloc>(context);
    moedaTextController1 = MoneyMaskedTextController();
    moedaTextController2 = MoneyMaskedTextController();
    super.initState();
  }

  @override void dispose() {
    moedaTextController1.dispose();
    moedaTextController2.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<MoedaBloc, MoedaState>(builder: (context, state) {
      state = state as MoedaLoaded;

      moedaTextController1.updateValue(state.input1);
      moedaTextController2.updateValue(state.input2);

      return Padding(
        padding: const EdgeInsets.all(16.0),
        child: Container(
          width: 400,
          child: Card(
            color: const Color(0xFFFFFFFF),
            elevation: 5,
            child: Padding(
              padding: const EdgeInsets.all(24.0),
              child: Column(
                children: [
                  Row(
                    children: [
                      DropdownButtonHideUnderline(
                        child: DropdownButton<String>(
                          value: state.moedaInfo.rate.code,
                          items: state.dropdownStringItems.map((String item) {
                            return DropdownMenuItem<String>(
                              value: item,
                              child: Row(
                                children: [
                                  ClipOval(
                                    child: Image.asset(
                                      'assets/${item}_flag.png',
                                      width: 35,
                                      height: 35,
                                      fit: BoxFit.cover,
                                  )),
                                  const SizedBox(width: 10),
                                  Text(item),
                                ],
                              ),
                            );
                          }).toList(),
                          onChanged: (value) {
                            bloc
                                .add(FetchMoeda(tipoConversao: value!));
                          },
                        ),
                      ),
                      // const SizedBox(width: 10),
                      Expanded(
                        flex: 8,
                        child: TextField(
                          controller: moedaTextController1,
                          keyboardType: TextInputType.number,
                          onChanged: (_) {
                            bloc
                                .add(UpdateConvertToReal(moedaTextController1.numberValue));
                          },
                          decoration: const InputDecoration(
                            border: OutlineInputBorder(),
                          ),
                        ),
                      ),
                    ],
                  ),
                  const Divider(
                    color: Colors.grey,
                    thickness: 2,
                    height: 60,
                  ),
                  Row(
                    children: [
                      ClipOval(
                        child: Image.asset(
                          'assets/BRA_flag.png',
                          width: 35,
                          height: 35,
                          fit: BoxFit.cover,
                        ),
                      ),
                      const SizedBox(width: 10),
                      const Text(
                        "BRL",
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                      const SizedBox(width: 10),
                      Expanded(
                        child: TextField(
                          controller: moedaTextController2,
                          keyboardType: TextInputType.number,
                          onChanged: (_) {
                            bloc
                                .add(UpdateConvertToCurr(moedaTextController2.numberValue));
                          },
                          decoration: const InputDecoration(
                            border: OutlineInputBorder(),
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              )),
          ),
        ),
      );
    });
  }
}
