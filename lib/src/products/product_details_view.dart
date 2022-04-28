import 'package:flutter/material.dart';

/// Displays detailed information about a SampleItem.
class ProductDetailsView extends StatelessWidget {
  /// Product Details Constructor
  const ProductDetailsView({Key? key}) : super(key: key);

  /// Product details route name
  static const routeName = '/product';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Item Details'),
      ),
      body: const Center(
        child: Text('More Information Here'),
      ),
    );
  }
}
