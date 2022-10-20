const kAPIkey = 'MDQ5OGFiYTJhYjg2NDBjMTg5Yjk0MDFiMGI4YzQ0MGM';
const kBitcoinAverageURL = 'https://apiv2.bitcoinaverage.com/indices';

const List<String> currenciesList = [
  'AUD',
  'BRL',
  'CAD',
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
  'SEK',
  'SGD',
  'UAH',
  'USD',
  'ZAR'
];

const List<String> cryptoList = [
  'BTC',
  'ETH',
  'LTC',
];

class CoinData {
  CoinData({required this.crypto, required this.currency});

  late String crypto;
  late String currency;
}
