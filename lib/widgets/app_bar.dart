import 'package:flutter/material.dart';

AppBar header(
  context, {
  required String titleText,
  required int balance,
  bool isHomePage = false,
}) {
  return AppBar(
    elevation: 0,
    backgroundColor: Colors.white,
    title: Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Row(
          children: [
            Container(
              child: isHomePage
                  ? CircleAvatar(
                      backgroundImage: AssetImage('images/alien_circle.jpg'),
                    )
                  : Text(''),
            ),
            SizedBox(width: 3),
            Text(
              titleText,
              style: TextStyle(
                fontSize: 22,
                color: Theme.of(context).primaryColor,
              ),
            ),
          ],
        ),
        Container(
          height: 35,
          width: 110,
          decoration: BoxDecoration(
            color: Colors.red.withOpacity(0.5),
            borderRadius: BorderRadius.circular(20),
          ),
          child: Padding(
            padding: const EdgeInsets.all(8),
            child: Row(
              textBaseline: TextBaseline.alphabetic,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Kshs. ',
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 12,
                  ),
                ),
                Text(
                  balance.toString(),
                  style: TextStyle(
                    fontSize: 20,
                    color: Colors.green,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    ),
    centerTitle: true,
  );
}
