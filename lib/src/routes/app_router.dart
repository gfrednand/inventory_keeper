import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:inventory_keeper/src/homepage/layout_page.dart';
import 'package:inventory_keeper/src/product_type/product_type_list_view.dart';
import 'package:inventory_keeper/src/products/add_product.dart';
import 'package:inventory_keeper/src/routes/slide_top_route.dart';
import 'package:inventory_keeper/src/stock/add_item_safety_quntity.dart';
import 'package:inventory_keeper/src/stock/low_stock_reminder_view.dart';
import 'package:inventory_keeper/src/products/product_details.dart';
import 'package:inventory_keeper/src/products/product_list_view.dart';
import 'package:inventory_keeper/src/routes/fade_route.dart';
import 'package:inventory_keeper/src/routes/size_route.dart';
import 'package:inventory_keeper/src/routes/slide_right_route.dart';
import 'package:inventory_keeper/src/settings/settings_view.dart';
import 'package:inventory_keeper/src/stock/stock_in_out_form.dart';
import 'package:inventory_keeper/src/stock/stock_in_out_items.dart';
import 'package:inventory_keeper/src/stock/stock_list_view.dart';
import 'package:inventory_keeper/src/transaction/transaction_details_page.dart';

///
class AppRouter {
  ///
  ///
  static Route<dynamic> generateRoute(RouteSettings routeSettings) {
    switch (routeSettings.name) {
      case SettingsView.routeName:
        return FadeRoute(page: const SettingsView());
      case StockListView.routeName:
        return FadeRoute(page: const StockListView());
      case ProductTypeListView.routeName:
        return FadeRoute(page: const ProductTypeListView());
      case AddProduct.routeName:
        return CupertinoPageRoute<void>(
          settings: routeSettings,
          builder: (BuildContext context) {
            return const AddProduct();
          },
        );
      case ProductDetails.routeName:
        return CupertinoPageRoute<void>(
          settings: routeSettings,
          builder: (BuildContext context) {
            return const ProductDetails();
          },
        );
      case LayoutPage.routeName:
        return FadeRoute(page: const LayoutPage());
      case TransactionDetailsPage.routeName:
        return FadeRoute(page: const TransactionDetailsPage());
      case LowStockReminderView.routeName:
        return SlideTopRoute(page: const LowStockReminderView());
      case ProductListView.routeName:
        return FadeRoute(page: const ProductListView());
      case AddItemSafetyQuantity.routeName:
        return FadeRoute(page: const AddItemSafetyQuantity());
      case StockInOutForm.routeName:
        if (routeSettings.arguments != null) {
          final data = routeSettings.arguments! as Map<String, bool>;
          return FadeRoute(
            page: StockInOutForm(
              isStockIn: data['isStockIn']!,
            ),
          );
        }
        return FadeRoute(page: const NothingFoundPage());
      case StockInOutItems.routeName:
        if (routeSettings.arguments != null) {
          final data = routeSettings.arguments! as Map<String, bool>;
          return FadeRoute(
            page: StockInOutItems(
              isStockIn: data['isStockIn']!,
            ),
          );
        }
        return FadeRoute(page: const NothingFoundPage());
      default:
        return FadeRoute(page: const NothingFoundPage());
    }
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
