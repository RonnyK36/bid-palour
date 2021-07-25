import 'package:flutter/material.dart';

Column categories({required String label, required String image}) {
  return Column(
    mainAxisAlignment: MainAxisAlignment.spaceAround,
    children: [
      CircleAvatar(
        backgroundImage: AssetImage(image),
        radius: 35,
      ),
      Text(label),
    ],
  );
}
