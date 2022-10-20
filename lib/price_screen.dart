import 'package:bitcoin_ticker/coin_data.dart';
import 'package:bitcoin_ticker/components/crypto_card.dart';
import 'package:bitcoin_ticker/services/ticker.dart';
import 'package:easy_debounce/easy_debounce.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'dart:io' show Platform;

class PriceScreen extends StatefulWidget {
  const PriceScreen({super.key});

  @override
  State<PriceScreen> createState() => _PriceScreenState();
}

class _PriceScreenState extends State<PriceScreen> {
  String selectedCurrency = currenciesList.first;
  TickerModel tickerModel = TickerModel();
  late Map<String, int>? values = {};
  bool isLoading = true;

  @override
  void initState() {
    super.initState();

    getData();
  }

  void getData() async {
    try {
      setState(() {
        isLoading = true;
      });
      Map<String, int> data = await tickerModel.getTickerData(
        selectedCurrency,
      );

      setState(() {
        values = data;
        isLoading = false;
      });
    } catch (e) {
      print(e);
    }
  }

  void handlePickerChange(int index) {
    setState(() {
      EasyDebounce.debounce(
          'iOSPicker',
          const Duration(
            milliseconds: 500,
          ), () {
        selectedCurrency = currenciesList[index];
        getData();
      });
    });
  }

  DropdownButton<String> androidDropdown() {
    return DropdownButton<String>(
      value: selectedCurrency,
      items: currenciesList
          .map(
            (item) => DropdownMenuItem<String>(
              key: Key(item),
              value: item,
              child: Text(item),
            ),
          )
          .toList(),
      onChanged: (value) {
        setState(() {
          selectedCurrency = value ?? '';
          getData();
        });
      },
    );
  }

  CupertinoPicker iOSPicker() {
    return CupertinoPicker(
      itemExtent: 32.0,
      onSelectedItemChanged: handlePickerChange,
      children: currenciesList
          .map(
            (item) => Text(
              item,
              key: Key(item),
            ),
          )
          .toList(),
    );
  }

  Widget tickerCards() => Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: cryptoList
            .map(
              (cryptoItem) => CryptoCard(
                cryptoCurrency: cryptoItem,
                selectedCurrency: selectedCurrency,
                value: isLoading ? null : values?[cryptoItem],
              ),
            )
            .toList(),
      );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Center(
          child: Text('🤑 Coin Ticker'),
        ),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          tickerCards(),
          Container(
            height: 150.0,
            alignment: Alignment.center,
            padding: const EdgeInsets.only(bottom: 30.0),
            color: Colors.cyan[900],
            child: Platform.isIOS ? iOSPicker() : androidDropdown(),
          ),
        ],
      ),
    );
  }
}
