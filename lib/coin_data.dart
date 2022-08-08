// ignore_for_file: depend_on_referenced_packages, avoid_web_libraries_in_flutter, unused_import, avoid_print

import 'dart:html';
import 'dart:convert';
import 'package:http/http.dart' as http;

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

class CoinData {
  CoinData({required this.currency, required this.coin, required this.price});
  final String currency;
  final String coin;
  final double price;

  Future<dynamic> getCoindata() async {
    String url =
        'https://rest.coinapi.io/v1/exchangerate/$coin/$currency?apikey=B8662A95-059D-4ADB-B3AB-9DAA9B974D43#';
    var response = await http.get(Uri.parse(url));
    if (response.statusCode == 200) {
      var decodedData = jsonDecode(response.body);
      var lastPrice = decodedData['rate'];
      //9. Output the lastPrice from the method.
      return lastPrice;
    } else {
      //10. Handle any errors that occur during the request.
      print(response.statusCode);
      //Optional: throw an error if our request fails.
      throw 'Problem with the get request';
    }
  }
}
