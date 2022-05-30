import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:inventory_keeper/src/controllers/product_controller.dart';
import 'package:inventory_keeper/src/utility/colors.dart';

///
class SearchItemCategoryForm extends StatelessWidget {
  ///
  const SearchItemCategoryForm({
    Key? key,
    this.closeLabel,
  }) : super(key: key);

  ///
  final String? closeLabel;

  @override
  Widget build(BuildContext context) {
    final productController = Get.find<ProductController>();

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      child: PreferredSize(
        preferredSize: const Size.fromHeight(110),
        child: Row(
          children: [
            Expanded(
              child: TextField(
                onChanged: (searchQuery) {
                  if (searchQuery.isEmpty) {
                    productController.filteredProductsByNameAndCategory();
                  } else {
                    productController.filteredProductsByNameAndCategory(
                      query: searchQuery,
                    );
                  }
                },
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(16),
                    borderSide: BorderSide.none,
                  ),
                  prefixIcon: const Icon(
                    Icons.search,
                    color: AppColors.blue200,
                  ),
                  contentPadding: const EdgeInsets.all(8),
                  filled: true,
                  hintStyle: const TextStyle(color: AppColors.blue200),
                  hintText: 'Search item, category',
                  fillColor: Colors.white70,
                ),
              ),
            ),
            if (closeLabel != null)
              const SizedBox(
                width: 8,
              ),
            if (closeLabel != null)
              TextButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                child: Text(
                  closeLabel!,
                  style: const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w500,
                    color: AppColors.black900,
                  ),
                ),
              )
          ],
        ),
      ),
    );
  }
}
