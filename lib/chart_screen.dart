import 'package:current_exchange/provider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class ChartScreen extends StatefulWidget {
  @override
  _ChartScreenState createState() => _ChartScreenState();
}

class _ChartScreenState extends State<ChartScreen> {
  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(),
      backgroundColor: Colors.white,
      body: Consumer<MainProvider>(
        builder: (ctx, provider, widget) {
          if (provider.isLoading)
            return Center(child: CupertinoActivityIndicator());

          return Center(
              child: Container(
            padding: EdgeInsets.symmetric(vertical: 16, horizontal: 24),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(16),
              color: Colors.black54,
            ),
            width: width * 0.45,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  "Курсы валют",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    fontFamily: GoogleFonts.play().fontFamily,
                  ),
                ),
                SizedBox(height: 12),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "USD",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 16,
                        fontFamily: GoogleFonts.play().fontFamily,
                      ),
                    ),
                    Text(
                      provider.exchangeRateFor("USD"),
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 16,
                        fontFamily: GoogleFonts.play().fontFamily,
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 6),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "EUR",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 16,
                        fontFamily: GoogleFonts.play().fontFamily,
                      ),
                    ),
                    Text(
                      provider.exchangeRateFor("EUR"),
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 16,
                        fontFamily: GoogleFonts.play().fontFamily,
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 6),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "UAH",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 16,
                        fontFamily: GoogleFonts.play().fontFamily,
                      ),
                    ),
                    Text(
                      provider.exchangeRateFor("UAH"),
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 16,
                        fontFamily: GoogleFonts.play().fontFamily,
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 6),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "GBP",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 16,
                        fontFamily: GoogleFonts.play().fontFamily,
                      ),
                    ),
                    Text(
                      provider.exchangeRateFor("GBP"),
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 16,
                        fontFamily: GoogleFonts.play().fontFamily,
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 6),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "BYN",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 16,
                        fontFamily: GoogleFonts.play().fontFamily,
                      ),
                    ),
                    Text(
                      provider.exchangeRateFor("BYN"),
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 16,
                        fontFamily: GoogleFonts.play().fontFamily,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ));
        },
      ),
    );
  }
}
