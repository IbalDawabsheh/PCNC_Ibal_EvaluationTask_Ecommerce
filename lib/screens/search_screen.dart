import '/controllers/search_controller.dart';
import '/models/product.dart';
import '/models/category.dart';
import '/widgets/search_card.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

class SearchScreen extends StatelessWidget {
  SearchScreen({super.key});
  final SearchScreenController controller = Get.put(SearchScreenController());

  Widget buildProducts(BuildContext context) {
    List<dynamic> allProducts = controller.products;
    return Text(allProducts[0].title.toString());
  }

  @override
  Widget build(BuildContext context) {
    controller.search("both");
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "search".tr,
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

  Widget searchBar() {
    return SearchBar(
      controller: controller.searchController,
      onChanged: (value) {
        controller.search("both");
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

  Widget searchResults() {
    return Expanded(
      child: controller.searchResults.isEmpty
          ? Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.asset("assets/images/noResults.png"),
                  const SizedBox(height: 20),
                  Text("noResults".tr)
                ],
              ),
            )
          : GridView.builder(
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  childAspectRatio: 0.75, crossAxisCount: 2),
              itemCount: controller.searchResults.length,
              itemBuilder: (context, index) {
                final result = controller.searchResults[index];
                if (result is Category) {
                  return SearchCard(
                      title: result.name, image: result.image.toString());
                } else if (result is Product) {
                  return SearchCard(
                      title: result.title,
                      description: result.description,
                      price: result.price,
                      image: result.images.first.toString());
                }
                return null;
              },
            ),
    );
  }
}
