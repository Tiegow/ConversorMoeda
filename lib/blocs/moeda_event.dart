part of 'moeda_bloc.dart';

@immutable
sealed class MoedaEvent {}

class FetchMoeda extends MoedaEvent {
  final String tipoConversao;

  FetchMoeda({required this.tipoConversao});
}

class UpdateConvertToReal extends MoedaEvent {
  final double inputVal;

  UpdateConvertToReal(this.inputVal);
}

class UpdateConvertToCurr extends MoedaEvent {
  final double inputVal;

  UpdateConvertToCurr(this.inputVal);
}