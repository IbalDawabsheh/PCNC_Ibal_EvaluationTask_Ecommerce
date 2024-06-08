import 'package:evaluation_task_ecommerce/api/ApiFetch.dart';

import 'package:evaluation_task_ecommerce/widgets/ProductCard.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ProductsScreen extends StatelessWidget {
  ProductsScreen({super.key, required this.id});
  final int id;
  final ApiController controller = Get.put(ApiController());

  @override
  Widget build(BuildContext context) {
    controller.fetchProductsByCategory(id);
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Products",
          style: TextStyle(
            color: Get.theme.primaryColor,
          ),
        ),
        centerTitle: true,
      ),
      body: Obx(() => Container(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              children: [
                productsGrid(),
              ],
            ),
          )),
    );
  }

  Expanded productsGrid() {
    return Expanded(
      child: controller.productsByCategory.isEmpty
          ? Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.asset("assets/images/noResults.png"),
                  const SizedBox(height: 20),
                  const Text("No results found")
                ],
              ),
            )
          : GridView.count(
              crossAxisCount: 2,
              childAspectRatio: 0.6,
              children: controller.productsByCategory
                  .map((p) => ProductCard(
                      title: p.title,
                      description: p.title,
                      price: p.price,
                      image: p.images.first
                          .toString()
                          .replaceAll('[', "")
                          .replaceAll('"', "")
                          .replaceAll("]", "")))
                  .toList()),
    );
  }
}
