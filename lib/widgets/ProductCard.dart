import 'package:easy_image_viewer/easy_image_viewer.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ProductCard extends StatelessWidget {
  final String title;
  final double price;
  final String description;
  final String image;
  final VoidCallback? onTap;

  const ProductCard({
    required this.title,
    required this.price,
    required this.description,
    required this.image,
    this.onTap,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 200,
      height: 300,
      child: Card(
        elevation: 0,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            cardImage(context),
            titleText(),
            descText(),
            const Spacer(),
            priceText(),
            bottomIcons()
          ],
        ),
      ),
    );
  }

  ListTile bottomIcons() {
    return const ListTile(
      contentPadding: EdgeInsets.symmetric(horizontal: 8.0),
      dense: true,
      leading: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(Icons.favorite_border),
          SizedBox(width: 5),
          Icon(Icons.bookmark),
        ],
      ),
      trailing: Icon(Icons.add_shopping_cart),
    );
  }

  Padding priceText() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8.0),
      child: Text(
        "\$$price",
        style: const TextStyle(fontWeight: FontWeight.bold),
      ),
    );
  }

  Text descText() {
    return Text(
      description.capitalizeFirst!,
      style: const TextStyle(fontSize: 12),
      maxLines: 2,
      overflow: TextOverflow.ellipsis,
    );
  }

  Padding titleText() {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Text(
        title.capitalize!,
        style: const TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
        maxLines: 1,
        overflow: TextOverflow.ellipsis,
      ),
    );
  }

  Widget cardImage(context) {
    return GestureDetector(
      onTap: () {
        showImageViewer(context, Image.network(image).image,
            swipeDismissible: true, immersive: false);
      },
      child: ClipRRect(
        borderRadius: BorderRadius.circular(8.0),
        child: Image.network(
          image,
          width: 200,
          height: 150,
          fit: BoxFit.cover,
          errorBuilder: (context, error, stackTrace) =>
              Icon(Icons.error, size: 150, color: Get.theme.colorScheme.error),
          loadingBuilder: (context, child, loadingProgress) {
            if (loadingProgress == null) return child;
            return const SizedBox(
                width: 150, height: 150, child: CircularProgressIndicator());
          },
        ),
      ),
    );
  }
}
