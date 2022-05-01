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
    final productTypeController = context.watch<ProductTypeController>();
    final controller = context.watch<ProductController>();

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
              child: const Text(
                'Category',
                style: TextStyle(
                  fontWeight: FontWeight.w800,
                  fontSize: 20,
                ),
              ),
            ),
          ),
        ),
        SizedBox(
          height: 30,
          child: StreamBuilder(
            stream: productTypeController.fetchProductTypesAsStream(),
            builder: (context, AsyncSnapshot<List<ProductType>> snapshot) {
              List<ProductType>? data = [];
              if (snapshot.hasData) {
                data = snapshot.data;
                return ListView.separated(
                  itemCount: data!.length,
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (ctx, index) {
                    final type = data![index];
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
                          padding: const EdgeInsets.symmetric(horizontal: 8),
                          child: Text(
                            data[index].name,
                          ),
                        ),
                      ),
                    );
                  },
                  separatorBuilder: (BuildContext context, int index) =>
                      const SizedBox(
                    width: 8,
                  ),
                );
              } else {
                return Container();
              }
            },
          ),
        ),
      ],
    );
  }
}
