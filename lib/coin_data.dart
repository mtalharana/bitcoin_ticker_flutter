// ignore_for_file: depend_on_referenced_packages, avoid_web_libraries_in_flutter, unused_import, avoid_print

import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:intl/intl.dart';

const List<String> currenciesList = [
  'AUD',
  'BRL',
  'CAD',
  'PKR',
  'CNY',
  'EUR',
  'GBP',
  'HKD',
  'IDR',
  'ILS',
  'INR',
  'JPY',
  'MXN',
  'NOK',
  'NZD',
  'PLN',
  'RON',
  'RUB',
  'SEK',
  'SGD',
  'USD',
  'ZAR'
];

const List<String> cryptoList = [
  'BTC',
  'ETH',
  'LTC',
];
const coinAPIURL = 'https://rest.coinapi.io/v1/exchangerate';
const apiKey = ' B8662A95-059D-4ADB-B3AB-9DAA9B974D43';
String selectedcoin = 'BTC';

class CoinData {
  Future<Map<String, String>> getCoindata(String currency) async {
    Map<String, String> prices = {};
    for (String coin in cryptoList) {
      selectedcoin = coin;

      String url =
          'https://rest.coinapi.io/v1/exchangerate/$selectedcoin/$currency?apikey=B8662A95-059D-4ADB-B3AB-9DAA9B974D43#';
      var response = await http.get(Uri.parse(url));
      if (response.statusCode == 200) {
        var decodedData = jsonDecode(response.body);
        double lastPrice = decodedData['rate'];
        var f = NumberFormat.compactCurrency(locale: 'ur', name: '')
            .format(lastPrice);
        prices[coin] = f;
      } else {
        print(response.statusCode);
        throw 'Problem with the get request';
      }
    }
    return prices;
  }
}
