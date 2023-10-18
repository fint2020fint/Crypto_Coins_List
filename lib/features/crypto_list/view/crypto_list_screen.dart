import 'package:crypto_coin_list/features/crypto_list/widgets/crypto_coin_tile.dart';
import 'package:crypto_coin_list/repositories/crypto_coins/models/crypto_coin.dart';
import 'package:flutter/material.dart';

class CryptoListScreen extends StatefulWidget {
  const CryptoListScreen({super.key});

  @override
  State<CryptoListScreen> createState() => _CryptoListScreenState();
}

class _CryptoListScreenState extends State<CryptoListScreen> {
  List<CryptoCoin>? _cryptoCoinsList;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('CryptoCurrenciesList'),
      ),
      body: (_cryptoCoinsList == null)
          ? const Center(child: CircularProgressIndicator())
          : ListView.separated(
              itemCount: _cryptoCoinsList!.length,
              separatorBuilder: (context, index) => const Divider(),
              itemBuilder: (context, i) {
                final coin = _cryptoCoinsList![i];
                return CryptoCoinTile(coin: coin);
              },
            ),
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.download),
        onPressed: () async {
          _cryptoCoinsList = await CryptoCoinRepository().getCoinsList();
          setState(() {});
        },
      ),
    );
  }
}
