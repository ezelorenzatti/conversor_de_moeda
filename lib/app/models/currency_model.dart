class CurrencyModel {
  final String name;
  final double real;
  final double dolar;

  CurrencyModel({this.name, this.real, this.dolar});

  static List<CurrencyModel> getCurrencies() {
    return <CurrencyModel>[
      CurrencyModel(name: 'Real', real: 1.0, dolar: 0.18),
      CurrencyModel(name: "Dolar", real: 5.65, dolar: 1.00),
    ];
  }
}
