class CurrencyResponse {
  final CurrencyRate rate;

  CurrencyResponse({required this.rate});

  factory CurrencyResponse.fromJson(Map<String, dynamic> json) {
    if (json['USDBRL'] != null){
      return CurrencyResponse(
        rate: CurrencyRate.fromJson(json['USDBRL']),
      );
    }
    else if (json['EURBRL'] != null){
      return CurrencyResponse(
        rate: CurrencyRate.fromJson(json['EURBRL']),
      );
    }
    else if (json['BTCBRL'] != null){
      return CurrencyResponse(
        rate: CurrencyRate.fromJson(json['BTCBRL']),
      );
    }
    else {
      throw Exception('CurrencyResponse: não foi possível obter a cotação da moeda');
    }
  }
}

class CurrencyRate {
  final String code;
  final String codein;
  final String name;
  final double high;
  final double low;
  final double pctChange; //Porcentagem de variação
  final double bid; //Compra
  final double ask; //Venda
  final String createDate; //Data

  CurrencyRate({
    required this.code,
    required this.codein,
    required this.name,
    required this.high,
    required this.low,
    required this.pctChange,
    required this.bid,
    required this.ask,
    required this.createDate,
  });

  factory CurrencyRate.fromJson(Map<String, dynamic> json) {
    return CurrencyRate(
      code: json['code'],
      codein: json['codein'],
      name: json['name'],
      high: double.parse(json['high']),
      low: double.parse(json['low']),
      pctChange: double.parse(json['pctChange']),
      bid: double.parse(json['bid']),
      ask: double.parse(json['ask']),
      createDate: json['create_date'],
    );
  }
}