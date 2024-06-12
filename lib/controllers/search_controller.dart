// ignore_for_file: avoid_print

import '/controllers/categories_controller.dart';
import '/controllers/products_controller.dart';
import '/Services/api_service.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SearchScreenController extends GetxController {
  ApiService api = Get.find<ApiService>();
  CategoriesController categoriesController = Get.put(CategoriesController());
  ProductsController productsController = Get.put(ProductsController());
  RxList categories = [].obs;
  RxList products = [].obs;
  RxList searchResults = [].obs;
  TextEditingController searchController = TextEditingController();

  @override
  void onInit() async {
    super.onInit();
    categories = categoriesController.categories;
    products = productsController.products;
  }

  void search(String searchIn) {
    searchResults.clear();

    for (var c in categories) {
      if (c.name
          .toString()
          .isCaseInsensitiveContainsAny(searchController.text)) {
        if (searchIn == "categories" || searchIn == "both") {
          searchResults.add(c);
        }
      }
    }

    for (var p in products) {
      if (p.title
          .toString()
          .isCaseInsensitiveContainsAny(searchController.text)) {
        if (searchIn == "products" || searchIn == "both") {
          searchResults.add(p);
        }
      }
    }
  }
}
