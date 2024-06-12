import 'package:evaluation_task_ecommerce/Services/storage_service.dart';

import '/Services/api_service.dart';
import 'package:get/get.dart';
import 'package:jwt_decoder/jwt_decoder.dart';

class UserStatusController extends GetxController {
  ApiService api = Get.find<ApiService>();
  StorageService storage = Get.find<StorageService>();

  @override
  void onInit() {
    checkLoginStatus();
    super.onInit();
  }

  bool loggedIn = false;
  String refreshToken = "";

  void checkLoginStatus() async {
    refreshToken = await storage.read("refresh_token") ?? "";
    if (refreshToken.isEmpty) {
      loggedIn = false;
    } else {
      checkTokenExpiration();
    }
  }

  bool checkTokenExpiration() {
    bool hasExpired = JwtDecoder.isExpired(refreshToken);
    if (hasExpired) return loggedIn = false;

    return loggedIn = true;
  }
}
