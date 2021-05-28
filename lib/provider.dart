import 'dart:convert';

import 'package:current_exchange/rates_response.dart';
import 'package:flutter/widgets.dart';
import 'package:http/http.dart' as http;

class MainProvider with ChangeNotifier {
  int _baseRateIndex = 0;
  Rates _rates;
  bool _loading = false;
  int _sum = 1;

  String exchangeTitle(index) => rates.toJson().keys.elementAt(index);

  double exchangeRate(index) => _baseRateIndex == 0
      ? 1 * rates.toJson().values.elementAt(index) * sum
      : sum *
          rates.toJson().values.elementAt(index) /
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

  int get sum => _sum;

  set setSum(int value) {
    _sum = value;
    notifyListeners();
  }

  String exchangeRateFor(String s) {
    if (rates == null) return "-";
    var json = rates.toJson();
    return "${(1 / json.values.elementAt(json.keys.toList().indexOf(s))).toStringAsFixed(3)}";
  }
}
