import 'dart:async';
import 'package:evaluation_task_ecommerce/controllers/user_status_controller.dart';
import 'package:evaluation_task_ecommerce/screens/dashboard_screen.dart';
import 'package:evaluation_task_ecommerce/screens/login_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SplashScreen extends StatelessWidget {
  SplashScreen({super.key});
  final UserStatusController controller = Get.put(UserStatusController());

  @override
  Widget build(BuildContext context) {
    Timer(const Duration(seconds: 3), () {
      controller.loggedIn
          ? Get.offAll(() => const DashboardScreen())
          : Get.offAll(() => const LoginScreen());
    });
    return Scaffold(
      body: Center(
        child: Image.asset("assets/images/splash.png"),
      ),
    );
  }
}
