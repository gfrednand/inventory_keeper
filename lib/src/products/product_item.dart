import 'package:flutter/material.dart';
import 'package:inventory_keeper/src/controllers/product_controller.dart';
import 'package:inventory_keeper/src/models/product.dart';
import 'package:inventory_keeper/src/products/product_details.dart';
import 'package:inventory_keeper/src/utility/helpers.dart';
import 'package:provider/provider.dart';

///
class ProductItem extends StatelessWidget {
  ///
  const ProductItem({
    Key? key,
    required this.item,
  }) : super(key: key);

  ///
  final Product item;

  @override
  Widget build(BuildContext context) {
    final controller = context.watch<ProductController>();

    return Material(
      type: MaterialType.transparency,
      child: ListTile(
        title: Text(
          item.name,
          style: const TextStyle(fontSize: 15),
        ),
        subtitle: Padding(
          padding: const EdgeInsets.only(top: 4),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  item.type?.name ?? '',
                  style: const TextStyle(fontSize: 12),
                ),
                Text(
                  'Cost ${oCcy.format(item.buyPrice)}',
                  style: const TextStyle(
                    fontSize: 12,
                  ),
                ),
                const SizedBox(
                  width: 10,
                ),
                Text(
                  'Price ${oCcy.format(item.salePrice)}',
                  style: const TextStyle(
                    fontSize: 12,
                  ),
                ),
              ],
            ),
          ),
        ),
        leading: Hero(
          tag: 'avatar-${item.id}',
          child: Container(
            height: 50,
            width: 50,
            decoration: const BoxDecoration(
              color: Colors.grey,
              borderRadius: BorderRadius.all(Radius.circular(20)),
            ),
          ),
        ),
        onTap: () {
          // Navigate to the details page. If the user leaves and
          // returns to the app after it has been killed while running
          // in the background, the navigation stack is restored.

          controller.product = item;
          Navigator.restorablePushNamed(
            context,
            ProductDetails.routeName,
          );
        },
      ),
    );
  }
}
