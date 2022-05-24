import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:inventory_keeper/src/controllers/product_controller.dart';
import 'package:inventory_keeper/src/controllers/product_type_controller.dart';
import 'package:inventory_keeper/src/product_type/product_type_list_view.dart';

///
class ProductTypesSelector extends StatelessWidget {
  ///
  const ProductTypesSelector({
    Key? key,
  }) : super(key: key);

  ///

  @override
  Widget build(BuildContext context) {
    final productTypeController = Get.find<ProductTypeController>();
    return Column(
      children: [
        SizedBox(
          width: double.infinity,
          child: Padding(
            padding: const EdgeInsets.only(
              left: 8,
              top: 10,
              bottom: 16,
            ),
            child: Hero(
              tag: 'hero-category-title',
              child: Material(
                child: ListTile(
                  dense: true,
                  onTap: () {
                    Navigator.pushNamed(
                      context,
                      ProductTypeListView.routeName,
                    );
                  },
                  title: const Text(
                    'Categories',
                    style: TextStyle(
                      fontWeight: FontWeight.w800,
                      fontSize: 20,
                    ),
                  ),
                  trailing: const Icon(
                    Icons.arrow_forward_ios,
                    size: 16,
                  ),
                ),
              ),

              //  Card(
              //   elevation: 0.3,
              //   child: Padding(
              //     padding: EdgeInsets.all(8),
              //     child: ,
              //   ),
              // ),
            ),
          ),
        ),
        GetBuilder(
          init: ProductTypeController(),
          builder: (cont) {
            return Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
              child: SizedBox(
                height: 30,
                child: ListView.separated(
                  itemCount: productTypeController.productTypes.length,
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (ctx, index) {
                    final type = productTypeController.productTypes[index];
                    return FilterChip(
                      label: Text(
                        productTypeController.productTypes[index].name,
                      ),
                      onSelected: (value) {
                        productTypeController.changeType(type);
                        Get.find<ProductController>().productType = type;
                      },
                      // backgroundColor: Color.fromARGB(84, 158, 158, 158),
                      selectedColor: const Color.fromARGB(170, 144, 202, 249),
                      selected: productTypeController.type?.id == type.id,
                    );

                    // GestureDetector(
                    //   onTap: () {
                    //     controller.type = type;
                    //   },
                    //   child: Container(
                    //     alignment: Alignment.center,
                    //     decoration: BoxDecoration(
                    //       borderRadius: BorderRadius.circular(20),
                    //       color: controller.type?.id == type.id
                    //           ? const Color.fromARGB(170, 144, 202, 249)
                    //           : const Color.fromARGB(84, 158, 158, 158),
                    //     ),
                    //     child: Padding(
                    //       padding: const EdgeInsets.symmetric(horizontal: 8),
                    //       child: Text(
                    //         productTypes[index].name,
                    //       ),
                    //     ),
                    //   ),
                    // );
                  },
                  separatorBuilder: (BuildContext context, int index) =>
                      const SizedBox(
                    width: 8,
                  ),
                ),
              ),
            );
          },
        ),
      ],
    );
  }
}
