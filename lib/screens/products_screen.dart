import 'package:evaluation_task_ecommerce/controllers/products_controller.dart';

import 'package:evaluation_task_ecommerce/widgets/product_card.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

class ProductsScreen extends StatelessWidget {
  ProductsScreen({super.key, required this.id});
  final int id;
  final ProductsController controller = Get.put(ProductsController());

  @override
  Widget build(BuildContext context) {
    controller.fetchProductsByCategory(id);
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Products",
          style: GoogleFonts.libreCaslonText().copyWith(
              fontWeight: FontWeight.bold,
              color: Get.theme.colorScheme.secondary),
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

  Widget productsGrid() {
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
              childAspectRatio: 0.75,
              children: controller.productsByCategory
                  .map((p) => ProductCard(
                      showIcons: true,
                      title: p.title,
                      description: p.title,
                      price: p.price,
                      image: p.images.first.toString()))
                  .toList()),
    );
  }
}
