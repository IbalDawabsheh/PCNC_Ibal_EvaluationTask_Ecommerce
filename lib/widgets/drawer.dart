import 'package:evaluation_task_ecommerce/controllers/logout_controller.dart';

import '/screens/login_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

Drawer buildDrawer(BuildContext context) {
  LogoutController controller = Get.put(LogoutController());
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
            title: Text("logout".tr),
            onTap: () {
              showDialog(
                  context: context,
                  builder: (c) => AlertDialog(
                          title: Text("logout".tr),
                          content: Text("logoutConfirm".tr),
                          actions: <Widget>[
                            TextButton(
                                onPressed: () {
                                  Navigator.of(c).pop();
                                },
                                child: Text("cancel".tr)),
                            TextButton(
                                onPressed: () {
                                  controller.logout();
                                  Get.offAll(() => LoginScreen());
                                },
                                child: Text("confirm".tr)),
                          ]));
            },
          ),
        ],
      ),
    ),
  );
}
