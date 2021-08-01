import 'package:bid_palour/controllers/account_controller.dart';
import 'package:bid_palour/widgets/account_card.dart';
import 'package:bid_palour/widgets/account_row.dart';
import 'package:bid_palour/widgets/app_bar.dart';
import 'package:bid_palour/widgets/button.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Account extends StatefulWidget {
  // final GoogleSignInAccount account;
  // Account({required this.account});

  @override
  _AccountState createState() => _AccountState();
}

class _AccountState extends State<Account> {
  AccountController controller = Get.find<AccountController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: header(context, titleText: 'Profile', balance: 100),
      body: Center(
        child: Container(
          width: double.infinity,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              SizedBox(
                height: 10,
              ),
              Container(
                height: 100,
                width: 100,
                child: CircleAvatar(
                  backgroundImage: AssetImage('images/alien_circle.jpg'),
                ),
              ),
              Container(
                height: 200,
                width: MediaQuery.of(context).size.width * 0.8,
                child: Column(
                  children: [
                    accountCard(
                      // title: widget.account.displayName!,
                      title: 'Kelvin Rono',
                      subtitle: 'Username',
                      iconData: Icons.person,
                    ),
                    accountCard(
                      title: 'ronnykelvyne3@gmail.com',
                      subtitle: 'Email',
                      iconData: Icons.email,
                    ),
                    accountCard(
                      title: '0727447786',
                      subtitle: 'Phone',
                      iconData: Icons.phone,
                    ),
                  ],
                ),
              ),
              SizedBox(height: 10),
              Container(
                height: 185,
                // color: Colors.blue,

                width: MediaQuery.of(context).size.width * 0.8,
                child: Column(
                  children: [
                    accountRow(
                      title: 'Account balance:',
                      value: '100.00',
                      isCredit: true,
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    accountRow(
                      title: 'Withdrawable :',
                      value: '90.00',
                      isCredit: false,
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    accountRow(
                      title: 'Running bids :',
                      value: '5',
                      isCredit: true,
                    ),
                    SizedBox(height: 10),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        textButton(
                            label: 'Withdraw cash',
                            onPressed: () {
                              print('Withdrawing');
                            }),
                        SizedBox(width: 35),
                        textButton(
                            label: 'Deposit funds',
                            onPressed: () {
                              print('Depositing');
                            }),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
