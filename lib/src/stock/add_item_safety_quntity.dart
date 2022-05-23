import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:inventory_keeper/src/controllers/product_controller.dart';
import 'package:inventory_keeper/src/models/product/product.dart';
import 'package:inventory_keeper/src/products/current_stock_quantity.dart';
import 'package:inventory_keeper/src/products/product_item.dart';
import 'package:inventory_keeper/src/stock/stock_quantity_field.dart';
import 'package:inventory_keeper/src/utility/helpers.dart';
import 'package:inventory_keeper/src/widgets/app_snackbar.dart';
import 'package:inventory_keeper/src/widgets/section_divider.dart';

///
class AddItemSafetyQuantity extends StatefulWidget {
  ///
  const AddItemSafetyQuantity({Key? key}) : super(key: key);

  ///
  static const routeName = '/addItemSafetyQuantity';

  ///

  @override
  State<AddItemSafetyQuantity> createState() => _AddItemSafetyQuantityState();
}

class _AddItemSafetyQuantityState extends State<AddItemSafetyQuantity> {
  List<Product> filteredProducts = [];

  @override
  void initState() {
    filteredProducts = Get.find<List<Product>>();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final products = Get.find<List<Product>>();
    return Scaffold(
      body: Column(
        children: [
          const SizedBox(
            height: 50,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: PreferredSize(
              preferredSize: const Size.fromHeight(110),
              child: Row(
                children: [
                  Expanded(
                    child: TextField(
                      onChanged: (searchQuery) {
                        final searchResult = <Product>[];
                        if (searchQuery.isEmpty) {
                          setState(() {
                            filteredProducts = products;
                          });
                        } else {
                          for (final product in products) {
                            if ((product.type != null &&
                                    product.type!.name
                                        .toLowerCase()
                                        .contains(searchQuery.toLowerCase())) ||
                                product.name
                                    .toLowerCase()
                                    .contains(searchQuery.toLowerCase())) {
                              searchResult.add(product);
                            }
                          }
                          setState(() {
                            filteredProducts = searchResult;
                          });
                        }
                      },
                      decoration: const InputDecoration(
                        fillColor: Colors.grey,
                        prefixIcon: Icon(Icons.search, color: Colors.grey),
                        hintText: 'Search item, category',
                        // contentPadding: const EdgeInsets.symmetric(
                        //   horizontal: 30,
                        //   vertical: 20,
                        // ),
                        focusedBorder: InputBorder.none,
                        enabledBorder: InputBorder.none,
                        errorBorder: InputBorder.none,
                        disabledBorder: InputBorder.none,
                      ),
                    ),
                  ),
                  const SizedBox(
                    width: 16,
                  ),
                  TextButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    child: const Text(
                      'Done',
                      style: TextStyle(fontSize: 20, color: Colors.black),
                    ),
                  )
                ],
              ),
            ),
          ),
          const SectionDivider(),
          Expanded(
            child: ListView.builder(
              shrinkWrap: true,
              itemCount: filteredProducts.length,
              itemBuilder: (context, index) {
                var item = filteredProducts[index];
                return ProductItem(
                  item: item,
                  trailing: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      CurrentStockQuantity(
                        currentStock: item.safetyStock,
                        withBackground: true,
                        backGroundColor: item.safetyStock == 0
                            ? const Color(0xFFBDBDBD)
                            : Colors.green,
                        fontSize: 16,
                      ),
                      const SizedBox(
                        height: 4,
                      ),
                      CurrentStockQuantity(
                        currentStock: item.currentStock,
                        fontSize: 16,
                      ),
                    ],
                  ),
                  onTap: () {
                    displayDialog<int>(
                      context,
                      StockQuantityField(
                        productName: item.name,
                        title: 'Safety Stock',
                        counter: item.safetyStock,
                      ),
                    ).then((value) {
                      if (value != null && value > 0) {
                        loadDialog<dynamic>(
                          context,
                          loadingText: 'Updating Safety Stock',
                        );
                        Get.find<ProductController>()
                            .updateProductSafetyStock(item, value)
                            .then((success) {
                          Navigator.pop(context);
                          if (success) {
                            setState(() {
                              item = item.copyWith(safetyStock: value);
                            });
                            AppSnackbar().show(
                              context,
                              'Safety Stock Successful Updated',
                            );
                          } else {
                            AppSnackbar().show(
                              context,
                              'Safety Stock Failed To Updated',
                            );
                          }
                        });
                      }
                    });
                  },
                );
              },
            ),
          )
        ],
      ),
    );
  }

  void _searchItem(String searchQuery, List<Product> products) {
    final searchResult = <Product>[];
    if (searchQuery.isEmpty) {
      setState(() {
        filteredProducts = products;
      });
    } else {
      for (final product in products) {
        if ((product.type != null &&
                product.type!.name
                    .toLowerCase()
                    .contains(searchQuery.toLowerCase())) ||
            product.name.toLowerCase().contains(searchQuery.toLowerCase())) {
          searchResult.add(product);
        }
      }
      setState(() {
        filteredProducts = searchResult;
      });
    }
  }
}
