import 'package:flutter/material.dart';
import 'package:inventory_keeper/src/controllers/product_controller.dart';
import 'package:inventory_keeper/src/models/product.dart';
import 'package:inventory_keeper/src/utility/helpers.dart';
import 'package:provider/provider.dart';

///
class ProductItem extends StatelessWidget {
  ///
  const ProductItem({
    Key? key,
    required this.item,
    this.trailing,
    this.onTap,
  }) : super(key: key);

  ///
  final Product item;

  ///
  final Widget? trailing;

  ///
  final void Function()? onTap;

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
        trailing: trailing,
        onTap: onTap,
      ),
    );
  }
}
