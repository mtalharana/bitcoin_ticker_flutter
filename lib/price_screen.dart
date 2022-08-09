// ignore_for_file: prefer_const_constructors, use_key_in_widget_constructors, library_private_types_in_public_api, avoid_print

import 'package:flutter/material.dart';
import 'package:bitcoin_ticker_flutter/coin_data.dart';

class PriceScreen extends StatefulWidget {
  @override
  _PriceScreenState createState() => _PriceScreenState();
}

class _PriceScreenState extends State<PriceScreen> {
  List<DropdownMenuItem<String>> getdropdownItemslist() {
    List<DropdownMenuItem<String>> dropdownItems = [];
    for (String currency in currenciesList) {
      dropdownItems.add(DropdownMenuItem(
        value: currency,
        child: Text(currency),
      ));
    }
    return dropdownItems;
  }

  String value = 'no value';
  String selectedCurrency = 'PKR';
  String selectedCrypto = 'BTC';

  void getvalue() async {
    String value = await CoinData().getCoindata(selectedCurrency);
    print(value);
    setState(() {
      value = value;
    });
  }

  @override
  void initState() {
    super.initState();
    //14. Call getData() when the screen loads up. We can't call CoinData().getCoinData() directly here because we can't make initState() async.
    getvalue();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('🤑 Coin Ticker'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          Column(
            children: [
              Tickercard(
                  value: value,
                  selectedCurrency: selectedCurrency,
                  crypto: selectedCrypto),
              Tickercard(
                value: value,
                selectedCurrency: selectedCurrency,
                crypto: selectedCrypto,
              ),
              Tickercard(
                value: value,
                selectedCurrency: selectedCurrency,
                crypto: selectedCrypto,
              ),
            ],
          ),
          Container(
            height: 150.0,
            alignment: Alignment.center,
            padding: EdgeInsets.only(bottom: 30.0),
            color: Colors.lightBlue,
            child: DropdownButton<String>(
              value: selectedCurrency,
              // ignore: prefer_const_literals_to_create_immutables
              items: getdropdownItemslist(),
              onChanged: (value) {
                setState(() {
                  selectedCurrency = value!;
                  getvalue();
                  print(selectedCurrency);
                });
              },
            ),
          ),
        ],
      ),
    );
  }
}

class Tickercard extends StatelessWidget {
  const Tickercard({
    Key? key,
    required this.value,
    required this.selectedCurrency,
    required this.crypto,
  }) : super(key: key);

  final String value;
  final String selectedCurrency;
  final String crypto;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.fromLTRB(18.0, 18.0, 18.0, 0),
      child: Card(
        color: Colors.lightBlueAccent,
        elevation: 5.0,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10.0),
        ),
        child: Padding(
          padding: EdgeInsets.symmetric(vertical: 15.0, horizontal: 28.0),
          child: Text(
            '1 BTC = $value $selectedCurrency ',
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 20.0,
              color: Colors.white,
            ),
          ),
        ),
      ),
    );
  }
}
