part of 'moeda_bloc.dart';

@immutable
sealed class MoedaState {}

final class MoedaLoading extends MoedaState {}

final class MoedaLoaded extends MoedaState {
  final CurrencyResponse moedaInfo; //Informações da moeda
  final double input1;
  final double input2;
  static List<String> dropdownStringItems = ["USD", "EUR", "BTC"];

  MoedaLoaded(
      {required this.input1,
      required this.input2,
      required this.moedaInfo}
  );
}

final class MoedaError extends MoedaState {
  final String mensagem;

  MoedaError({required this.mensagem});
}
