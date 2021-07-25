import 'package:flutter/material.dart';

Container myContainer(String phone, int amount) {
  return Container(
    height: 100,
    width: double.infinity,
    decoration: BoxDecoration(
      color: Colors.white,
      border: Border.all(
        color: Colors.green,
      ),
      borderRadius: BorderRadius.all(
        Radius.circular(13),
      ),
    ),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
          height: 30,
          width: 30,
          child: CircleAvatar(
            backgroundImage: AssetImage('images/alien_circle.jpg'),
          ),
        ),
        SizedBox(width: 5),
        Text(
          phone,
          style: TextStyle(
            color: Colors.green,
            fontSize: 20,
          ),
        ),
        Text(
          ' won Kshs. ',
          style: TextStyle(
            fontSize: 15,
          ),
        ),
        Text(
          amount.toString(),
          style: TextStyle(
            color: Colors.green,
            fontSize: 20,
          ),
        ),
      ],
    ),
  );
}
