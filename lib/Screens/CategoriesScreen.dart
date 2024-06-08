import 'package:evaluation_task_ecommerce/api/ApiFetch.dart';
import 'package:evaluation_task_ecommerce/widgets/CategoryCard.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

class CategroiesScreen extends StatelessWidget {
  CategroiesScreen({super.key});
  final ApiController controller = Get.put(ApiController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Categories",
          style: GoogleFonts.libreCaslonText().copyWith(
              fontWeight: FontWeight.bold,
              color: Get.theme.colorScheme.secondary),
        ),
        centerTitle: true,
      ),
      body: Container(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            categoriesGrid(),
          ],
        ),
      ),
    );
  }

  Expanded categoriesGrid() {
    return Expanded(
      child: GridView.count(
        crossAxisCount: 2,
        childAspectRatio: (200 / 250),
        children: controller.categories
            .map((c) => Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: CategoryCard(
                      name: c.name,
                      image: c.image
                          .toString()
                          .replaceAll('[', "")
                          .replaceAll('"', "")
                          .replaceAll("]", "")),
                ))
            .toList(),
      ),
    );
  }
}
