import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:get/get.dart';

class StorageService extends GetxController {
  final storage = const FlutterSecureStorage();

  Future<String?> read(String key) {
    return storage.read(key: key);
  }

  void write(String key, String value) {
    storage.write(key: key, value: value);
  }

  void clear() {
    storage.deleteAll();
  }
}
