import 'package:bid_palour/config/config.dart';
import 'package:country_code_picker/country_code_picker.dart';
import 'package:flutter/material.dart';

class PhoneVerification extends StatefulWidget {
  const PhoneVerification({Key? key}) : super(key: key);

  @override
  _PhoneVerificationState createState() => _PhoneVerificationState();
}

class _PhoneVerificationState extends State<PhoneVerification> {
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
                      child: TextFormField(
                        keyboardType: TextInputType.phone,
                        decoration: InputDecoration(
                          labelText: 'Phone Number',
                          hintText: 'eg 727447786',
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
                    Navigator.pop(context);
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
