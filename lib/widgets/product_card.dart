import 'package:easy_image_viewer/easy_image_viewer.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ProductCard extends StatelessWidget {
  final bool showIcons;
  final String title;
  final double price;
  final String description;
  final String image;
  final VoidCallback? onTap;

  const ProductCard({
    required this.showIcons,
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
      width: 170,
      height: 255,
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
            showIcons ? bottomIcons() : const SizedBox(height: 40),
          ],
        ),
      ),
    );
  }

  Widget bottomIcons() {
    return const ListTile(
      contentPadding: EdgeInsets.symmetric(horizontal: 8.0),
      dense: true,
      leading: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(
            Icons.favorite_border,
            size: 20,
          ),
          SizedBox(width: 5),
          Icon(
            Icons.bookmark,
            size: 20,
          ),
        ],
      ),
      trailing: Icon(
        Icons.add_shopping_cart,
        size: 20,
      ),
    );
  }

  Widget priceText() {
    return Text(
      "\$$price",
      style: const TextStyle(fontSize: 12, fontWeight: FontWeight.bold),
    );
  }

  Widget descText() {
    return Text(
      description.capitalizeFirst!,
      style: const TextStyle(fontSize: 10),
      maxLines: 2,
      overflow: TextOverflow.ellipsis,
    );
  }

  Widget titleText() {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Text(
        title.capitalize!,
        style: const TextStyle(fontSize: 12, fontWeight: FontWeight.bold),
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
          width: 170,
          height: 120,
          fit: BoxFit.cover,
          errorBuilder: (context, error, stackTrace) => Image.asset(
            "assets/images/error.png",
            width: 120,
            height: 120,
          ),
          loadingBuilder: (context, child, loadingProgress) {
            if (loadingProgress == null) return child;
            return const SizedBox(
                width: 120, height: 120, child: CircularProgressIndicator());
          },
        ),
      ),
    );
  }
}
