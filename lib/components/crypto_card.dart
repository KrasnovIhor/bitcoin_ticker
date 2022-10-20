import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class CryptoCard extends StatelessWidget {
  const CryptoCard({
    super.key,
    required this.cryptoCurrency,
    required this.selectedCurrency,
    this.value,
  });

  final String cryptoCurrency;
  final String selectedCurrency;
  final int? value;

  Widget getValue() => value != null
      ? Text(
          value.toString(),
          textAlign: TextAlign.center,
          style: const TextStyle(
            fontSize: 20.0,
            color: Colors.white,
          ),
        )
      : const Padding(
          padding: EdgeInsets.only(right: 5.0),
          child: SpinKitCircle(
            color: Colors.white,
            size: 20.0,
          ),
        );

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(18.0, 18.0, 18.0, 0),
      child: Card(
        color: Colors.cyan[900],
        elevation: 5.0,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10.0),
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 15.0, horizontal: 28.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                '1 $cryptoCurrency = ',
                textAlign: TextAlign.center,
                style: const TextStyle(
                  fontSize: 20.0,
                  color: Colors.white,
                ),
              ),
              getValue(),
              Text(
                '$selectedCurrency ',
                textAlign: TextAlign.center,
                style: const TextStyle(
                  fontSize: 20.0,
                  color: Colors.white,
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
