import 'package:bid_palour/controllers/account_controller.dart';
import 'package:bid_palour/controllers/bid_controller.dart';
import 'package:bid_palour/pages/authentication_page.dart';
import 'package:bid_palour/pages/navigation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

void main() {
  Get.put(AccountController());
  Get.put(BidController());
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.green,
        accentColor: Colors.purple,
      ),
      // Still working on authentication screen
      // home: AuthenticationPage(),
      home: Navigation(),
    );
  }
}
