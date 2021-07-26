import 'package:bid_palour/widgets/app_bar.dart';
import 'package:flutter/material.dart';

class CategoriesPage extends StatefulWidget {
  final String image;
  final String label;
  CategoriesPage({required this.image, required this.label});

  @override
  _CategoriesPageState createState() => _CategoriesPageState();
}

class _CategoriesPageState extends State<CategoriesPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: header(
        context,
        isHomePage: false,
        titleText: widget.label,
        balance: 100,
      ),
      body: Text('Categories'),
    );
  }
}
