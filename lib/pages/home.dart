import 'package:bid_palour/config/config.dart';
import 'package:bid_palour/widgets/app_bar.dart';
import 'package:bid_palour/widgets/bid_multiplier.dart';
import 'package:bid_palour/widgets/button.dart';
import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  List<bool> isSelected = [
    true,
    false,
    false,
    false,
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[100],
      appBar: header(context, titleText: 'Bid Parlour'),
      body: ListView(
        children: [
          SizedBox(
            height: 5,
          ),
          Column(
            children: [
              Text(
                'Race to 100',
                style: kAccountText,
              ),
            ],
          ),
          SizedBox(
            height: 5,
          ),
          Card(
            child: Container(
              height: 200,
              width: 200,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage('images/hundred.jpeg'),
                ),
              ),
            ),
          ),
          SizedBox(
            height: 10,
          ),
          Center(
            child: Container(
              height: 50,
              color: Colors.white,
              child: ToggleButtons(
                isSelected: isSelected,
                fillColor: Colors.green.withOpacity(0.7),
                selectedBorderColor: Colors.white,
                selectedColor: Colors.white,
                color: Colors.black,
                renderBorder: true,
                splashColor: Colors.red.withOpacity(0.5),
                onPressed: (int selectedIndex) {
                  setState(() {
                    for (int index = 0; index < isSelected.length; index++) {
                      if (index == selectedIndex) {
                        isSelected[index] = true;
                        print('Multiplying by: ${index + 2}');
                      } else {
                        isSelected[index] = false;
                      }
                    }
                  });
                },
                children: [
                  bidMultiplierButton(times: 2),
                  bidMultiplierButton(times: 3),
                  bidMultiplierButton(times: 4),
                  bidMultiplierButton(times: 5),
                ],
              ),
            ),
          ),
          SizedBox(
            height: 20,
          ),
          Center(
              child: reusableButton(onPressed: () {}, buttonName: "Bid now")),
        ],
      ),
    );
  }
}
