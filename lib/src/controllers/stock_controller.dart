// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import 'package:intl/intl.dart';
// import 'package:inventory_keeper/src/api/firebase_repository.dart';
// import 'package:inventory_keeper/src/controllers/base_controller.dart';
// import 'package:inventory_keeper/src/models/product/product.dart';
// import 'package:inventory_keeper/src/models/product_summary/product_summary.dart';
// import 'package:inventory_keeper/src/models/product_transaction/product_transaction.dart';
// import 'package:inventory_keeper/src/models/stock/stock.dart';
// import 'package:inventory_keeper/src/utility/helpers.dart';

// /// Stock Controller
// class StockController extends BaseController {
//   final FireBaseRepository _api = FireBaseRepository('stocks');

//   Stock? _stock;
//   Stock? _closingStock;
//   String? _closingStockDate;
//   ProductTransaction? _transaction;
//   int? _currentStock;
//   int? _incomingStock;
//   int? _outgoingStock;
//   DateTime? _updatedAt;
//   DateTime? _createdAt;
//   int _totalSelectedQuantity = 0;

//   ///
//   set stock(Stock? i) {
//     _stock = i;
//     update();
//   }

//   ///
//   set transaction(ProductTransaction? i) {
//     _transaction = i;
//     update();
//   }

//   ///
//   set currentStock(int? i) {
//     currentStock = i;
//     update();
//   }

//   ///
//   set incomingStock(int? i) {
//     incomingStock = i;
//     update();
//   }

//   ///
//   set outgoingStock(int? i) {
//     outgoingStock = i;
//     update();
//   }

//   ///
//   set updatedAt(DateTime? i) {
//     updatedAt = i;
//     update();
//   }

//   ///
//   set createdAt(DateTime? i) {
//     createdAt = i;
//     update();
//   }

//   ///
//   Stock? get stock => _stock;

//   ///
//   Stock? get closingStock => _closingStock;

//   ///
//   String? get closingStockDate => _closingStockDate;

//   ///
//   ProductTransaction? get productTransaction => _transaction;

//   ///
//   int? get currentStock => _currentStock;

//   ///
//   int? get incomingStock => _incomingStock;

//   ///
//   int? get outgoingStock => _outgoingStock;

//   ///
//   DateTime? get updatedAt => _updatedAt;

//   ///
//   DateTime? get createdAt => _createdAt;

//   ///
//   TextEditingController nameController = TextEditingController();

//   ///
//   FocusNode nameFocusNode = FocusNode();

//   ///
//   Rx<List<Stock>> stockList = Rx<List<Stock>>([]);

//   ///
//   List<Stock> get stocks => stockList.value;
//   @override
//   void onReady() {
//     stockList.bindStream(
//       _api.streamDataCollection().map(
//             (maps) => maps.map((item) {
//               return Stock.fromJson(item);
//             }).toList(),
//           ),
//     );
//   }

//   /// Future Items
//   Future<List<Stock>> fetchItems() async {
//     busy = true;
//     final objs = await _api.allItems();
//     busy = false;
//     final ps = <Stock>[];
//     for (final item in objs) {
//       ps.add(Stock.fromJson(item));
//     }
//     return ps;
//   }

//   ///
//   Future<void> getStockByDate(DateTime date) async {
//     _closingStockDate = DateFormat.yMMMEd().format(date);
//     busy = true;
//     final obj = await _api.getClosingStockByDate(dateToMillSeconds(date));
//     busy = false;
//     if (obj != null) {
//       _closingStock = Stock.fromJson(obj);
//       update();
//     } else {
//       _closingStock = null;
//     }
//   }

//   ///

//   // /// Add a product to a current Stocks state
//   // Future<bool> addStock({
//   //   required bool isIncoming,
//   //   required double totalAmount,
//   //   required Map<String, ProductSummary> items,
//   //   required List<Product> allProducts,
//   //   required int totalQuantity,
//   //   DateTime? date,
//   // }) async {
//   //   final stockDate = date ?? DateTime.now();
//   //   final existingStock = stocks.firstWhereOrNull(
//   //     (stock) => stock.createdAt == dateToMillSeconds(stockDate),
//   //   );
//   //   final formattedDateString = DateFormat.yMMMEd().format(stockDate);

