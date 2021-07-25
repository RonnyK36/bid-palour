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
