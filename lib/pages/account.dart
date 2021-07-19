import 'package:bid_palour/widgets/app_bar.dart';
import 'package:flutter/material.dart';

class Account extends StatefulWidget {
  @override
  _AccountState createState() => _AccountState();
}

class _AccountState extends State<Account> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: header(context, titleText: 'Profile'),
      body: ListView(
        children: [
          Column(
            children: [Text('Account page')],
          ),
        ],
      ),
    );
  }
}
