import 'package:flutter/material.dart';
import 'package:inventory_keeper/src/controllers/product_controller.dart';
import 'package:inventory_keeper/src/controllers/product_type_controller.dart';
import 'package:inventory_keeper/src/models/product_type.dart';
import 'package:inventory_keeper/src/product_type/product_type_list_view.dart';
import 'package:inventory_keeper/src/product_type/product_types_selector.dart';
import 'package:inventory_keeper/src/products/add_product.dart';
import 'package:inventory_keeper/src/products/custom_detail_item_tile.dart';
import 'package:inventory_keeper/src/utility/helpers.dart';
import 'package:inventory_keeper/src/widgets/custom_form_field.dart';
import 'package:inventory_keeper/src/widgets/modal_sheet.dart';
import 'package:provider/provider.dart';

/// Add Product Page
class ProductDetails extends StatelessWidget {
  ///
  const ProductDetails({Key? key}) : super(key: key);

  /// Add Product route name
  static const routeName = '/productDetails';

  @override
  Widget build(BuildContext context) {
    final controller = context.watch<ProductController>();
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 209, 209, 209),
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Theme.of(context).canvasColor,
        titleTextStyle: const TextStyle(
          color: Colors.black,
          fontWeight: FontWeight.bold,
          fontSize: 20,
        ),
        iconTheme: const IconThemeData(color: Colors.black),
        title: const Text('Details'),
        actions: [
          IconButton(
            onPressed: () {
              Navigator.restorablePushNamed(
                context,
                AddProduct.routeName,
              );
            },
            icon: const Icon(Icons.edit_note_outlined),
          ),
          IconButton(
            onPressed: () {
              _showDeleteMenu(context, controller);
            },
            icon: const Icon(Icons.more_horiz_rounded),
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 8),
              child: Container(
                color: Colors.white,
                child: Row(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(8),
                      child: Hero(
                        tag: 'avatar-${controller.product?.id}',
                        child: Container(
                          height: 100,
                          width: 100,
                          decoration: const BoxDecoration(
                            color: Colors.grey,
                            borderRadius: BorderRadius.all(Radius.circular(20)),
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(
                      width: 8,
                    ),
                    Container(
                      height: 100,
                      padding: const EdgeInsets.all(8),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            controller.product?.name ?? '-',
                            style: const TextStyle(
                                fontSize: 18,
                                color: Color.fromARGB(255, 94, 94, 94),
                                fontWeight: FontWeight.w600),
                          ),
                          const SizedBox(
                            height: 24,
                          ),
                          Row(
                            children: const [
                              DecoratedBox(
                                decoration: BoxDecoration(
                                  color: Colors.teal,
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(5)),
                                ),
                                child: Padding(
                                  padding: EdgeInsets.symmetric(horizontal: 8),
                                  child: Text(
                                    '0',
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 20,
                                        fontWeight: FontWeight.w500),
                                  ),
                                ),
                              ),
                              SizedBox(
                                width: 16,
                              ),
                              Text(
                                'Total Quantity',
                                style:
                                    TextStyle(fontSize: 13, color: Colors.grey),
                              ),
                            ],
                          ),
                        ],
                      ),
                    )
                  ],
                ),
              ),
            ),
            const SizedBox(
              width: 8,
            ),
            Container(
              color: Colors.white,
              child: Padding(
                padding: const EdgeInsets.only(top: 24, left: 12, right: 12),
                child: Column(
                  children: [
                    const SizedBox(
                      height: 16,
                    ),
                    CustomDetailItemTile(
                      label: 'Cost',
                      value: oCcy.format(controller.product?.buyPrice),
                    ),
                    CustomDetailItemTile(
                      label: 'Price',
                      value: oCcy.format(controller.product?.salePrice),
                    ),
                    const Divider(),
                    CustomDetailItemTile(
                      label: 'Category',
                      value: controller.product?.type?.name ?? '-',
                    ),
                    const Divider(),
                    CustomDetailItemTile(
                      label: 'Unit Of Measure',
                      value: controller.product?.unit ?? '-',
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: Card(
        child: Padding(
          padding: const EdgeInsets.all(8),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: const [
                  Text(
                    '0',
                    style: TextStyle(
                        fontSize: 28,
                        fontWeight: FontWeight.bold,
                        color: Colors.teal),
                  ),
                  SizedBox(
                    width: 16,
                  ),
                  Text(
                    'Quantity',
                    style: TextStyle(fontSize: 13, color: Colors.grey),
                  ),
                ],
              ),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  padding: const EdgeInsets.only(
                    top: 16,
                    bottom: 16,
                    left: 14,
                    right: 24,
                  ),
                ),
                onPressed: () {},
                child: const Text('Stock In/Out'),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void _showDeleteMenu(BuildContext context, ProductController controller) {
    CustomModalSheet.show(
      isExpanded: false,
      context: context,
      child: Container(
        padding: const EdgeInsets.only(left: 10),
        decoration: const BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.all(Radius.circular(10)),
        ),
        child: ListView(
          shrinkWrap: true,
          children: <Widget>[
            TextButton(
                onPressed: controller.removeProduct,
                child: const Text('Delete'))
          ],
        ),
      ),
    );
  }
}
