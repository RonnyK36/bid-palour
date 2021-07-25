import 'package:bid_palour/config/config.dart';
import 'package:bid_palour/pages/description.dart';
import 'package:bid_palour/pages/details.dart';
import 'package:bid_palour/widgets/app_bar.dart';
import 'package:bid_palour/widgets/bid_multiplier.dart';
import 'package:bid_palour/widgets/button.dart';
import 'package:bid_palour/widgets/carousel_container.dart';
import 'package:bid_palour/widgets/feature_categories.dart';
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
              autoPlayInterval: Duration(seconds: 3),
              autoPlayAnimationDuration: Duration(seconds: 5),
              enlargeCenterPage: true,
            ),
          ),
          Column(
            children: [
              Card(
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text('Coming Soon'),
                      Text('See All'),
                    ],
                  ),
                ),
              ),
              Card(
                child: Container(
                  height: 90,
                  width: double.infinity,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      categories(
                        image: 'images/cash.jpg',
                        label: 'Cash',
                      ),
                      categories(
                        image: 'images/phones.jpg',
                        label: 'Phones',
                      ),
                      categories(
                        image: 'images/tvs.jpg',
                        label: 'TVs',
                      ),
                      categories(
                        image: 'images/electronics.jpg',
                        label: 'Electronics',
                      ),
                    ],
                  ),
                ),
              ),
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
                deduction: '100',
                // planeIsSelected: thousandSelected,
              ),
            ],
          ),
        ],
      ),
    );
  }
}
