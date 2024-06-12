import '/Services/storage_service.dart';
import 'package:get/get.dart';

class LogoutController extends GetxController {
  StorageService storage = Get.find<StorageService>();
  void logout() async {
    storage.clear();
  }
}
