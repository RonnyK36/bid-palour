import 'package:bid_palour/pages/categories_page.dart';
import 'package:bid_palour/pages/details.dart';
import 'package:flutter/material.dart';

Column categories(context, {required String label, required String image}) {
  return Column(
    mainAxisAlignment: MainAxisAlignment.spaceAround,
    children: [
      GestureDetector(
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (c) => CategoriesPage(
                image: image,
                label: label,
              ),
            ),
          );
        },
        child: CircleAvatar(
          backgroundImage: AssetImage(image),
          radius: 35,
        ),
      ),
      Text(label),
    ],
  );
}
