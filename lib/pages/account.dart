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
            children: [
              Text('Account page'),
              Container(
                height: 100,
                width: 100,
                child: CircleAvatar(
                  backgroundImage: AssetImage('images/alien_circle.jpg'),
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Container(
                height: 200,
                width: MediaQuery.of(context).size.width * 0.7,
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text('Account balance :'),
                        Text('100.00'),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text('Withdrawable balance :'),
                        Text('100.00'),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
