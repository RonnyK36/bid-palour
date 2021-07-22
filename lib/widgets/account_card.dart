import 'package:bid_palour/config/config.dart';
import 'package:flutter/material.dart';

Container accountCard(
    {required String title,
    required String subtitle,
    required IconData iconData}) {
  return Container(
    height: 65,
    width: 300,
    child: Card(
      elevation: 0,
      child: ListTile(
        leading: Icon(
          iconData,
        ),
        title: Text(
          title,
          style: kAccountTextSmall,
        ),
        subtitle: Text(subtitle),
      ),
    ),
  );
}
