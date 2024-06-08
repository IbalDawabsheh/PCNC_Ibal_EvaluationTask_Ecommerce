// ignore_for_file: avoid_print

import 'dart:convert';
import 'package:evaluation_task_ecommerce/api/Api2model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart';
import 'package:http_status/http_status.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ApiController extends GetxController {
  RxList categories = [].obs;
  RxList products = [].obs;
  RxList productsOffset = [].obs;
  RxList productsByCategory = [].obs;
  RxList productsSearched = [].obs;
  TextEditingController searchController = TextEditingController();
  TextEditingController avatar = TextEditingController();

  @override
  void onInit() async {
    super.onInit();
    fetchCategories();
    fetchProducts(0);
    fetchProducts(10);
    getAvatar();
  }

  Future<void> fetchCategories() async {
    try {
      final response = await get(
          Uri.parse("https://api.escuelajs.co/api/v1/categories?limit=10"));
      if (response.statusCode.isSuccessfulHttpStatusCode) {
        List<dynamic> jsonData = json.decode(response.body);
        categories.value =
            jsonData.map((data) => Category.fromJson(data)).toList();
      } else {
        print("Fetch Categories Failed");
        print(response.statusCode);
      }
    } catch (e) {
      print(e.toString());
    }
  }

  Future<void> fetchProducts(int offset) async {
    try {
      final response = await get(Uri.parse(
          "https://api.escuelajs.co/api/v1/products?limit=10&offset=$offset"));
      if (response.statusCode.isSuccessfulHttpStatusCode) {
        List<dynamic> jsonData = json.decode(response.body);
        if (offset == 0) {
          products.value =
              jsonData.map((data) => Product.fromJson(data)).toList();
        } else {
          productsOffset.value =
              jsonData.map((data) => Product.fromJson(data)).toList();
        }
      } else {
        print("Fetch Products Failed");
        print(response.statusCode);
      }
    } catch (e) {
      print(e.toString());
    }
  }

  Future<void> fetchProductsByCategory(int category) async {
    try {
      final response = await get(Uri.parse(
          "https://api.escuelajs.co/api/v1/products?limit=10&offset=0&categoryId=$category"));
      if (response.statusCode.isSuccessfulHttpStatusCode) {
        List<dynamic> jsonData = json.decode(response.body);
        productsByCategory.value =
            jsonData.map((data) => Product.fromJson(data)).toList();
      } else {
        print("Fetch Products Failed");
        print(response.statusCode);
      }
    } catch (e) {
      print(e.toString());
    }
  }

  Future<void> getAvatar() async {
    try {
      SharedPreferences sharedPreferences =
          await SharedPreferences.getInstance();
      String? accessToken = sharedPreferences.getString("access_token");
      Map<String, String> requestHeaders = {
        "Authorization": "Bearer $accessToken",
      };
      final response = await get(
          Uri.parse("https://api.escuelajs.co/api/v1/auth/profile"),
          headers: requestHeaders);
      if (response.statusCode.isSuccessfulHttpStatusCode) {
        var data = jsonDecode(response.body.toString());
        avatar.text = data["avatar"];
      } else {
        print("Get Avatar Failed");
        print(response.statusCode);
      }
    } catch (e) {
      print(e.toString());
    }
  }

  void search() {
    productsSearched.clear();
    for (var p in products) {
      if (p.title
          .toString()
          .isCaseInsensitiveContainsAny(searchController.text)) {
        productsSearched.add(p);
      }
    }
  }
}
