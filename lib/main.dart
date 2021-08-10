import 'package:bid_palour/pages/navigation.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'controllers/account_controller.dart';
import 'controllers/auth_controller.dart';
import 'controllers/bid_controller.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp().whenComplete(() => null);
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
      home: Navigation(),
    );
  }
}
