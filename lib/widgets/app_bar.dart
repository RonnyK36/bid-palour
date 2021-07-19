import 'package:flutter/material.dart';

AppBar header(
  context, {
  String? titleText,
}) {
  return AppBar(
    backgroundColor: Theme.of(context).primaryColor,
    title: Text(
      titleText!,
      style: TextStyle(
        fontSize: 25,
      ),
    ),
    centerTitle: true,
  );
}
