import 'package:flutter/material.dart';
import 'package:inventory_keeper/src/product_type/product_type_list_view.dart';
import 'package:inventory_keeper/src/products/add_product.dart';
import 'package:inventory_keeper/src/products/product_details_view.dart';
import 'package:inventory_keeper/src/products/product_list_view.dart';
import 'package:inventory_keeper/src/settings/settings_view.dart';

///
class AppRouter {
  ///
  static Route<dynamic> generateRoute(RouteSettings routeSettings) {
    return MaterialPageRoute<void>(
      settings: routeSettings,
      builder: (BuildContext context) {
        switch (routeSettings.name) {
          case SettingsView.routeName:
            return const SettingsView();
          case ProductDetailsView.routeName:
            return const ProductDetailsView();
          case ProductTypeListView.routeName:
            return const ProductTypeListView();
          case AddProduct.routeName:
            return const AddProduct();
          case ProductListView.routeName:
          default:
            return const ProductListView();
        }
      },
    );
  }
}
