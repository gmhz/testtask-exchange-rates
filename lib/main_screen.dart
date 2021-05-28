import 'package:current_exchange/chart_screen.dart';
import 'package:current_exchange/provider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class MainScreen extends StatefulWidget {
  @override
  _MainScreenState createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  TextEditingController sumController = TextEditingController();

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      var provider = Provider.of<MainProvider>(context, listen: false);
      provider.loadApiData();
      sumController.text = "${provider.sum}";
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.bar_chart),
        onPressed: () {
          Navigator.of(context).push(
            MaterialPageRoute(builder: (ctx) => ChartScreen()),
          );
        },
      ),
      backgroundColor: Colors.white,
      body: Consumer<MainProvider>(
        builder: (ctx, provider, widget) {
          if (provider.isLoading || provider.rates == null)
            return Center(child: CupertinoActivityIndicator());

          return SafeArea(
            child: Column(
              children: [
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 16),
                  height: 120,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text("Возможные коды валют"),
                      Expanded(
                        child: CupertinoPicker.builder(
                          selectionOverlay:
                              Container(color: Colors.transparent),
                          childCount: provider.rates?.toJson()?.length ?? 0,
                          squeeze: .7,
                          diameterRatio: 2.5,
                          backgroundColor: Colors.white,
                          itemExtent: 25,
                          onSelectedItemChanged: (index) {
                          },
                          itemBuilder: (BuildContext context, int index) {
                            return Text(
                              "${provider.rates.toJson().keys.elementAt(index)}",
                            );
                          },
                        ),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: TextField(
                    controller: sumController,
                    onChanged: (val) {
                      provider.setText = val;
                    },
                    decoration: InputDecoration(
                      border: OutlineInputBorder(
                        borderSide: BorderSide(
                          color: Colors.red,
                          width: 5.0,
                        ),
                      ),
                    ),
                  ),
                ),
                if (provider.exchanginRateIndex != null)
                  Text(
                      "${provider.sum} ${provider.baseTitle} = ${provider.selectedExchangeRate.toStringAsFixed(3)} ${provider.selectedExchangeTitle}"),
              ],
            ),
          );
        },
      ),
    );
  }
}
