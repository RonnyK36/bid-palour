import 'package:bid_palour/config/config.dart';
import 'package:flutter/material.dart';

class AuthenticationPage extends StatefulWidget {
  @override
  _AuthenticationPageState createState() => _AuthenticationPageState();
}

// TextEditingController passworController = TextEditingController();

class _AuthenticationPageState extends State<AuthenticationPage> {
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final isObscure = true;

  @override
  void initState() {
    emailController.addListener(() {
      setState(() {});
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: Center(
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'Bid Palor',
                  style: TextStyle(
                    color: Theme.of(context).primaryColor,
                    fontSize: 30,
                    fontWeight: FontWeight.bold,
                    letterSpacing: 2,
                  ),
                ),
                SizedBox(height: 40),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(
                      Icons.favorite_border_outlined,
                      color: Theme.of(context).primaryColor,
                      size: 35,
                    ),
                    SizedBox(width: 10),
                    Text(
                      'Bet on your luck and win',
                      style: kInvoiceHeader,
                    ),
                  ],
                ),
                SizedBox(height: 30),
                BuildEmailInput(
                  emailController: emailController,
                  label: 'Email',
                ),
                SizedBox(height: 10),
                BuildPasswordInput(
                  passwordController: passwordController,
                  label: 'Password',
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class BuildEmailInput extends StatelessWidget {
  BuildEmailInput({
    required this.emailController,
    required this.label,
  });

  final TextEditingController emailController;

  final String label;

  final isObscure = true;

  hideText() {}

  @override
  Widget build(BuildContext context) {
    return TextField(
      obscureText: false,
      controller: emailController,
      decoration: InputDecoration(
        contentPadding: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
        labelText: label,
        labelStyle: TextStyle(
          fontWeight: FontWeight.bold,
          fontSize: 17,
        ),
        suffixIcon: emailController.text.isEmpty
            ? Container(width: 0)
            : IconButton(
                icon: Icon(Icons.close),
                onPressed: () => emailController.clear(),
              ),
        hintText: 'youremail@gmail.com',
        hintStyle: TextStyle(
          fontStyle: FontStyle.italic,
          fontSize: 15,
        ),
        border: OutlineInputBorder(),
        prefixIcon: Icon(Icons.email_outlined),
      ),
      keyboardType: TextInputType.emailAddress,
      textInputAction: TextInputAction.done,
    );
  }
}

class BuildPasswordInput extends StatelessWidget {
  BuildPasswordInput({
    required this.passwordController,
    required this.label,
  });

  final TextEditingController passwordController;
  final String label;

  hideText() {}

  @override
  Widget build(BuildContext context) {
    return TextField(
      obscureText: true,
      controller: passwordController,
      decoration: InputDecoration(
        contentPadding: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
        labelText: label,
        labelStyle: TextStyle(
          fontWeight: FontWeight.bold,
          fontSize: 17,
        ),
        suffixIcon: passwordController.text.isEmpty
            ? Container(width: 0)
            : IconButton(
                icon: Icon(Icons.remove_red_eye_outlined),
                onPressed: () => hideText(),
              ),
        hintText: 'Enter your password',
        hintStyle: TextStyle(
          fontStyle: FontStyle.italic,
          fontSize: 15,
        ),
        border: OutlineInputBorder(),
        prefixIcon: Icon(Icons.lock),
      ),
      keyboardType: TextInputType.emailAddress,
      textInputAction: TextInputAction.done,
    );
  }
}
