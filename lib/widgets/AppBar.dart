import 'package:flutter/material.dart';

AppBar buildAppBar(String image) {
  return AppBar(
    title: Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Image.asset(
          "assets/images/logo.png",
          width: 20,
          height: 20,
        ),
        const Text("PCNC"),
      ],
    ),
    actions: [
      Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0),
        child: CircleAvatar(
          backgroundImage: Image.network(image).image,
          onBackgroundImageError: (exception, stackTrace) {
            const CircularProgressIndicator();
          },
        ),
      )
    ],
    centerTitle: true,
  );
}
