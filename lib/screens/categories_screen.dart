import '/controllers/categories_controller.dart';
import '/controllers/search_controller.dart';
import '/widgets/category_card.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

class CategroiesScreen extends StatelessWidget {
  CategroiesScreen({super.key});
  final CategoriesController controller = Get.put(CategoriesController());
  final SearchScreenController searchController =
      Get.put(SearchScreenController());

  @override
  Widget build(BuildContext context) {
    searchController.search("categories");
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "categories".tr,
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
                categoriesGrid(),
              ],
            ),
          )),
    );
  }

  Widget searchBar() {
    return SearchBar(
      controller: searchController.searchController,
      onChanged: (value) {
        searchController.search("categories");
      },
      hintText: "searchAny".tr,
      hintStyle:
          const MaterialStatePropertyAll(TextStyle(color: Colors.black38)),
      elevation: const MaterialStatePropertyAll(0),
      padding: const MaterialStatePropertyAll(
          EdgeInsets.symmetric(horizontal: 16.0)),
      leading: const Icon(Icons.search, color: Colors.black38),
    );
  }

  Widget categoriesGrid() {
    return Expanded(
      child: GridView.count(
        crossAxisCount: 2,
        childAspectRatio: (200 / 250),
        children: searchController.searchResults
            .map((c) => Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: CategoryCard(name: c.name, image: c.image.toString()),
                ))
            .toList(),
      ),
    );
  }
}
