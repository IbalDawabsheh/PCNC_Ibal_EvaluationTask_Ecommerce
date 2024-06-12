// ignore_for_file: avoid_print

import 'dart:convert';
import 'package:evaluation_task_ecommerce/Services/storage_service.dart';
import 'package:evaluation_task_ecommerce/controllers/categories_controller.dart';
import 'package:evaluation_task_ecommerce/controllers/products_controller.dart';
import 'package:evaluation_task_ecommerce/Services/api_service.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;

class DashboardController extends GetxController {
  ApiService api = Get.find<ApiService>();
  StorageService storage = Get.find<StorageService>();
  CategoriesController categoriesController = Get.put(CategoriesController());
  ProductsController productsController = Get.put(ProductsController());
  RxList categories = [].obs;
  RxList products = [].obs;
  TextEditingController avatar = TextEditingController();

  @override
  void onInit() async {
    super.onInit();
    categories = categoriesController.categories;
    products = productsController.products;
    fetchAvatar();
  }

  Future<void> fetchAvatar() async {
    try {
      String? accessToken = await storage.read("access_token");
      Map<String, String> requestHeaders = {
        "Authorization": "Bearer $accessToken",
      };
      final response = await fetchAvatarData(requestHeaders);

      processAvatarData(response);
    } catch (e) {
      print(e);
    }
  }

  Future<http.Response> fetchAvatarData(
      Map<String, String> requestHeaders) async {
    return await api.getRequest("auth/profile", headers: requestHeaders);
  }

  Future<void> processAvatarData(http.Response response) async {
    var data = jsonDecode(response.body.toString());
    avatar.text = data["avatar"];
  }
}
