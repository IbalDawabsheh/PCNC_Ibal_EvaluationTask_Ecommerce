import '/screens/search_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

NavigationBar buildNavBar() {
  return NavigationBar(
    onDestinationSelected: (value) {
      switch (value) {
        case 0:
        // Get.offAll(() => DashboardScreen());
        case 3:
          Get.to(() => SearchScreen());
          break;
        default:
      }
    },
    selectedIndex: 0,
    indicatorColor: Get.theme.primaryColor,
    destinations: [
      NavigationDestination(
        icon: const Icon(Icons.home_outlined),
        label: "home".tr,
      ),
      NavigationDestination(
          icon: const Icon(Icons.favorite_outline), label: "wishlist".tr),
      const NavigationDestination(
          icon: Icon(Icons.shopping_cart_outlined), label: ""),
      NavigationDestination(
          icon: const Icon(Icons.search_outlined), label: "search".tr),
      NavigationDestination(
          icon: const Icon(Icons.settings_outlined), label: "settings".tr),
    ],
  );
}
