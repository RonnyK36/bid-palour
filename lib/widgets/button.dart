import 'package:bid_palour/config/config.dart';
import 'package:flutter/material.dart';

Container reusableButton({
  String? buttonName,
  VoidCallback? onPressed,
}) {
  return Container(
    height: 50,
    width: 250,
    child: ElevatedButton(
      onPressed: onPressed!,
      child: Text(
        buttonName!,
        style: kButtonTextStyle,
      ),
    ),
  );
}
