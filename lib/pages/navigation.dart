import 'package:bid_palour/pages/account.dart';
import 'package:bid_palour/pages/description.dart';
import 'package:bid_palour/pages/home.dart';
import 'package:bid_palour/pages/active_bids.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Navigation extends StatefulWidget {
  @override
  _NavigationState createState() => _NavigationState();
}

class _NavigationState extends State<Navigation> {
  PageController pageController = PageController();
  int pageIndex = 0;

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
    return buildPages();
  }
}
