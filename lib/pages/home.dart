import 'package:bid_palour/widgets/app_bar.dart';
import 'package:bid_palour/widgets/carousel_container.dart';
import 'package:bid_palour/widgets/single_bid_plane.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.green[700],
      appBar: header(
        context,
        titleText: '07******786',
        balance: 100,
        isHomePage: true,
      ),
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
              autoPlayCurve: Curves.easeInOut,
              autoPlayInterval: Duration(seconds: 3),
              autoPlayAnimationDuration: Duration(seconds: 3),
              enlargeCenterPage: true,
            ),
          ),
          Column(
            children: [
              // Card(
              //   child: Padding(
              //     padding: const EdgeInsets.all(8.0),
              //     child: Row(
              //       mainAxisAlignment: MainAxisAlignment.spaceBetween,
              //       children: [
              //         Text(
              //           'Coming Soon',
              //           style: TextStyle(
              //             fontSize: 20,
              //             fontWeight: FontWeight.bold,
              //           ),
              //         ),
              //         Container(
              //           height: 40,
              //           child: TextButton(
              //             onPressed: () {},
              //             child: Text(
              //               'See All',
              //               style: TextStyle(
              //                 fontSize: 20,
              //                 fontWeight: FontWeight.bold,
              //               ),
              //             ),
              //           ),
              //         ),
              //       ],
              //     ),
              //   ),
              // ),
              // Card(
              //   child: Container(
              //     height: 90,
              //     width: double.infinity,
              //     child: Row(
              //       mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              //       children: [
              //         categories(
              //           context,
              //           image: 'images/phones.jpg',
              //           label: 'Phones',
              //         ),
              //         categories(
              //           context,
              //           image: 'images/hts.jpg',
              //           label: 'Sound system',
              //         ),
              //         categories(
              //           context,
              //           image: 'images/tvs.jpg',
              //           label: 'TVs',
              //         ),
              //         categories(
              //           context,
              //           image: 'images/electronics.jpg',
              //           label: 'Others',
              //         ),
              //       ],
              //     ),
              //   ),
              // ),
            ],
          ),
          Row(
            children: [
              singleBidPlane(
                context,
                image: 'images/fifty.jpg',
                deduction: '5',
                // planeIsSelected: fiftySelected,
              ),
              singleBidPlane(
                context,
                image: 'images/hundred.jpeg',
                deduction: '10',
                // planeIsSelected: hundredSelected,
              ),
            ],
          ),
          Row(
            children: [
              singleBidPlane(
                context,
                image: 'images/twoHundred.jpg',
                deduction: '20',
                // planeIsSelected: twoHundredSelected,
              ),
              singleBidPlane(
                context,
                image: 'images/fiveHundred.jpg',
                deduction: '50',
                // planeIsSelected: fiveHundredSelected,
              ),
            ],
          ),
          Row(
            children: [
              singleBidPlane(
                context,
                image: 'images/thousand.jpg',
                deduction: '100',
                // planeIsSelected: thousandSelected,
              ),
              singleBidPlane(
                context,
                image: 'images/all_notes.jpg',
                deduction: '185',
                // planeIsSelected: thousandSelected,
              ),
            ],
          ),
        ],
      ),
    );
  }
}
