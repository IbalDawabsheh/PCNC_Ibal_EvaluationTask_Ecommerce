import 'package:evaluation_task_ecommerce/Screens/LoginScreen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

Drawer buildDrawer() {
  return Drawer(
    backgroundColor: Get.theme.primaryColor,
    child: SafeArea(
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          ListTile(
            textColor: Get.theme.colorScheme.onPrimary,
            iconColor: Get.theme.colorScheme.onPrimary,
            leading: const Icon(Icons.logout),
            title: const Text('Logout'),
            onTap: () {
              logout();
            },
          ),
        ],
      ),
    ),
  );
}

logout() async {
  var sharedPreferences = await SharedPreferences.getInstance();
  sharedPreferences.clear();
  Get.offAll(() => LoginScreen());
}
