// ignore_for_file: avoid_print

import 'dart:convert';
import 'package:evaluation_task_ecommerce/Services/api_service.dart';
import 'package:evaluation_task_ecommerce/models/category.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;

class CategoriesController extends GetxController {
  ApiService api = Get.put(ApiService());
  RxList categories = [].obs;

  @override
  void onInit() async {
    super.onInit();
    fetchCategories();
  }

  Future<void> fetchCategories() async {
    try {
      final response = await fetchCategoriesData();

      processCategoryData(response);
    } catch (e) {
      print(e);
    }
  }

  Future<http.Response> fetchCategoriesData() async {
    return await api.getRequest("categories?limit=10");
  }

  Future<void> processCategoryData(http.Response response) async {
    List<dynamic> jsonData = json.decode(response.body);
    categories.value = jsonData.map((data) => Category.fromJson(data)).toList();
  }
}
