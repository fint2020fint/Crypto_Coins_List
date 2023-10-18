import 'package:crypto_coin_list/repositories/crypto_coins/abstract_coins_repository.dart';
import 'package:crypto_coin_list/repositories/crypto_coins/models/crypto_coin.dart';
import 'package:dio/dio.dart';

class CryptoCoinRepository implements AbstractCoinsRepository {
  @override
  Future<List<CryptoCoin>> getCoinsList() async {
    final response = await Dio().get(''
        'https://min-api.cryptocompare.com/data/pricemultifull?fsyms=BTC,ETH,BNB,SOL,AID,CAG,DOV&tsyms=USD');
    final data = response.data['RAW'] as Map<String, dynamic>;
    final cryptoCoinsList = data.entries.map((e) {
      final usdData =
          (e.value as Map<String, dynamic>)['USD'] as Map<String, dynamic>;
      final price = usdData['PRICE'];
      final imageUrl = usdData['IMAGEURL'];
      return CryptoCoin(
        name: e.key,
        priceInUSD: price,
        imageUrl: 'https://www.cryptocompare.com/$imageUrl',
      );
    }).toList();

    return cryptoCoinsList;
  }
}
