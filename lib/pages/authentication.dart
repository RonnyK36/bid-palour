import 'package:bid_palour/config/config.dart';
import 'package:bid_palour/pages/account.dart';
import 'package:bid_palour/pages/active_bids.dart';
import 'package:bid_palour/pages/description.dart';
import 'package:bid_palour/pages/home.dart';
import 'package:country_code_picker/country_code_picker.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Navigation extends StatefulWidget {
  @override
  _NavigationState createState() => _NavigationState();
}

class _NavigationState extends State<Navigation> {
  PageController pageController = PageController();
  int pageIndex = 0;
  bool isAuth = true;

  onPageChanged(int pageIndex) {
    setState(() {
      this.pageIndex = pageIndex;
    });
  }

  onTap(int pageIndex) {
    pageController.animateToPage(
      pageIndex,
      duration: Duration(microseconds: 400),
      curve: Curves.easeInOut,
    );
  }

  @override
  void initState() {
    super.initState();
    pageController = PageController();
  }

  @override
  void dispose() {
    super.dispose();
    pageController.dispose();
  }

  Scaffold buildAuthPage() {
    return Scaffold(
      body: Container(
        // color: Colors.green,
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Spacer(),
              Text(
                'Create an account',
                style: TextStyle(
                  fontSize: 25,
                  fontWeight: FontWeight.bold,
                  color: Theme.of(context).primaryColor,
                ),
              ),
              SizedBox(height: 30),
              Text(
                'You will receive a verification code to the phone number you submit',
                style: TextStyle(
                  fontSize: 14,
                  color: Colors.grey,
                  letterSpacing: 1.5,
                ),
                textAlign: TextAlign.center,
              ),
              SizedBox(
                height: 30,
              ),
              Row(
                children: [
                  Container(
                    width: MediaQuery.of(context).size.width * 0.3,
                    height: 70,
                    child: CountryCodePicker(
                      initialSelection: 'Kenya',
                      textStyle: TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.bold,
                        color: Colors.green,
                      ),
                      showFlag: true,
                      enabled: true,
                      // showDropDownButton: true,
                    ),
                  ),
                  Container(
                    height: 50,
                    width: MediaQuery.of(context).size.width * 0.6,
                    child: Form(
                      child: TextFormField(
                        keyboardType: TextInputType.phone,
                        decoration: InputDecoration(
                          labelText: 'Phone Number',
                          hintText: 'eg 727447786',
                          border: OutlineInputBorder(),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              Container(
                height: 35,
                width: MediaQuery.of(context).size.width * 0.8,
                child: OutlinedButton(
                  onPressed: () {},
                  child: Text(
                    'SUBMIT',
                    style: kButtonTextStyle,
                  ),
                ),
              ),
              // GestureDetector(
              //   onTap: () => print('Submitting'),
              //   child: Container(
              //     height: 35,
              //     width: MediaQuery.of(context).size.width * 0.8,
              //     decoration: BoxDecoration(
              //       color: Theme.of(context).primaryColor,
              //       borderRadius: BorderRadius.circular(5),
              //     ),
              //     child: Center(
              //       child: Text(
              //         'SUBMIT',
              //
              //       ),
              //     ),
              //   ),
              // ),

              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text('Already have an account? '),
                  TextButton(
                    onPressed: () {},
                    child: Text('Login'),
                  ),
                ],
              ),
              // SizedBox(height: 100),
              Spacer(),
              Center(
                child: Padding(
                  padding: EdgeInsets.all(10.0),
                  child: Text(
                    'Verify your phone number to create your account and start bidding.',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 14,
                      color: Colors.grey,
                      letterSpacing: 1.5,
                    ),
                  ),
                ),
              ),
              SizedBox(height: 30),
            ],
          ),
        ),
      ),
    );
  }

  Scaffold buildPages() {
    return Scaffold(
      body: PageView(
        children: [
          Home(),
          ActiveBids(),
          Description(),
          Account(),
        ],
        controller: pageController,
        onPageChanged: onPageChanged,
        physics: NeverScrollableScrollPhysics(),
      ),
      bottomNavigationBar: CupertinoTabBar(
        currentIndex: pageIndex,
        onTap: onTap,
        activeColor: Colors.green,
        items: [
          BottomNavigationBarItem(
            label: 'Home',
            icon: Icon(Icons.home),
          ),
          BottomNavigationBarItem(
            label: 'Active bids',
            icon: Icon(
              Icons.network_cell,
            ),
          ),
          BottomNavigationBarItem(
            label: 'About',
            icon: Icon(
              Icons.description,
              size: 35,
            ),
          ),
          BottomNavigationBarItem(
            label: 'Account',
            icon: Icon(Icons.account_circle),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return isAuth ? buildAuthPage() : buildPages();
  }
}
