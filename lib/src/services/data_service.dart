import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

/// Data Service
class DataService extends GetxService {
  ///
  final box = GetStorage();

  /// Initialize  Storage
  Future<void> initStorage() async {
    await GetStorage.init();
  }

  /// Store Team Id
  void storeTeamId(String teamId) {
    box.write('teamId', teamId);
  }

  ///Get Team Id
  String? restoreTeamId() {
    return box.read('teamId');
  }

  /// Store User Id
  void storeUserId(String userId) {
    box.write('userId', userId);
  }

  ///Get User Id
  String? restoreUserId() {
    return box.read('userId');
  }

  ///Clear all data
  void clearAll() {
    box.erase();
  }
}
