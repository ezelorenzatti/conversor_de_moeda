import 'package:conversor_moedas/app/controllers/currency_controller.dart';
import 'package:conversor_moedas/app/models/currency_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_test/flutter_test.dart';

main() {
  final TextEditingController toText = TextEditingController();
  final TextEditingController fromText = TextEditingController();
  final currencyController = CurrencyController(toText: toText, fromText: fromText);

  test('deve converter de real para dolar com ponto', () {
    toText.text = '2.0';
    currencyController.convert();
    expect(fromText.text, '0.36');
  });
  test('deve converter de real para dolar com virgula', () {
    toText.text = '2,0';
    currencyController.convert();
    expect(fromText.text, '0.36');
  });  
  test('deve converter de dolar para real', () {
    toText.text = '1.0';
    currencyController.toCurrency= CurrencyModel(name: "Dolar", real: 5.65, dolar: 1.00);    
    currencyController.fromCurrency = CurrencyModel(name: 'Real', real: 1.0, dolar: 0.18);  
    currencyController.convert();
    expect(fromText.text, '5.65');
  });

}
