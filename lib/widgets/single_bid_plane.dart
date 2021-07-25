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
    height: 210,
    width: MediaQuery.of(context).size.width * 0.5,
    child: GestureDetector(
      onTap: () => Navigator.push(
        context,
        MaterialPageRoute(
          builder: (c) => Details(
            image: image,
            deduction: int.parse(deduction),
          ),
        ),
      ),
      child: Card(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Card(
              elevation: 0,
              child: Container(
                height: 100,
                width: MediaQuery.of(context).size.width * 0.5,
                decoration: BoxDecoration(
                  color: Colors.black.withOpacity(0.8),
                  image: DecorationImage(
                    fit: BoxFit.fill,
                    image: AssetImage(image),
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 5,
            ),
            Row(
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 7.0),
                  child: Text(
                    'Bid at KES ',
                    style: TextStyle(
                      fontSize: 13,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                Text(
                  ' $deduction ',
                  style: TextStyle(
                    fontSize: 15,
                    fontWeight: FontWeight.bold,
                    color: Colors.red,
                  ),
                ),
                Text(
                  ' and win ',
                  style: TextStyle(
                    fontSize: 13,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.only(left: 7.0),
              child: Row(
                children: [
                  Text(
                    ' KES ',
                    style: TextStyle(
                      fontSize: 13,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text(
                    '${int.parse(deduction) * 10}',
                    style: TextStyle(
                      fontSize: 17,
                      fontWeight: FontWeight.bold,
                      color: Colors.green,
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 5,
            ),
            Container(
              height: 40,

              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 3),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    TextButton(
                      onPressed: () => Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (c) => Details(
                                    image: image,
                                    deduction: int.parse(deduction),
                                  ))),
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
