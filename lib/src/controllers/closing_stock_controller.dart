import 'package:intl/intl.dart';
import 'package:inventory_keeper/src/api/firebase_repository.dart';
import 'package:inventory_keeper/src/controllers/base_controller.dart';
import 'package:inventory_keeper/src/models/closing_stock/closing_stock.dart';

///
class ClosingStockController extends BaseController {
  final FireBaseRepository _api = FireBaseRepository('closingStock');

  /// Future Products
  Future<ClosingStock?> getClosingStockByDate(String date) async {
    final obj = await _api.getClosingStockByDate(date);

    if (obj != null) {
      return ClosingStock.fromJson(obj);
    }
    return null;
  }

  /// Add a product to a current products state
  Future<bool> setClosingStock(ClosingStock closingStock) async {
    return _api.createOrUpdate(
        closingStock.toJson(), DateFormat.yMMMEd().format(closingStock.date));
  }
}
