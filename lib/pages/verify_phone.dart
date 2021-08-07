import 'package:bid_palour/config/config.dart';
import 'package:bid_palour/pages/authentication.dart';
import 'package:country_code_picker/country_code_picker.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class PhoneVerification extends StatefulWidget {
  const PhoneVerification({Key? key}) : super(key: key);

  @override
  _PhoneVerificationState createState() => _PhoneVerificationState();
}

class _PhoneVerificationState extends State<PhoneVerification> {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  TextEditingController phoneNumber = TextEditingController();
  TextEditingController otpCode = TextEditingController();
  bool isLoading = false;
  String? verificationId;
  String? _countryCode;
  String? _formattedPhone;

  Future<void> phoneSignIn({required String? phoneNumber}) async {
    await _auth.verifyPhoneNumber(
        phoneNumber: phoneNumber!,
        verificationCompleted: _onVerificationCompleted,
        verificationFailed: _onVerificationFailed,
        codeSent: _onCodeSent,
        codeAutoRetrievalTimeout: _onCodeTimeout);
  }

  _onVerificationCompleted(PhoneAuthCredential authCredential) async {
    print("verification completed ${authCredential.smsCode}");
    User? user = FirebaseAuth.instance.currentUser;
    setState(() {
      this.otpCode.text = authCredential.smsCode!;
    });
    if (authCredential.smsCode != null) {
      try {
        UserCredential credential =
            await user!.linkWithCredential(authCredential);
      } on FirebaseAuthException catch (e) {
        if (e.code == 'provider-already-linked') {
          await _auth.signInWithCredential(authCredential);
        }
      }
      setState(() {
        isLoading = false;
      });
      Get.to(Navigation());
    }
  }

  _onVerificationFailed(FirebaseAuthException exception) {
    if (exception.code == 'invalid-phone-number') {
      Get.defaultDialog(title: "The phone number entered is invalid!");
    }
    Get.to(Navigation());
  }

  _onCodeSent(String verificationId, int? forceResendingToken) {
    this.verificationId = verificationId;
    print(forceResendingToken);
    print("code sent");
  }

  _onCodeTimeout(String timeout) {
    return null;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        // color: Colors.green,
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Spacer(),
              Text(
                'Create an account',
                style: kTitleTextStyle,
              ),
              SizedBox(height: 30),
              Text(
                'You will receive a verification code to the phone number you submit!',
                style: TextStyle(
                  fontSize: 14,
                  color: Colors.grey,
                  letterSpacing: 1.5,
                ),
                textAlign: TextAlign.center,
              ),
              SizedBox(
                height: 30,
              ),
              Row(
                children: [
                  Container(
                    width: MediaQuery.of(context).size.width * 0.3,
                    height: 70,
                    child: CountryCodePicker(
                      onInit: (countryCode) {
                        _countryCode = countryCode!.dialCode;
                      },
                      onChanged: (countryCode) {
                        setState(() {
                          _countryCode = countryCode.dialCode;
                        });
                      },
                      initialSelection: 'Kenya',
                      textStyle: TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.bold,
                        color: Colors.green,
                      ),
                      showFlag: true,
                      enabled: true,
                      // showDropDownButton: true,
                    ),
                  ),
                  Container(
                    height: 50,
                    width: MediaQuery.of(context).size.width * 0.6,
                    child: Form(
                      key: _formKey,
                      child: TextFormField(
                        controller: phoneNumber,
                        keyboardType: TextInputType.phone,
                        decoration: InputDecoration(
                          labelText: 'Phone Number',
                          hintText: 'eg 7********',
                          border: OutlineInputBorder(),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              Container(
                height: 35,
                width: MediaQuery.of(context).size.width * 0.8,
                child: OutlinedButton(
                  onPressed: () {
                    _formattedPhone = '$_countryCode${phoneNumber.text}';
                    print(_formattedPhone);
                    phoneSignIn(phoneNumber: _formattedPhone);
                  },
                  child: Text(
                    'SUBMIT',
                    style: kButtonTextStyle,
                  ),
                ),
              ),
              // GestureDetector(
              //   onTap: () => print('Submitting'),
              //   child: Container(
              //     height: 35,
              //     width: MediaQuery.of(context).size.width * 0.8,
              //     decoration: BoxDecoration(
              //       color: Theme.of(context).primaryColor,
              //       borderRadius: BorderRadius.circular(5),
              //     ),
              //     child: Center(
              //       child: Text(
              //         'SUBMIT',
              //
              //       ),
              //     ),
              //   ),
              // ),

              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text('Already have an account? '),
                  TextButton(
                    onPressed: () {},
                    child: Text('Login'),
                  ),
                ],
              ),
              // SizedBox(height: 100),
              Spacer(),
              Center(
                child: Padding(
                  padding: EdgeInsets.all(10.0),
                  child: Text(
                    'Verify your phone number to create your account and start bidding.',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 14,
                      color: Colors.grey,
                      letterSpacing: 1.5,
                    ),
                  ),
                ),
              ),
              SizedBox(height: 30),
            ],
          ),
        ),
      ),
    );
  }
}
