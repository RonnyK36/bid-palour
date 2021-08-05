import 'package:bid_palour/config/config.dart';
import 'package:bid_palour/pages/account.dart';
import 'package:bid_palour/pages/records.dart';
import 'package:bid_palour/pages/description.dart';
import 'package:bid_palour/pages/home.dart';
import 'package:bid_palour/pages/verify_phone.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';

final GoogleSignIn googleSignIn = GoogleSignIn();
final userRef = FirebaseFirestore.instance.collection('users');

class Navigation extends StatefulWidget {
  @override
  _NavigationState createState() => _NavigationState();
}

class _NavigationState extends State<Navigation> {
  PageController pageController = PageController();
  int pageIndex = 0;
  bool isAuth = false;

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
    googleSignIn.onCurrentUserChanged.listen((account) {
      checkAuthentication(account);
    }, onError: (error) {
      print('There was an error: $error');
    });

    googleSignIn
        .signInSilently(suppressErrors: false)
        .then((account) => checkAuthentication(account))
        .catchError((error) => print('Error: $error'));
  }

  @override
  void dispose() {
    super.dispose();
    pageController.dispose();
  }

  checkAuthentication(account) {
    if (account != null) {
      setState(() {
        // this.account = account;
        print(account);
        isAuth = true;
      });
    } else {
      setState(() {
        isAuth = false;
      });
    }
  }

  login() async {
    await googleSignIn.signIn();
  }

  logout() async {
    await googleSignIn.signOut();
  }

  createUser() async {
    final GoogleSignInAccount user = googleSignIn.currentUser!;
    final doc = await userRef.doc(user.id).get();
    if (!doc.exists) {
      await Navigator.push(
        context,
        MaterialPageRoute(
          builder: (c) => PhoneVerification(),
        ),
      );
      userRef.doc(user.id).set({
        "id": user.id,
        "photoUrl": user.photoUrl,
        "displayName": user.displayName,
        "email": user.email,
      });
    }
  }

  Scaffold buildAuthPage() {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              Colors.white,
              Theme.of(context).primaryColor.withOpacity(0.5),
            ],
          ),
        ),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'Bid Palor',
                style: kTitleTextStyle,
              ),
              SizedBox(height: 30),
              GestureDetector(
                onTap: login,
                child: Container(
                  height: 50,
                  width: 200,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage("images/google_signin_button.png"),
                    ),
                  ),
                ),
              )
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
    return isAuth ? buildPages() : buildAuthPage();
  }
}
