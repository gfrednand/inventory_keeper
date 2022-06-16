import 'package:flutter/material.dart';
import 'package:inventory_keeper/src/models/product/product.dart';
import 'package:inventory_keeper/src/utility/helpers.dart';

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
    final type = item.category == null ? '' : ('${item.category!.name} | ');
    final buyPrice = '${oCcy.format(item.buyPrice)} | ';
    final salePrice = '${oCcy.format(item.salePrice)} ';

    return Material(
      type: MaterialType.transparency,
      child: ListTile(
        title: Text(
          item.name,
          style: const TextStyle(fontSize: 15),
        ),
        subtitle: Text(
          type + buyPrice + salePrice,
        ),
        leading: Hero(
          tag: 'avatar-${item.id}',
          child: Container(
            height: 50,
            width: 50,
            decoration: BoxDecoration(
              color: Colors.grey[400],
              borderRadius: const BorderRadius.all(Radius.circular(20)),
            ),
          ),
        ),
        trailing: trailing,
        onTap: onTap,
      ),
    );
  }
}
