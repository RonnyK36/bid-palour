import 'package:get/get.dart';
import 'package:meta/meta.dart';

class AuthController extends GetxController {

  final _user = ''.obs;
  final _isLoggedIn = false.obs;

  set user(value) => _user.value = value;
  get user => _user.value;

  set isLoggedIn(value) => _isLoggedIn.value = value;
  get isLoggedIn => _isLoggedIn.value;

}