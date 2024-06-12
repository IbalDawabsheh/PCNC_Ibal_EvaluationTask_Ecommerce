import 'dart:async';
import '/controllers/user_status_controller.dart';
import '/screens/dashboard_screen.dart';
import '/screens/login_screen.dart';
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
          : Get.offAll(() => LoginScreen());
    });
    return Scaffold(
      body: Center(
        child: Image.asset("assets/images/splash.png"),
      ),
    );
  }
}
