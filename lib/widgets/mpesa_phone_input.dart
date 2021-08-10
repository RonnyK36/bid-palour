import 'package:bid_palour/controllers/account_controller.dart';
import 'package:bid_palour/pages/verify_phone.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

GlobalKey _formKey = GlobalKey();
TextEditingController _phoneNumberController = TextEditingController();
late String phoneNumber;

class PhoneInput extends StatelessWidget {
  const PhoneInput({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    AccountController controller = Get.find<AccountController>();
    return AlertDialog(
      key: _formKey,
      title: Text('Enter your MPESA account number'),
      content: Container(
          height: 40,
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                '+254',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.w500),
              ),
              SizedBox(
                width: 10,
              ),
              Expanded(
                child: TextFormField(
                  controller: _phoneNumberController,
                  keyboardType: TextInputType.phone,
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.w500),
                  onEditingComplete: () {
                    //Navigator.of(context).pop();
                    controller
                        .accountNumber("+254${_phoneNumberController.text}");
                    print("Entered phone: +254${_phoneNumberController.text}");
                    Get.off(PhoneVerification());
                  },
                ),
              ),
            ],
          )),
    );
  }
}
