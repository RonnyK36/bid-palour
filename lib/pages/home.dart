import 'package:bid_palour/controllers/bid_controller.dart';
import 'package:bid_palour/widgets/app_bar.dart';
import 'package:bid_palour/widgets/bid_multiplier.dart';
import 'package:bid_palour/widgets/button.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  BidController controller = Get.find<BidController>();

  List<bool> fiftySelected = [
    true,
    false,
    false,
    false,
  ];
  List<bool> hundredSelected = [
    true,
    false,
    false,
    false,
  ];
  List<bool> twoHundredSelected = [
    true,
    false,
    false,
    false,
  ];
  List<bool> fiveHundredSelected = [
    true,
    false,
    false,
    false,
  ];
  List<bool> thousandSelected = [
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
          singleBidPlane(
            image: 'images/fifty.jpg',
            deduction: '5',
            planeIsSelected: fiftySelected,
          ),
          singleBidPlane(
            image: 'images/hundred.jpeg',
            deduction: '10',
            planeIsSelected: hundredSelected,
          ),
          singleBidPlane(
            image: 'images/twoHundred.jpg',
            deduction: '20',
            planeIsSelected: twoHundredSelected,
          ),
          singleBidPlane(
            image: 'images/fiveHundred.jpg',
            deduction: '50',
            planeIsSelected: fiveHundredSelected,
          ),
          singleBidPlane(
            image: 'images/thousand.jpg',
            deduction: '100',
            planeIsSelected: thousandSelected,
          ),
        ],
      ),
    );
  }

  Column singleBidPlane({
    required String image,
    required List<bool> planeIsSelected,
    // required VoidCallback onPressed,
    required String deduction,
  }) {
    return Column(
      children: [
        SizedBox(
          height: 5,
        ),
        SizedBox(
          height: 5,
        ),
        Card(
          child: Container(
            height: 200,
            width: double.infinity,
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage(image),
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
              isSelected: planeIsSelected,
              fillColor: Colors.green.withOpacity(0.7),
              selectedBorderColor: Colors.white,
              selectedColor: Colors.white,
              color: Colors.black,
              renderBorder: true,
              splashColor: Colors.red.withOpacity(0.5),
              onPressed: (int selectedIndex) {
                setState(() {
                  for (int index = 0; index < planeIsSelected.length; index++) {
                    if (index == selectedIndex) {
                      planeIsSelected[index] = true;
                      print('Multiplying by: ${index + 2}');
                    } else {
                      planeIsSelected[index] = false;
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
            child: reusableButton(
                onPressed: () {}, buttonName: "Bid @ $deduction")),
      ],
    );
  }
}
