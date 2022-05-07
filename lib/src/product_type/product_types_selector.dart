import 'package:flutter/material.dart';
import 'package:inventory_keeper/src/controllers/product_controller.dart';
import 'package:inventory_keeper/src/controllers/product_type_controller.dart';
import 'package:inventory_keeper/src/models/product_type.dart';
import 'package:inventory_keeper/src/product_type/product_type_list_view.dart';
import 'package:provider/provider.dart';

///
class ProductTypesSelector extends StatelessWidget {
  ///
  const ProductTypesSelector({
    Key? key,
  }) : super(key: key);

  ///

  @override
  Widget build(BuildContext context) {
    final productTypes = context.watch<List<ProductType>?>();
    final controller = context.watch<ProductController>();
    // final allType = ProductType(id: 'all', name: 'All');
    // final index =
    //     productTypes?.indexWhere((element) => element.name == allType.name);
    // print('INDEX $index');
    // if (index != null && index == -1) {
    //   productTypes?.insert(0, allType);
    // }
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
            child: GestureDetector(
              onTap: () {
                Navigator.pushNamed(
                  context,
                  ProductTypeListView.routeName,
                );
              },
              child: const Hero(
                tag: 'hero-category-title',
                child: Card(
                  elevation: 0.3,
                  child: Padding(
                    padding: EdgeInsets.all(8),
                    child: Text(
                      'Categories',
                      style: TextStyle(
                        fontWeight: FontWeight.w800,
                        fontSize: 20,
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
          child: SizedBox(
              height: 30,
              child: productTypes != null
                  ? ListView.separated(
                      itemCount: productTypes.length,
                      scrollDirection: Axis.horizontal,
                      itemBuilder: (ctx, index) {
                        final type = productTypes[index];
                        return GestureDetector(
                          onTap: () {
                            controller.type = type;
                          },
                          child: Container(
                            alignment: Alignment.center,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(20),
                              color: controller.type?.id == type.id
                                  ? const Color.fromARGB(170, 144, 202, 249)
                                  : const Color.fromARGB(84, 158, 158, 158),
                            ),
                            child: Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 8),
                              child: Text(
                                productTypes[index].name,
                              ),
                            ),
                          ),
                        );
                      },
                      separatorBuilder: (BuildContext context, int index) =>
                          const SizedBox(
                        width: 8,
                      ),
                    )
                  : Container()),
        ),
      ],
    );
  }
}
