// To parse this JSON data, do
//
//     final ratesResponse = ratesResponseFromJson(jsonString);

import 'dart:convert';

RatesResponse ratesResponseFromJson(String str) =>
    RatesResponse.fromJson(json.decode(str));

String ratesResponseToJson(RatesResponse data) => json.encode(data.toJson());

class RatesResponse {
  RatesResponse({
    this.disclaimer,
    this.date,
    this.timestamp,
    this.base,
    this.rates,
  });

  String disclaimer;
  DateTime date;
  int timestamp;
  String base;
  Rates rates;

  factory RatesResponse.fromJson(Map<String, dynamic> json) => RatesResponse(
        disclaimer: json["disclaimer"] == null ? null : json["disclaimer"],
        date: json["date"] == null ? null : DateTime.parse(json["date"]),
        timestamp: json["timestamp"] == null ? null : json["timestamp"],
        base: json["base"] == null ? null : json["base"],
        rates: json["rates"] == null ? null : Rates.fromJson(json["rates"]),
      );

  Map<String, dynamic> toJson() => {
        "disclaimer": disclaimer == null ? null : disclaimer,
        "date": date == null
            ? null
            : "${date.year.toString().padLeft(4, '0')}-${date.month.toString().padLeft(2, '0')}-${date.day.toString().padLeft(2, '0')}",
        "timestamp": timestamp == null ? null : timestamp,
        "base": base == null ? null : base,
        "rates": rates == null ? null : rates.toJson(),
      };
}

class Rates {
  Rates({
    this.rub,
    this.aud,
    this.azn,
    this.gbp,
    this.amd,
    this.byn,
    this.bgn,
    this.brl,
    this.huf,
    this.hkd,
    this.dkk,
    this.usd,
    this.eur,
    this.inr,
    this.kzt,
    this.cad,
    this.kgs,
    this.cny,
    this.mdl,
    this.nok,
    this.pln,
    this.ron,
    this.xdr,
    this.sgd,
    this.tjs,
    this.ratesTry,
    this.tmt,
    this.uzs,
    this.uah,
    this.czk,
    this.sek,
    this.chf,
    this.zar,
    this.krw,
    this.jpy,
  });

  double rub;
  double aud;
  double azn;
  double gbp;
  double amd;
  double byn;
  double bgn;
  double brl;
  double huf;
  double hkd;
  double dkk;
  double usd;
  double eur;
  double inr;
  double kzt;
  double cad;
  double kgs;
  double cny;
  double mdl;
  double nok;
  double pln;
  double ron;
  double xdr;
  double sgd;
  double tjs;
  double ratesTry;
  double tmt;
  double uzs;
  double uah;
  double czk;
  double sek;
  double chf;
  double zar;
  double krw;
  double jpy;

  factory Rates.fromJson(Map<String, dynamic> json) => Rates(
        rub: 1.0,
        aud: json["AUD"] == null ? null : json["AUD"].toDouble(),
        azn: json["AZN"] == null ? null : json["AZN"].toDouble(),
        gbp: json["GBP"] == null ? null : json["GBP"].toDouble(),
        amd: json["AMD"] == null ? null : json["AMD"].toDouble(),
        byn: json["BYN"] == null ? null : json["BYN"].toDouble(),
        bgn: json["BGN"] == null ? null : json["BGN"].toDouble(),
        brl: json["BRL"] == null ? null : json["BRL"].toDouble(),
        huf: json["HUF"] == null ? null : json["HUF"].toDouble(),
        hkd: json["HKD"] == null ? null : json["HKD"].toDouble(),
        dkk: json["DKK"] == null ? null : json["DKK"].toDouble(),
        usd: json["USD"] == null ? null : json["USD"].toDouble(),
        eur: json["EUR"] == null ? null : json["EUR"].toDouble(),
        inr: json["INR"] == null ? null : json["INR"].toDouble(),
        kzt: json["KZT"] == null ? null : json["KZT"].toDouble(),
        cad: json["CAD"] == null ? null : json["CAD"].toDouble(),
        kgs: json["KGS"] == null ? null : json["KGS"].toDouble(),
        cny: json["CNY"] == null ? null : json["CNY"].toDouble(),
        mdl: json["MDL"] == null ? null : json["MDL"].toDouble(),
        nok: json["NOK"] == null ? null : json["NOK"].toDouble(),
        pln: json["PLN"] == null ? null : json["PLN"].toDouble(),
        ron: json["RON"] == null ? null : json["RON"].toDouble(),
        xdr: json["XDR"] == null ? null : json["XDR"].toDouble(),
        sgd: json["SGD"] == null ? null : json["SGD"].toDouble(),
        tjs: json["TJS"] == null ? null : json["TJS"].toDouble(),
        ratesTry: json["TRY"] == null ? null : json["TRY"].toDouble(),
        tmt: json["TMT"] == null ? null : json["TMT"].toDouble(),
        uzs: json["UZS"] == null ? null : json["UZS"].toDouble(),
        uah: json["UAH"] == null ? null : json["UAH"].toDouble(),
        czk: json["CZK"] == null ? null : json["CZK"].toDouble(),
        sek: json["SEK"] == null ? null : json["SEK"].toDouble(),
        chf: json["CHF"] == null ? null : json["CHF"].toDouble(),
        zar: json["ZAR"] == null ? null : json["ZAR"].toDouble(),
        krw: json["KRW"] == null ? null : json["KRW"].toDouble(),
        jpy: json["JPY"] == null ? null : json["JPY"].toDouble(),
      );

  Map<String, dynamic> toJson() => {
        "RUB": rub == null ? null : rub,
        "AUD": aud == null ? null : aud,
        "AZN": azn == null ? null : azn,
        "GBP": gbp == null ? null : gbp,
        "AMD": amd == null ? null : amd,
        "BYN": byn == null ? null : byn,
        "BGN": bgn == null ? null : bgn,
        "BRL": brl == null ? null : brl,
        "HUF": huf == null ? null : huf,
        "HKD": hkd == null ? null : hkd,
        "DKK": dkk == null ? null : dkk,
        "USD": usd == null ? null : usd,
        "EUR": eur == null ? null : eur,
        "INR": inr == null ? null : inr,
        "KZT": kzt == null ? null : kzt,
        "CAD": cad == null ? null : cad,
        "KGS": kgs == null ? null : kgs,
        "CNY": cny == null ? null : cny,
        "MDL": mdl == null ? null : mdl,
        "NOK": nok == null ? null : nok,
        "PLN": pln == null ? null : pln,
        "RON": ron == null ? null : ron,
        "XDR": xdr == null ? null : xdr,
        "SGD": sgd == null ? null : sgd,
        "TJS": tjs == null ? null : tjs,
        "TRY": ratesTry == null ? null : ratesTry,
        "TMT": tmt == null ? null : tmt,
        "UZS": uzs == null ? null : uzs,
        "UAH": uah == null ? null : uah,
        "CZK": czk == null ? null : czk,
        "SEK": sek == null ? null : sek,
        "CHF": chf == null ? null : chf,
        "ZAR": zar == null ? null : zar,
        "KRW": krw == null ? null : krw,
        "JPY": jpy == null ? null : jpy,
      };
}
