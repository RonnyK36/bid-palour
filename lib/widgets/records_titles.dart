import 'package:bid_palour/config/config.dart';
import 'package:flutter/material.dart';

Container recordsTitle() {
  return Container(
    child: Column(
      children: [
        SizedBox(
          height: 30,
        ),
        Container(
          padding: EdgeInsets.symmetric(horizontal: 10),
          width: double.infinity,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Date',
                style: kButtonTextStyle,
              ),
              Text(
                'Pos Price',
                style: kButtonTextStyle,
              ),
              Text(
                'Bids',
                style: kButtonTextStyle,
              ),
              Text(
                'Ticket No.',
                style: kButtonTextStyle,
              ),
            ],
          ),
        ),
        SizedBox(height: 20),
      ],
    ),
  );
}
