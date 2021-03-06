import 'package:conversor_moedas/app/models/currency_model.dart';
import 'package:flutter/cupertino.dart';

class CurrencyController {
  List<CurrencyModel> currencies;
  CurrencyModel toCurrency;
  CurrencyModel fromCurrency;

  final TextEditingController toText;
  final TextEditingController fromText;

  CurrencyController({this.toText, this.fromText}) {
    currencies = CurrencyModel.getCurrencies();
    toCurrency = currencies[0];
    fromCurrency = currencies[1];
  }

  void convert() {
    String text = toText.text;
    double value = double.tryParse(text.replaceAll(',', '.')) ?? 1.0;
    double returnValue = 0;
    if (fromCurrency.name == 'Real') {
      returnValue = value * toCurrency.real;
    } else if (fromCurrency.name == 'Dolar') {
      returnValue = value * toCurrency.dolar;
    }

    fromText.text = returnValue.toStringAsFixed(2);
  }
}
