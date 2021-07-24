import 'package:bid_palour/config/config.dart';
import 'package:flutter/material.dart';

Container reusableButton({
  String? buttonName,
  VoidCallback? onPressed,
}) {
  return Container(
    height: 40,
    width: 200,
    child: ElevatedButton(
      onPressed: onPressed!,
      child: Text(
        buttonName!,
        style: kButtonTextStyle,
      ),
    ),
  );
}

TextButton textButton({
  required String label,
  required VoidCallback onPressed,
}) {
  return TextButton(
    onPressed: () {},
    child: Text(
      label,
      style: TextStyle(
        color: Colors.green,
        fontSize: 17,
        fontWeight: FontWeight.bold,
      ),
    ),
  );
}
