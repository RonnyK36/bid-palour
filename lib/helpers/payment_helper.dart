import 'package:bid_palour/helpers/db_helper.dart';
import 'package:bid_palour/models/user_model.dart';
import 'package:flutter/material.dart';
import 'package:flutterwave/flutterwave.dart';
import 'package:flutterwave/models/responses/charge_response.dart';

class PaymentHelper {
  void makePayment(UserModel user, BuildContext context, int _amount) async {
    final Flutterwave flutterwave = Flutterwave.forUIPayment(
        context: context,
        encryptionKey: "",
        publicKey: "",
        currency: "KES",
        amount: _amount.toString(),
        email: user.email!,
        fullName: user.phone!,
        txRef: "Bid Parlour",
        isDebugMode: true,
        phoneNumber: user.phone!,
        acceptCardPayment: false,
        acceptUSSDPayment: false,
        acceptAccountPayment: false,
        acceptFrancophoneMobileMoney: false,
        acceptGhanaPayment: false,
        acceptMpesaPayment: true,
        acceptRwandaMoneyPayment: false,
        acceptUgandaPayment: false,
        acceptZambiaPayment: false);

    try {
      final ChargeResponse response =
          await flutterwave.initializeForUiPayments();
      if (response == null) {
        // user didn't complete the transaction. Payment wasn't successful.
      } else {
        final isSuccessful = checkPaymentIsSuccessful(response, _amount);
        if (isSuccessful) {
          await Database.savePayment(
            user: user,
            amount: _amount,
            value: _amount * 10,
          );
          // provide value to customer
        } else {
          // check message
          print('This is the response message:');
          print(response.message);

          // check status
          print(response.status);

          // check processor error
          print(response.data!.processorResponse);
        }
      }
    } catch (error, stacktrace) {}
  }

  bool checkPaymentIsSuccessful(final ChargeResponse response, int amount) {
    return response.data!.status == FlutterwaveConstants.SUCCESSFUL &&
        response.data!.currency == "KES" &&
        response.data!.amount == amount.toString() &&
        response.data!.txRef == "Test Payment";
  }
}
