import 'package:get/geta.dart';

class AccountController extends GetxController {
  final accountNumber = ''.obs;
  final ownerId = ''.obs;
  final balance = 0.0.obs;
  final availableWithdrawals = 0.0.obs;
  final winnings = 0.0.obs;
  final pendingPayments = 0.obs;
  final completedPayments = 0.obs;

  @override
  void onInit() {
    // TODO: implement fetch account information from database
    super.onInit();
  }
}
