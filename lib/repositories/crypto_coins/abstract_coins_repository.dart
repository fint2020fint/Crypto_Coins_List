import 'package:crypto_coin_list/repositories/crypto_coins/models/crypto_coin.dart';

export 'models/models.dart';

abstract class AbstractCoinsRepository {
  Future<List<CryptoCoin>> getCoinsList();
}
