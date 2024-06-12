// ignore_for_file: avoid_print

import 'dart:convert';
import 'package:evaluation_task_ecommerce/Services/api_service.dart';
import 'package:evaluation_task_ecommerce/Services/storage_service.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;

import '../screens/dashboard_screen.dart';

class LoginController extends GetxController {
  ApiService api = Get.find<ApiService>();
  StorageService storage = Get.find<StorageService>();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  RxBool passwordInvisible = true.obs;

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
        "password": password ?? passwordController.text
      });

      var data = jsonDecode(response.body);

      storage.write("access_token", data["access_token"]);
      storage.write("refresh_token", data["refresh_token"]);

      print("Login Success!");
      Get.offAll(() => const DashboardScreen());
    } catch (e) {
      print(e.toString());
    }
  }

  bool toggleVisibility() {
    return passwordInvisible.value = !passwordInvisible.value;
  }
}
