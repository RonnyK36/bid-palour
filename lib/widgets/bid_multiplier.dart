import 'package:bid_palour/config/config.dart';
import 'package:flutter/material.dart';

Padding bidMultiplierButton({required int times}) {
  return Padding(
    padding: EdgeInsets.symmetric(horizontal: 25),
    child: Row(
      children: [
        Text(
          'x',
          style: kBidMultiplier,
        ),
        Text(
          times.toString(),
          style: kBidMultiplier,
        ),
      ],
    ),
  );
}
