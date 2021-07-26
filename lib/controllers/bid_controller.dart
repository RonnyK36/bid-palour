import 'package:get/get.dart';

class BidController extends GetxController {
  final bidMultiplier = 1.obs;
  final bidAmount = 0.0.obs;
  final bidValue = 0.obs;

  @override
  void onInit() {
    ///TODO: Implement biding initialization, database initialization, authCheckers
    super.onInit();
  }

  setBidMultiplier(int multiplier) {
    bidMultiplier(multiplier);
    print('Selected multiplier: $multiplier');
  }

  setBidAmount(double amount) {
    bidAmount(amount);
    print('Selected amount: $amount');
  }

  setBidValue(int value) {
    bidValue(value);
    print('Bid value: $value');
  }

}
