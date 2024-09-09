import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:rxdart/rxdart.dart';

import '../models/moeda_model.dart';
import '../repositories/moeda_repository.dart';

part 'moeda_event.dart';
part 'moeda_state.dart';

class MoedaBloc extends Bloc<MoedaEvent, MoedaState> {
  final MoedaRepository repo;

  //Transformando uma stream de eventos
  EventTransformer<E> _debounce<E>(Duration duracao) {
    /*
        - Testando rxdart (recurso não essencial para esta aplicação)
          - Usando debounce para controlar o fluxo dos eventos do bloc
          - switchMap cancela o processamento de uma stream anterior e substitui por uma nova, com um novo evento
       */
    return (streamEventos, mapper) => streamEventos.debounceTime(duracao).switchMap(mapper);
  }

  MoedaBloc({required this.repo}) : super(MoedaLoading()) {
    const Duration streamDebounceTime = Duration(milliseconds: 300); //Duração em milisegundos do debounce

    on<FetchMoeda>((event, emit) async {
      emit(MoedaLoading());

      try {
        final moedaRes = await repo.fetch(event.tipoConversao);
        emit(MoedaLoaded(input1: 1, input2: moedaRes.rate.bid, moedaInfo: moedaRes));
      } catch (err) {
        emit(MoedaError(mensagem: err.toString()));
      }
    },
      transformer: _debounce(streamDebounceTime)
    );

    // Atualiza os valores para conversão da moeda selecionada para o Real
    on<UpdateConvertToReal>((event, emit){
      if (state is MoedaLoaded) {
        final stateAtual = state as MoedaLoaded;
        if (event.inputVal.isNaN) {
          emit(MoedaLoaded(moedaInfo: stateAtual.moedaInfo, input1: event.inputVal, input2: 0));
        } else {
          final double input = event.inputVal;
          final double converted = input * stateAtual.moedaInfo.rate.bid;
          emit(MoedaLoaded(moedaInfo: stateAtual.moedaInfo, input1: event.inputVal, input2: converted));
        }
      }
    },
      transformer: _debounce(streamDebounceTime)
    );

    // Atualiza os valores para conversão do Real para a moeda selecionada
    on<UpdateConvertToCurr>((event, emit){
      if (state is MoedaLoaded) {
        final stateAtual = state as MoedaLoaded;
        if (event.inputVal.isNaN) {
          emit(MoedaLoaded(moedaInfo: stateAtual.moedaInfo, input1: 0, input2: event.inputVal));
        } else {
          final double input = event.inputVal;
          final converted = input / stateAtual.moedaInfo.rate.bid;
          emit(MoedaLoaded(moedaInfo: stateAtual.moedaInfo, input1: converted, input2: event.inputVal));
        }
      }
    },
      transformer: _debounce(streamDebounceTime)
    );
  }
}
