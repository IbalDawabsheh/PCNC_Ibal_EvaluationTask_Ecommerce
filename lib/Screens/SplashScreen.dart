import 'dart:async';
import 'package:evaluation_task_ecommerce/Screens/DashboardScreen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Timer(const Duration(seconds: 3), () {
      Get.offAll(() => DashboardScreen());
    });
    return Scaffold(
      body: Center(
        child: Image.asset("assets/images/splash.png"),
      ),
    );
  }
}
