import 'package:evaluation_task_ecommerce/Screens/CategoriesScreen.dart';
import 'package:evaluation_task_ecommerce/Screens/LoginScreen.dart';
import 'package:evaluation_task_ecommerce/Screens/SearchScreen.dart';
import 'package:evaluation_task_ecommerce/api/ApiFetch.dart';
import 'package:evaluation_task_ecommerce/widgets/AppBar.dart';
import 'package:evaluation_task_ecommerce/widgets/CategoryItem.dart';
import 'package:evaluation_task_ecommerce/widgets/Drawer.dart';
import 'package:evaluation_task_ecommerce/widgets/NavBar.dart';
import 'package:evaluation_task_ecommerce/widgets/ProductCard.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

class DashboardScreen extends StatefulWidget {
  @override
  State<DashboardScreen> createState() => _DashboardScreenState();
}

class _DashboardScreenState extends State<DashboardScreen> {
  final ApiController controller = Get.put(ApiController());

  @override
  void initState() {
    checkLoginStatus();
    super.initState();
  }

  checkLoginStatus() async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    if (sharedPreferences.getString("refresh_token") == null) {
      Get.offAll(() => const LoginScreen());
    }
  }

  @override
  Widget build(BuildContext context) {
    return Obx(() => Scaffold(
          appBar: buildAppBar(controller.avatar.text),
          drawer: buildDrawer(),
          bottomNavigationBar: buildNavBar(),
          body: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16.0),
                  child: categoriesText(),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 48.0),
                  child: searchBar(),
                ),
                categoriesSection(),
                const SizedBox(height: 30),
                productsSection(false),
                trendingSection(),
                const SizedBox(height: 20),
                productsSection(true),
              ],
            ),
          ),
        ));
  }

  SearchBar searchBar() {
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

  Row categoriesText() {
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

  SingleChildScrollView categoriesSection() {
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

  SingleChildScrollView productsSection(bool offset) {
    RxList<dynamic> selectedList =
        offset ? controller.productsOffset : controller.products;
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Row(
            children: selectedList
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
      ),
    );
  }

  Padding trendingSection() {
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
