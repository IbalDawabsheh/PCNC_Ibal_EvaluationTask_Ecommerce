// ignore_for_file: avoid_print

import 'dart:convert';
import 'package:evaluation_task_ecommerce/Services/api_service.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

import '../screens/dashboard_screen.dart';

class LoginController extends GetxController {
  ApiService api = Get.put(ApiService());
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  RxBool isButtonEnabled = false.obs;

  @override
  void onClose() {
    emailController.clear();
    passwordController.clear();
    super.onClose();
  }

  Future<void> login({String? email, String? password}) async {
    try {
      final http.Response response = await api.postRequest("auth/login", {
        "email": email ?? emailController.text.trim(),
        "password": password ?? passwordController.text.trim()
      });

      var data = jsonDecode(response.body);

      SharedPreferences sharedPreferences =
          await SharedPreferences.getInstance();
      sharedPreferences.setString("access_token", data["access_token"]);
      sharedPreferences.setString("refresh_token", data["refresh_token"]);
      print("Login Success!");
      Get.offAll(() => const DashboardScreen());
    } catch (e) {
      print(e.toString());
    }
  }
}
