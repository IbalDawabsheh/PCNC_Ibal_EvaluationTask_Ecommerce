import 'package:easy_image_viewer/easy_image_viewer.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SearchCard extends StatelessWidget {
  final String title;
  final String? description;
  final double? price;
  final String image;

  const SearchCard({
    required this.title,
    this.description,
    this.price,
    required this.image,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 100,
      height: 300,
      child: Card(
        elevation: 4,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            cardImage(context),
            titleText(),
            descText(),
            price == null ? const SizedBox() : priceText(),
            const Spacer()
          ],
        ),
      ),
    );
  }

  Widget titleText() {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Text(
        title.capitalize!,
        style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
        maxLines: 1,
        overflow: TextOverflow.ellipsis,
      ),
    );
  }

  Widget descText() {
    return Text(
      description ?? "",
      style: const TextStyle(fontSize: 10),
      maxLines: 2,
      overflow: TextOverflow.ellipsis,
    );
  }

  Widget priceText() {
    return Text(
      "\$$price",
      style: const TextStyle(fontSize: 12, fontWeight: FontWeight.bold),
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
