import 'package:evaluation_task_ecommerce/Services/api_service.dart';
import 'package:get/get.dart';
import 'package:jwt_decoder/jwt_decoder.dart';
import 'package:shared_preferences/shared_preferences.dart';

class UserStatusController extends GetxController {
  ApiService api = Get.put(ApiService());

  @override
  void onInit() {
    checkLoginStatus();
    super.onInit();
  }

  bool loggedIn = false;
  String refreshToken = "";

  void checkLoginStatus() async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    refreshToken = sharedPreferences.getString("refresh_token") ?? "";
    if (refreshToken.isEmpty) {
      loggedIn = false;
    } else {
      checkTokenExpiration();
    }
  }

  void checkTokenExpiration() {
    bool hasExpired = JwtDecoder.isExpired(refreshToken);
    if (hasExpired) {
      loggedIn = false;
    } else {
      loggedIn = true;
    }
  }
}
