// ignore_for_file: avoid_print

import 'dart:convert';
import 'package:evaluation_task_ecommerce/Services/api_service.dart';
import 'package:evaluation_task_ecommerce/models/product.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;

class ProductsController extends GetxController {
  ApiService api = Get.put(ApiService());
  RxList products = [].obs;
  RxList productsByCategory = [].obs;

  @override
  void onInit() async {
    super.onInit();
    fetchProducts();
  }

  Future<void> fetchProducts() async {
    try {
      final response = await fetchProductsData();

      processProductData(response);
    } catch (e) {
      print(e);
    }
  }

  Future<void> fetchProductsByCategory(int category) async {
    try {
      final response = await fetchProductsData(
          customUri: "products?limit=10&offset=0&categoryId=$category");

      processProductByCategoryData(response);
    } catch (e) {
      print(e);
    }
  }

  Future<http.Response> fetchProductsData({String? customUri}) async {
    return await api.getRequest(customUri ?? "products?limit=10");
  }

  Future<void> processProductData(http.Response response) async {
    List<dynamic> jsonData = json.decode(response.body);
    products.value = jsonData.map((data) => Product.fromJson(data)).toList();
  }

  Future<void> processProductByCategoryData(http.Response response) async {
    List<dynamic> jsonData = json.decode(response.body);
    productsByCategory.value =
        jsonData.map((data) => Product.fromJson(data)).toList();
  }
}
