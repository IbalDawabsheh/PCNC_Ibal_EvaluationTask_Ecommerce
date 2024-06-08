import 'package:evaluation_task_ecommerce/api/ApiFetch.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

import '../widgets/ProductCard.dart';

class SearchScreen extends StatelessWidget {
  SearchScreen({super.key});
  final ApiController controller = Get.put(ApiController());

  Widget buildProducts(BuildContext context) {
    List<dynamic> allProducts = controller.products;
    return Text(allProducts[0].title.toString());
  }

  @override
  Widget build(BuildContext context) {
    controller.search();
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Search",
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
                searchBar(),
                const SizedBox(height: 30),
                searchResults(),
              ],
            ),
          )),
    );
  }

  SearchBar searchBar() {
    return SearchBar(
      controller: controller.searchController,
      onChanged: (value) {
        controller.search();
      },
      hintText: "Search any Product...",
      hintStyle:
          const MaterialStatePropertyAll(TextStyle(color: Colors.black38)),
      elevation: const MaterialStatePropertyAll(0),
      padding: const MaterialStatePropertyAll(
          EdgeInsets.symmetric(horizontal: 16.0)),
      leading: const Icon(Icons.search, color: Colors.black38),
    );
  }

  Expanded searchResults() {
    return Expanded(
      child: controller.productsSearched.isEmpty
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
          : GridView.builder(
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  childAspectRatio: 0.6, crossAxisCount: 2),
              itemCount: controller.productsSearched.length,
              itemBuilder: (context, index) {
                final p = controller.productsSearched[index];

                return ProductCard(
                    title: p.title,
                    description: p.title,
                    price: p.price,
                    image: p.images.first
                        .toString()
                        .replaceAll('[', "")
                        .replaceAll('"', "")
                        .replaceAll("]", ""));
              },
            ),
    );
  }
}
