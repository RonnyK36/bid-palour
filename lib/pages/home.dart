import 'package:bid_palour/config/config.dart';
import 'package:bid_palour/widgets/app_bar.dart';
import 'package:bid_palour/widgets/button.dart';
import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[100],
      appBar: header(context, titleText: 'Bid Palour'),
      body: ListView(
        children: [
          Column(
            children: [
              Text('Home page'),
            ],
          ),
          Card(
            color: Colors.white,
            elevation: 5,
            child: Container(
              height: 200,
              width: 200,
              decoration: BoxDecoration(
                  image: DecorationImage(
                      image: AssetImage('images/hundred.jpeg'))),
            ),
          ),
          SizedBox(
            height: 20,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                width: 200,
                height: 50,
                child: reusableButton(onPressed: () {}, buttonName: "Bid now"),
              )
            ],
          ),
        ],
      ),
    );
  }
}
