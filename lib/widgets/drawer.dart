import 'package:evaluation_task_ecommerce/screens/login_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

Drawer buildDrawer(BuildContext context) {
  return Drawer(
    backgroundColor: Get.theme.primaryColor,
    child: SafeArea(
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          ListTile(
            textColor: Get.theme.colorScheme.onPrimary,
            iconColor: Get.theme.colorScheme.onPrimary,
            leading: Image.asset(
              "assets/images/logout.png",
              width: 32,
              height: 32,
            ),
            title: const Text('Logout'),
            onTap: () {
              showDialog(
                  context: context,
                  builder: (c) => AlertDialog(
                          title: const Text("Logout"),
                          content:
                              const Text("Are you sure you want to logout?"),
                          actions: <Widget>[
                            TextButton(
                                onPressed: () {
                                  Navigator.of(c).pop();
                                },
                                child: const Text("Cancel")),
                            TextButton(
                                onPressed: () {
                                  logout();
                                },
                                child: const Text("Confirm")),
                          ]));
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
  Get.offAll(() => const LoginScreen());
}
