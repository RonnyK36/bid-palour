import 'package:bid_palour/controllers/account_controller.dart';
import 'package:bid_palour/controllers/bid_controller.dart';
import 'package:bid_palour/pages/authentication.dart';
import 'package:bid_palour/utils/root.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'controllers/auth_controller.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  Get.put(AccountController());
  Get.put(BidController());
  Get.put(AuthController());
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
      home: Root(),
    );
  }
}
