import 'package:bid_palour/config/config.dart';
import 'package:bid_palour/pages/description.dart';
import 'package:bid_palour/pages/details.dart';
import 'package:bid_palour/widgets/app_bar.dart';
import 'package:bid_palour/widgets/bid_multiplier.dart';
import 'package:bid_palour/widgets/button.dart';
import 'package:bid_palour/widgets/carousel_container.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
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
      appBar: header(context, titleText: '07******786', balance: 100),
      body: ListView(
        children: [
          SizedBox(
            height: 10,
          ),
          CarouselSlider(
            items: [
              myContainer('07*****786', 2000),
              myContainer('07*****395', 1000),
              myContainer('07*****567', 200),
              myContainer('07*****296', 500),
            ],
            options: CarouselOptions(
              height: 50,
              autoPlay: true,
              enlargeCenterPage: true,
            ),
          ),
          Row(
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
            ],
          ),
          Row(
            children: [
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
            ],
          ),
          Row(
            children: [
              singleBidPlane(
                image: 'images/thousand.jpg',
                deduction: '100',
                planeIsSelected: thousandSelected,
              ),
              singleBidPlane(
                image: 'images/all_notes.jpg',
                deduction: '100',
                planeIsSelected: thousandSelected,
              ),
            ],
          ),
        ],
      ),
    );
  }

  Container singleBidPlane({
    required String image,
    required List<bool> planeIsSelected,
    // required VoidCallback onPressed,
    required String deduction,
  }) {
    return Container(
      height: 200,
      width: MediaQuery.of(context).size.width * 0.5,
      child: GestureDetector(
        onTap: () => Navigator.push(
            context, MaterialPageRoute(builder: (c) => Details())),
        child: Card(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              SizedBox(
                height: 5,
              ),
              SizedBox(
                height: 5,
              ),
              Card(
                elevation: 0,
                child: Container(
                  height: 100,
                  width: MediaQuery.of(context).size.width * 0.4,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage(image),
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 5,
              ),
              // Center(
              //   child: Container(
              //     height: 40,
              //     width: MediaQuery.of(context).size.width * 0.4,
              //     color: Colors.white,
              //     child: ToggleButtons(
              //       isSelected: planeIsSelected,
              //       fillColor: Colors.green.withOpacity(0.7),
              //       selectedBorderColor: Colors.white,
              //       selectedColor: Colors.white,
              //       color: Colors.black,
              //       renderBorder: true,
              //       splashColor: Colors.red.withOpacity(0.5),
              //       onPressed: (int selectedIndex) {
              //         setState(() {
              //           for (int index = 0;
              //               index < planeIsSelected.length;
              //               index++) {
              //             if (index == selectedIndex) {
              //               planeIsSelected[index] = true;
              //               print('Multiplying by: ${index + 2}');
              //             } else {
              //               planeIsSelected[index] = false;
              //             }
              //           }
              //         });
              //       },
              //       children: [
              //         bidMultiplierButton(times: 2),
              //         bidMultiplierButton(times: 3),
              //         bidMultiplierButton(times: 4),
              //         bidMultiplierButton(times: 5),
              //       ],
              //     ),
              //   ),
              // ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 8.0),
                    child: Text('Bid and win x10'),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(right: 8.0),
                    child: Text('@ $deduction'),
                  ),
                ],
              ),
              SizedBox(
                height: 5,
              ),
              Container(
                height: 40,

                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    TextButton(
                      onPressed: () {},
                      child: Text('View more'),
                    ),
                    TextButton(
                      onPressed: () {},
                      child: Text('Bid now'),
                    ),
                  ],
                ),
                // child: reusableButton(
                // onPressed: () {}, buttonName: "Bid @ $deduction"),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
