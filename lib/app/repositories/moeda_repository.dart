import 'dart:async';
import 'package:dio/dio.dart';
import '../models/moeda_model.dart';

class MoedaRepository {
  final Dio dio = Dio();
  final url = "https://economia.awesomeapi.com.br/last/";

  Future<CurrencyResponse> fetch(String tipo) async {
    try {
      final response = await dio.get("${url + tipo}-BRL");
      final dadosMoeda = CurrencyResponse.fromJson(response.data);

      return dadosMoeda;
    } catch (err) {
      throw Exception('Erro ao buscar moeda: $err');
    }
  }
}