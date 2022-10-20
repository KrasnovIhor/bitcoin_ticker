import 'package:bitcoin_ticker/coin_data.dart';
import 'package:bitcoin_ticker/services/networking.dart';

class TickerModel {
  Future<Map<String, int>> getTickerData(String selectedCurrency) async {
    var results = <String, int>{};

    for (var cryptoCurrency in cryptoList) {
      Uri url = Uri.parse(
        '$kBitcoinAverageURL/global/ticker/$cryptoCurrency$selectedCurrency',
      );
      NetworkHelper networkHelper = NetworkHelper(url: url);

      var tickerData = await networkHelper.getData();
      double lastPrice = tickerData['last'];

      results[cryptoCurrency] = lastPrice.toInt();
    }

    return results;
  }
}
