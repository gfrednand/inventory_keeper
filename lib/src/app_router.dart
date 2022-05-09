import 'package:flutter/material.dart';
import 'package:inventory_keeper/src/homepage/layout_page.dart';
import 'package:inventory_keeper/src/models/stock.dart';
import 'package:inventory_keeper/src/product_type/product_type_list_view.dart';
import 'package:inventory_keeper/src/products/add_product.dart';
import 'package:inventory_keeper/src/products/product_details.dart';
import 'package:inventory_keeper/src/products/product_list_view.dart';
import 'package:inventory_keeper/src/settings/settings_view.dart';
import 'package:inventory_keeper/src/stock/stock_in_out_form.dart';
import 'package:inventory_keeper/src/stock/stock_in_out_items.dart';
import 'package:inventory_keeper/src/stock/stock_list_view.dart';
import 'package:inventory_keeper/src/transaction/transaction_details_page.dart';

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
          case StockListView.routeName:
            return const StockListView();
          case ProductTypeListView.routeName:
            return const ProductTypeListView();
          case AddProduct.routeName:
            return const AddProduct();
          case ProductDetails.routeName:
            return const ProductDetails();
          case LayoutPage.routeName:
            return const LayoutPage();
          case TransactionDetailsPage.routeName:
            if (routeSettings.arguments != null) {
              final data = routeSettings.arguments! as Map<String, Stock>;
              final stock = data['stock'];
              return TransactionDetailsPage(
                stock: stock!,
              );
            }
            return const NothingFoundPage();
          case ProductListView.routeName:
            return const ProductListView();
          case StockInOutForm.routeName:
            if (routeSettings.arguments != null) {
              final data = routeSettings.arguments! as Map<String, bool>;
              return StockInOutForm(
                isStockIn: data['isStockIn']!,
              );
            }
            return const NothingFoundPage();
          case StockInOutItems.routeName:
            if (routeSettings.arguments != null) {
              final data = routeSettings.arguments! as Map<String, bool>;
              return StockInOutItems(
                isStockIn: data['isStockIn']!,
              );
            }
            return const NothingFoundPage();
          default:
            return const NothingFoundPage();
        }
      },
    );
  }
}

///
class NothingFoundPage extends StatelessWidget {
  ///
  const NothingFoundPage({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Ooops'),
      ),
      body: const Center(
        child: Text('Nothing here, GO BACK'),
      ),
    );
  }
}
