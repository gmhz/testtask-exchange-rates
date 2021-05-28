import 'dart:convert';

import 'package:current_exchange/rates_response.dart';
import 'package:flutter/widgets.dart';
import 'package:http/http.dart' as http;

class MainProvider with ChangeNotifier {
  int _baseRateIndex = 0;
  int _exchanginRateIndex = 0;
  Rates _rates;
  bool _loading = false;
  int _sum = 1;
  String _text = "";

  String exchangeTitle(index) => rates.toJson().keys.elementAt(index);

  double exchangeRate(index) => _baseRateIndex == 0
      ? 1 * rates.toJson().values.elementAt(index) * sum
      : sum *
          rates.toJson().values.elementAt(index) /
          rates.toJson().values.elementAt(_baseRateIndex);

  String get selectedExchangeTitle =>
      rates.toJson().keys.elementAt(exchanginRateIndex);

  double get selectedExchangeRate => _baseRateIndex == 0
      ? 1 * rates.toJson().values.elementAt(exchanginRateIndex) * sum
      : sum *
          rates.toJson().values.elementAt(exchanginRateIndex) /
          rates.toJson().values.elementAt(_baseRateIndex);

  String get baseTitle => rates.toJson().keys.elementAt(baseRateIndex);

  Future<bool> loadApiData() async {
    bool success = false;

    Map<String, String> header = Map<String, String>();
    http.Response response = await http.get(
      Uri.parse("https://www.cbr-xml-daily.ru/latest.js"),
    );

    if (response.statusCode == 200) {
      var json = jsonDecode(response.body);
      if (json != null) setRates = RatesResponse.fromJson(json)?.rates;
    }

    setLoading = false;
    return success;
  }

  bool get isLoading => _loading;

  set setLoading(bool value) {
    _loading = value;
    notifyListeners();
  }

  Rates get rates => _rates;

  set setRates(Rates value) {
    _rates = value;
    notifyListeners();
  }

  int get baseRateIndex => _baseRateIndex;

  set setBaseRateIndex(int value) {
    _baseRateIndex = value;
    notifyListeners();
  }

  int get exchanginRateIndex => _exchanginRateIndex;

  set setExchanginRateIndex(int value) {
    _exchanginRateIndex = value;
    notifyListeners();
  }

  int get sum => _sum;

  set setSum(int value) {
    _sum = value;
    notifyListeners();
  }

  String get text => _text;

  set setText(String value) {
    _text = value;

    int sum = int.tryParse(text);
    if (sum != null) _sum = sum;
    if (text.split(" ").length >= 2) {
      List<String> parts = text.split(" ");
      List<String> correctCurrencies = List.empty(growable: true);
      parts.forEach((pe) {
        if (rates != null &&
            rates.toJson().keys.any((e) => e.toLowerCase() == pe.toLowerCase()))
          correctCurrencies.add(pe.toUpperCase());
      });

      if (correctCurrencies.length >= 2) {
        _baseRateIndex = rates
            .toJson()
            .keys
            .toList()
            .indexOf(correctCurrencies.elementAt(0));
        _exchanginRateIndex = rates
            .toJson()
            .keys
            .toList()
            .indexOf(correctCurrencies.elementAt(1));
      }
    }

    notifyListeners();
  }

  String exchangeRateFor(String s) {
    if (rates == null) return "-";
    var json = rates.toJson();
    return "${(1 / json.values.elementAt(json.keys.toList().indexOf(s))).toStringAsFixed(3)}";
  }
}
