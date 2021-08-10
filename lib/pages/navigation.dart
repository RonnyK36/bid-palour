import 'package:bid_palour/models/user_model.dart';
import 'package:bid_palour/pages/account.dart';
import 'package:bid_palour/pages/description.dart';
import 'package:bid_palour/pages/home.dart';
import 'package:bid_palour/pages/login_page.dart';
import 'package:bid_palour/pages/records.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_otp/flutter_otp.dart';
import 'package:get/get.dart';
import 'package:otp_screen/otp_screen.dart';

UserModel? currentUser;
GlobalKey _formKey = GlobalKey();
TextEditingController _phoneNumberController = TextEditingController();
late String phoneNumber;

class Navigation extends StatefulWidget {
  @override
  _NavigationState createState() => _NavigationState();
}

class _NavigationState extends State<Navigation> {
  PageController pageController = PageController();
  //AuthController authController = Get.put<AuthController>(AuthController());
  int pageIndex = 0;
  bool isAuth = false;
  FlutterOtp otp = FlutterOtp();

  onPageChanged(int pageIndex) {
    setState(() {
      this.pageIndex = pageIndex;
    });
  }

  Future<String> validateOtp(String otp) async {
    await Future.delayed(Duration(milliseconds: 2000));
    if (otp == "1234") {
      return "Phone verified successfuly";
    } else {
      return "The entered Otp is wrong";
    }
  }

  // action to be performed after OTP validation is success
  void moveToNextScreen(context) {
    Get.to(LoginPage());
  }

  Widget _startOTP() {
    otp.sendOtp('+254757781821', 'OTP is : 1234');
    return OtpScreen.withGradientBackground(
      topColor: Colors.green,
      bottomColor: Color(0xFF753a88),
      otpLength: 4,
      validateOtp: validateOtp,
      routeCallback: moveToNextScreen,
      themeColor: Colors.white,
      titleColor: Colors.white,
      title: "Phone Number Verification",
      subTitle:
          "Enter OTP sent to the MPESA number: \n${_phoneNumberController.text}",
      icon: Icon(
        Icons.account_circle_outlined,
        color: Colors.white,
      ),
    );
  }

  Widget _phoneInput() {
    return AlertDialog(
      key: _formKey,
      title: Text('Enter your MPESA account number'),
      content: Container(
          height: 40,
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                '+254',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.w500),
              ),
              SizedBox(
                width: 10,
              ),
              Expanded(
                child: TextFormField(
                  controller: _phoneNumberController,
                  keyboardType: TextInputType.phone,
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.w500),
                  onEditingComplete: () {
                    //Navigator.of(context).pop();
                    _startOTP();
                  },
                ),
              ),
            ],
          )),
    );
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

    /*if (authController.user != null) {
      isAuth = true;
    }*/
    isAuth = true;

    pageController = PageController();
  }

  @override
  void dispose() {
    super.dispose();
    pageController.dispose();
  }

  Scaffold buildPages() {
    return Scaffold(
      body: PageView(
        children: [
          Home(),
          Records(),
          // ElevatedButton(
          //   onPressed: () => logout(),
          //   child: Text('Logout'),
          // ),
          Description(),
          Account(
              // account: account,
              ),
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
    /// TODO: Change this back when solved auth controller bug
    return isAuth ? buildPages() : LoginPage();

  }
}
