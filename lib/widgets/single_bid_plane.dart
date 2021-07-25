import 'package:bid_palour/pages/details.dart';
import 'package:flutter/material.dart';

Container singleBidPlane(
  context, {
  required String image,
  // required List<bool> planeIsSelected,
  // required VoidCallback onPressed,
  required String deduction,
}) {
  return Container(
    height: 200,
    width: MediaQuery.of(context).size.width * 0.5,
    child: GestureDetector(
      onTap: () => Navigator.push(
          context,
          MaterialPageRoute(
              builder: (c) => Details(
                    image: image,
                    deduction: int.parse(deduction),
                  ))),
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
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 8.0),
                  child: Text(
                    'Bid and win x10',
                    style: TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(right: 8.0),
                  child: Row(
                    children: [
                      Text(
                        '@',
                        style: TextStyle(
                          fontSize: 15,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Text(
                        '$deduction',
                        style: TextStyle(
                          color: Colors.red,
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
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
                    child: Text(
                      'View more',
                      style: TextStyle(color: Colors.black),
                    ),
                  ),
                  OutlinedButton(
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
