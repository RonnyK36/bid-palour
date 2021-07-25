import 'package:flutter/material.dart';

class PreviewScreenShot extends StatelessWidget {
  PreviewScreenShot({required this.image});
  String image;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
      child: Container(
        decoration: BoxDecoration(
          color: Colors.green[200],
          image: DecorationImage(
            image: AssetImage(image),
          ),
        ),
      ),
    ));
  }
}
