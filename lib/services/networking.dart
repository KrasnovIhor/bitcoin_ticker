import 'dart:convert';
import 'package:bitcoin_ticker/coin_data.dart';
import 'package:http/http.dart' as http;

class NetworkHelper {
  NetworkHelper({required this.url});

  final Uri url;

  Future getData() async {
    http.Response response = await http.get(
      url,
      headers: {
        'x-ba-key': kAPIkey,
      },
    );

    if (response.statusCode == 200) {
      return jsonDecode(response.body);
    } else {
      print(response.statusCode);
      throw 'Problem with GET request';
    }
  }
}
