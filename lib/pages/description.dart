import 'package:bid_palour/widgets/app_bar.dart';
import 'package:flutter/material.dart';

class Description extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: header(context, titleText: "How it works"),
      body: ListView(
        children: [
          Column(
            children: [Text('Description page')],
          ),
        ],
      ),
    );
    ;
  }
}
