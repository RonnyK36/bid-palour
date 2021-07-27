import 'package:bid_palour/controllers/account_controller.dart';
import 'package:bid_palour/pages/navigation.dart';
import 'package:flutter/material.dart';
import 'package:bid_palour/controllers/auth_controller.dart';
import 'package:bid_palour/pages/home.dart';
import 'package:get/get.dart';

class Root extends GetWidget<AuthController> {
  @override
  Widget build(BuildContext context) {
    return GetX(
      initState: (_) async {
        Get.put<AccountController>(AccountController());
      },
      builder: (_) {
        if (Get.find<AuthController>().user?.uid != null) {
          return Navigation();
        } else {
          /// TODO: Replace this with authentication screen
          return Navigation();
        }
      },
    );
  }
}
