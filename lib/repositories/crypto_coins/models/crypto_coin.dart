export 'package:crypto_coin_list/repositories/crypto_coins/crypto_coin_repository.dart';

class CryptoCoin {
  CryptoCoin(
      {required this.name, required this.priceInUSD, required this.imageUrl});
  final String name;
  final double priceInUSD;
  final String imageUrl;
}
