import 'package:conversor_moedas/app/components/currency_box.dart';
import 'package:conversor_moedas/app/controllers/currency_controller.dart';
import 'package:conversor_moedas/app/statics/media_files.dart';
import 'package:flutter/material.dart';

class CurrencyView extends StatefulWidget {
  @override
  _CurrencyViewState createState() => _CurrencyViewState();
}

class _CurrencyViewState extends State<CurrencyView> {
  final TextEditingController toText = TextEditingController();
  final TextEditingController fromText = TextEditingController();

  CurrencyController currencyController;
  bool _keyboardVisible = false;

  @override
  void initState() {
    super.initState();
    currencyController = CurrencyController(toText: toText, fromText: fromText);
  }

  @override
  Widget build(BuildContext context) {
    _keyboardVisible = MediaQuery.of(context).viewInsets.bottom != 0;
    return Scaffold(
      body: SizedBox(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        child: Padding(
          padding:
              const EdgeInsets.only(left: 30, right: 30, top: 100, bottom: 20),
          child: Column(children: [
            if (!_keyboardVisible)
              Image.asset(
                MediaFiles.LOGO,
                width: 120,
                height: 120,
              ),
            if (!_keyboardVisible)
              SizedBox(
                height: 50,
              ),
            CurrencyBox(
              selectedItem: currencyController.toCurrency,
              controller: toText,
              items: currencyController.currencies,
              onChanged: (model) {
                setState(() {
                  currencyController.toCurrency = model;
                });
              },
            ),
            SizedBox(
              height: 20,
            ),
            CurrencyBox(
              selectedItem: currencyController.fromCurrency,
              controller: fromText,
              items: currencyController.currencies,
              onChanged: (model) {
                setState(() {
                  currencyController.fromCurrency = model;
                });
              },
            ),
            SizedBox(
              height: 50,
            ),
            RaisedButton(
              color: Colors.amber,
              child: Text('Converter'),
              onPressed: () {
                currencyController.convert();
              },
            )
          ]),
        ),
      ),
    );
  }
}
