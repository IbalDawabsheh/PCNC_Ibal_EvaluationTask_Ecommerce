import 'package:evaluation_task_ecommerce/Screens/SearchScreen.dart';
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
    destinations: const [
      NavigationDestination(
        icon: Icon(Icons.home_outlined),
        label: "Home",
      ),
      NavigationDestination(
          icon: Icon(Icons.favorite_outline), label: "Wishlist"),
      NavigationDestination(
          icon: Icon(Icons.shopping_cart_outlined), label: ""),
      NavigationDestination(icon: Icon(Icons.search_outlined), label: "Search"),
      NavigationDestination(
          icon: Icon(Icons.settings_outlined), label: "Settings"),
    ],
  );
}
