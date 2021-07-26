import 'package:bid_palour/models/user_model.dart';
import 'package:get/get.dart';

class AccountController extends GetxController {
  Rx<UserModel> _userModel = UserModel().obs;
  final accountNumber = ''.obs;
  final ownerId = ''.obs;
  final balance = 0.0.obs;
  final availableWithdrawals = 0.0.obs;
  final winnings = 0.0.obs;
  final pendingPayments = 0.obs;
  final completedPayments = 0.obs;
  UserModel get user => _userModel.value;
  set user(UserModel value) => this._userModel.value = value;

  @override
  void onInit() {
    // TODO: implement fetch account information from database
    super.onInit();
  }

  void clear() {
    _userModel.value = UserModel();
  }
}
