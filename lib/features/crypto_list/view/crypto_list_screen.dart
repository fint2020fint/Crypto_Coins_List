import 'dart:async';

import 'package:crypto_coin_list/features/crypto_list/bloc/crypto_list_bloc.dart';
import 'package:crypto_coin_list/features/crypto_list/widgets/widgets.dart';
import 'package:crypto_coin_list/repositories/crypto_coins/crypto_coins.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';

class CryptoListScreen extends StatefulWidget {
  const CryptoListScreen({super.key});

  @override
  State<CryptoListScreen> createState() => _CryptoListScreenState();
}

class _CryptoListScreenState extends State<CryptoListScreen> {
  List<CryptoCoin>? _cryptoCoinsList;
  final _cryptoListBloc = CryptoListBloc(GetIt.I<AbstractCoinsRepository>());

  get completer => null;
  @override
  void initState() {
    _cryptoListBloc.add(LoadCryptoList(completer: completer));

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('CryptoCurrenciesList'),
        ),
        body: RefreshIndicator(
          onRefresh: () async {
            final completer = Completer();
            _cryptoListBloc.add(LoadCryptoList(completer: completer));
            return completer.future;
          },
          child: BlocBuilder<CryptoListBloc, CryptoListState>(
            bloc: _cryptoListBloc,
            builder: (context, state) {
              if (state is CryptoListLoaded) {
                return ListView.separated(
                  padding: const EdgeInsets.only(top: 16),
                  itemCount: state.coinsList.length,
                  separatorBuilder: (context, index) => const Divider(),
                  itemBuilder: (context, i) {
                    final coin = state.coinsList[i];
                    return CryptoCoinTile(coin: coin);
                  },
                );
              }
              if (state is CryptoListLoadingFailure) {
                return const Center(
                    child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(
                      'Something went wrong',
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w500,
                      ),
                    )
                  ],
                ));
              }
              return const Center(child: CircularProgressIndicator());
            },
            // )(_cryptoCoinsList == null)
            //     ? const Center(child: CircularProgressIndicator())
            //     : ListView.separated(
            //         itemCount: _cryptoCoinsList!.length,
            //         separatorBuilder: (context, index) => const Divider(),
            //         itemBuilder: (context, i) {
            //           final coin = _cryptoCoinsList![i];
            //           return CryptoCoinTile(coin: coin);
            //         },
            //       ),
          ),
        ));
  }
}
