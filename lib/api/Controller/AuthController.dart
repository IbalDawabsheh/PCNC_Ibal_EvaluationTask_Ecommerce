// ignore_for_file: avoid_print

import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart';
import 'package:http_status/http_status.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../Screens/DashboardScreen.dart';

class AuthController extends GetxController {
  TextEditingController nameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController passwordConfirmController = TextEditingController();

  @override
  void onClose() {
    nameController.dispose();
    emailController.dispose();
    passwordController.dispose();
    super.onClose();
  }

  Future<void> login() async {
    try {
      final response = await post(
          Uri.parse("https://api.escuelajs.co/api/v1/auth/login"),
          body: {
            "email": emailController.text.trim(),
            "password": passwordController.text.trim()
          });
      if (response.statusCode.isSuccessfulHttpStatusCode) {
        var data = jsonDecode(response.body.toString());
        SharedPreferences sharedPreferences =
            await SharedPreferences.getInstance();
        sharedPreferences.setString("access_token", data["access_token"]);
        sharedPreferences.setString("refresh_token", data["refresh_token"]);
        print("Login Success!");
        Get.offAll(() => DashboardScreen());
      } else {
        print("Login Fail");
        print(response.statusCode);
      }
    } catch (e) {
      print(e.toString());
    }
  }

  Future<void> register() async {
    try {
      final response =
          await post(Uri.parse("https://api.escuelajs.co/api/v1/users"), body: {
        "email": emailController.text.trim(),
        "name": nameController.text.trim(),
        "password": passwordController.text == passwordConfirmController.text
            ? passwordController.text.trim()
            : "",
        "role": "customer",
        "avatar":
            "https://t4.ftcdn.net/jpg/00/65/77/27/360_F_65772719_A1UV5kLi5nCEWI0BNLLiFaBPEkUbv5Fv.jpg"
      });
      if (response.statusCode.isSuccessfulHttpStatusCode) {
        print("Register Success!");
        login();
      } else {
        print("Register Fail");
        print(response.statusCode);
      }
    } catch (e) {
      print(e.toString());
    }
  }
}