//   //   var summaryTotalQuantity = 0;
//   //   final overAllProductSummaryMap = allProducts.map(
//   //     (prod) {
//   //       // prod = productWithLatestInfo(prod, ]);
//   //       summaryTotalQuantity =
//   //           summaryTotalQuantity + (items[prod.id]?.currentStock ?? 0);
//   //       final mapItem = <String, dynamic>{
//   //         'active': prod.active ?? true,
//   //         'amount': isIncoming ? prod.buyPrice : prod.salePrice,
//   //         'isIncoming': isIncoming,
//   //         'id': prod.id ?? '',
//   //         'name': prod.name,
//   //         'summaryDate': stockDate,
//   //         'currentStock': items[prod.id]?.currentStock ?? prod.currentStock,
//   //         'selectedQuantity': items[prod.id]?.quantity ?? prod.selectedQuantity,
//   //       };

//   //       return mapItem;
//   //     },
//   //   ).toList();

//   //   final stock = Stock(
//   //     totalAmount: 0,
//   //     totalQuantity: summaryTotalQuantity,
//   //     createdAt: dateToMillSeconds(stockDate),
//   //     productsSummary: [],
//   //     transactions: [],
//   //   );

//   //   final transactionMap = <String, dynamic>{
//   //     'isIncoming': isIncoming,
//   //     'totalSelectedQuantity': _totalSelectedQuantity,
//   //     'createdAt': stockDate,
//   //     'productsSummary': prodSummaryMap(items.values.toList()),
//   //     'totalQuantity': isIncoming ? totalQuantity : -1 * totalQuantity,
//   //     'totalAmount': totalAmount,
//   //   };

//   //   final map = stock.toJson();
//   //   map['productsSummary'] = overAllProductSummaryMap;

//   //   if (existingStock?.transactions != null) {
//   //     final List<Map<String, dynamic>> transactions =
//   //         existingStock!.transactions
//   //             .map(
//   //               (e) => {
//   //                 'transactionType': e.transactionType,
//   //                 'totalSelectedQuantity': e.totalSelectedQuantity,
//   //                 'createdAt': e.transactionDate,
//   //                 'productsSummary': prodSummaryMap(e.productsSummary),
//   //                 'totalQuantity': e.totalQuantity,
//   //                 'totalAmount': e.totalAmount,
//   //               },
//   //             )
//   //             .toList();

//   //     // ignore: cascade_invocations
//   //     transactions.add(transactionMap);
//   //     map['transactions'] = transactions;
//   //   } else {
//   //     map['transactions'] = [transactionMap];
//   //   }

//   //   final success = await _api.createOrUpdate(
//   //     map,
//   //     formattedDateString,
//   //   );
//   //   if (success) {
//   //     // _navigationService.goBackUntil(ProductListView.routeName);
//   //   }
//   //   return success;
//   // }

//   ///
//   List<Map<String, dynamic>> prodSummaryMap(List<ProductSummary> prods) {
//     return prods.map(
//       (e) {
//         _totalSelectedQuantity = _totalSelectedQuantity + (e.quantity);
//         return {
//           'active': e.active,
//           'amount': e.amount,
//           'id': e.id,
//           'name': e.name,
//           'summaryDate': e.summaryDate,
//           'currentStock': e.currentStock,
//           'selectedQuantity': e.quantity,
//         };
//       },
//     ).toList();
//   }

//   /// Remove product from a current Stocks state
//   Future<bool> removeStock() async {
//     final success = await _api.removeOne(stock!.toJson());
//     if (success) {
//       stock = null;
//       // var count = 0;
//       // _navigationService.goBackUntil((route) {
//       //   return count++ == 2;
//       // });
//     }
//     update();
//     return success;
//   }

//   /// Fetching stream of data
//   Stream<List<Stock>> fetchStocksAsStream() {
//     return _api.streamDataCollection().map(
//           (maps) => maps.map(Stock.fromJson).toList(),
//         );
//   }
// }
