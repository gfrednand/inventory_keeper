import 'package:flutter/material.dart';

/// Displays detailed information about a SampleItem.
class StockListView extends StatelessWidget {
  /// Product Details Constructor
  const StockListView({Key? key}) : super(key: key);

  /// Product details route name
  static const routeName = '/stockListView';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Stock'),
      ),
      body: Column(),
    );
  }
}
