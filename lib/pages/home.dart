import 'package:bid_palour/widgets/app_bar.dart';
import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: header(context, titleText: 'Bid Palour'),
      body: ListView(
        children: [
          Column(
            children: [Text('Home page')],
          ),
        ],
      ),
    );
    ;
  }
}
