import 'package:flutter/material.dart';

class CoinDetailsScreen extends StatelessWidget {
  const CoinDetailsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Coin Details'),
      ),
      body: Column(
        children: [
          Text('Coin Details'),
        ],
      ),
    );
  }
}
