import 'package:evaluation_task_ecommerce/controllers/dashboard_controller.dart';
import 'package:evaluation_task_ecommerce/screens/categories_screen.dart';
import 'package:evaluation_task_ecommerce/screens/search_screen.dart';
import 'package:evaluation_task_ecommerce/widgets/app_bar.dart';
import 'package:evaluation_task_ecommerce/widgets/category_item.dart';
import 'package:evaluation_task_ecommerce/widgets/drawer.dart';
import 'package:evaluation_task_ecommerce/widgets/nav_bar.dart';
import 'package:evaluation_task_ecommerce/widgets/product_card.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class DashboardScreen extends StatefulWidget {
  const DashboardScreen({super.key});

  @override
  State<DashboardScreen> createState() => _DashboardScreenState();
}

class _DashboardScreenState extends State<DashboardScreen> {
  final DashboardController controller = Get.put(DashboardController());

  @override
  Widget build(BuildContext context) {
    return Obx(() => Scaffold(
          appBar: buildAppBar(controller.avatar.text, context),
          drawer: buildDrawer(context),
          bottomNavigationBar: buildNavBar(),
          body: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 48.0),
                  child: searchBar(),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16.0),
                  child: categoriesText(),
                ),
                categoriesSection(),
                const SizedBox(height: 20),
                productsSection(true),
                trendingSection(),
                const SizedBox(height: 20),
                productsSection(false),
              ],
            ),
          ),
        ));
  }

  Widget searchBar() {
    return SearchBar(
      onTap: () {
        Get.to(() => SearchScreen());
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

  Widget categoriesText() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        const Text(
          "All Categories",
          style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
        ),
        TextButton(
            onPressed: () {
              Get.to(() => CategroiesScreen());
            },
            child: Text(
              "See All",
              style: TextStyle(color: Get.theme.colorScheme.onBackground),
            )),
      ],
    );
  }

  Widget categoriesSection() {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 8.0),
        child: Row(
            children: controller.categories
                .map(
                    (c) => CategoryItem(name: c.name, image: c.image, id: c.id))
                .toList()),
      ),
    );
  }

  Widget productsSection(bool showIcons) {
    RxList<dynamic> selectedList = controller.products;
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Row(
            children: selectedList
                .map((p) => ProductCard(
                    showIcons: showIcons,
                    title: p.title,
                    description: p.title,
                    price: p.price,
                    image: p.images.first.toString()))
                .toList()),
      ),
    );
  }

  Widget trendingSection() {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        padding: const EdgeInsets.all(8.0),
        decoration: BoxDecoration(
            color: Get.theme.colorScheme.secondary,
            borderRadius: const BorderRadius.all(Radius.circular(8.0))),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Trending Products",
                    style: TextStyle(
                        color: Get.theme.colorScheme.onSecondary,
                        fontSize: 14,
                        fontWeight: FontWeight.bold),
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Icon(
                        Icons.date_range_outlined,
                        color: Get.theme.colorScheme.onSecondary,
                      ),
                      Text(
                        "Last Date DD/MM/YY",
                        style:
                            TextStyle(color: Get.theme.colorScheme.onSecondary),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            TextButton(
                style: ButtonStyle(
                  foregroundColor: const MaterialStatePropertyAll(Colors.white),
                  shape: MaterialStateProperty.all(RoundedRectangleBorder(
                      side: const BorderSide(color: Colors.white),
                      borderRadius: BorderRadius.circular(4.0))),
                ),
                onPressed: () {},
                child: const Row(
                  children: [Text("View All"), Icon(Icons.arrow_right_alt)],
                ))
          ],
        ),
      ),
    );
  }
}
