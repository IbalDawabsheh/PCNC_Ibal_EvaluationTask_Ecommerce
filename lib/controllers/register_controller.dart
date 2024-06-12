// ignore_for_file: avoid_print

import 'package:evaluation_task_ecommerce/controllers/login_controller.dart';
import 'package:evaluation_task_ecommerce/Services/api_service.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class RegisterController extends GetxController {
  ApiService api = Get.find<ApiService>();
  LoginController loginController = Get.put(LoginController());
  TextEditingController nameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController passwordConfirmController = TextEditingController();

  @override
  void onClose() {
    nameController.clear();
    emailController.clear();
    passwordController.clear();
    passwordConfirmController.clear();
    super.onClose();
  }

  Future<void> register() async {
    try {
      await api.postRequest("users", {
        "email": emailController.text.trim(),
        "name": nameController.text.trim(),
        "password": passwordController.text == passwordConfirmController.text
            ? passwordController.text
            : "",
        "role": "customer",
        "avatar":
            "https://t4.ftcdn.net/jpg/00/65/77/27/360_F_65772719_A1UV5kLi5nCEWI0BNLLiFaBPEkUbv5Fv.jpg"
      });
      print("Register Success!");
      loginController.login(
          email: emailController.text, password: passwordController.text);
    } catch (e) {
      print(e.toString());
    }
  }
}
