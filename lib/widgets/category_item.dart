import '/screens/products_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CategoryItem extends StatelessWidget {
  const CategoryItem({
    super.key,
    required this.name,
    required this.image,
    required this.id,
  });

  final String name;
  final String image;
  final int id;

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 0,
      child: Column(
        children: [
          GestureDetector(
            onTap: () {
              Get.to(() => ProductsScreen(id: id));
            },
            child: ClipRRect(
              borderRadius: BorderRadius.circular(32),
              child: Image.network(image,
                  width: 50,
                  height: 50,
                  errorBuilder: (context, error, stackTrace) => Icon(
                      Icons.error,
                      size: 50,
                      color: Get.theme.colorScheme.error),
                  loadingBuilder: (context, child, loadingProgress) {
                    if (loadingProgress == null) return child;
                    return const SizedBox(
                        width: 50,
                        height: 50,
                        child: CircularProgressIndicator());
                  }),
            ),
          ),
          Text(name)
        ],
      ),
    );
  }
}
