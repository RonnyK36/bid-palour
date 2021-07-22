import 'package:bid_palour/config/config.dart';
import 'package:flutter/material.dart';

Row accountRow({
  required String title,
  required String value,
  required bool isCredit,
}) {
  return Row(
    mainAxisAlignment: MainAxisAlignment.spaceBetween,
    children: [
      Text(
        title,
        style: kAccountText,
      ),
      Text(
        value,
        style: isCredit ? kAccountWinning : kAccountBal,
      ),
    ],
  );
}
