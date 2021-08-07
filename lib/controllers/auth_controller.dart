import 'package:bid_palour/helpers/db_helper.dart';
import 'package:bid_palour/models/user_model.dart';
import 'package:bid_palour/pages/verify_phone.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import 'package:google_sign_in/google_sign_in.dart';

import 'account_controller.dart';

class AuthController extends GetxController {
  FirebaseAuth _auth = FirebaseAuth.instance;
  final GoogleSignIn _googleSignIn = GoogleSignIn();
  late Rx<User?> _firebaseUser;

  User? get user => _firebaseUser.value;

  @override
  onInit() {
    _firebaseUser.bindStream(_auth.authStateChanges());
    super.onInit();
  }

  void createUser(String phone, String email, String password) async {
    try {
      UserCredential _authResult = await _auth.createUserWithEmailAndPassword(
          email: email.trim(), password: password);
      //create user in db_helper.dart
      UserModel _user = UserModel(
        id: _authResult.user!.uid,
        email: _authResult.user!.email,
        phone: phone,
      );
      if (await Database().createNewUser(_user)) {
        Get.find<AccountController>().user = _user;
        Get.back();
      }
    } catch (e) {
      Get.snackbar(
        "Error creating Account",
        e.toString(),
        snackPosition: SnackPosition.BOTTOM,
      );
    }
  }

  void signInWithGoogle() async {
    try {
      GoogleSignInAccount googleSignInAccount = (await _googleSignIn.signIn())!;
      GoogleSignInAuthentication googleSignInAuthentication =
          await googleSignInAccount.authentication;

      AuthCredential credential = GoogleAuthProvider.credential(
        accessToken: googleSignInAuthentication.accessToken,
        idToken: googleSignInAuthentication.idToken,
      );

      UserCredential _authResult = await _auth.signInWithCredential(credential);

      UserModel _user = UserModel(
        id: _authResult.user!.uid,
        email: _authResult.user!.email,
        phone: _authResult.user!.phoneNumber,
      );

      if (await Database().createNewUser(_user)) {
        Get.find<AccountController>().user = _user;
        Get.to(PhoneVerification());
      }
    } catch (e) {
      Get.snackbar(
        "Error Signing in",
        e.toString(),
        snackPosition: SnackPosition.BOTTOM,
        duration: Duration(seconds: 7),
      );
      print(e.toString());
    }
  }

  void login(String email, String password) async {
    try {
      UserCredential _authResult = await _auth.signInWithEmailAndPassword(
          email: email.trim(), password: password);
      Get.find<AccountController>().user =
          await Database().getUser(_authResult.user!.uid);
    } catch (e) {
      Get.snackbar(
        "Error signing in",
        e.toString(),
        snackPosition: SnackPosition.BOTTOM,
      );
    }
  }

  void signOut() async {
    try {
      await _auth.signOut();
      Get.find<AccountController>().clear();
    } catch (e) {
      Get.snackbar(
        "Error signing out",
        e.toString(),
        snackPosition: SnackPosition.BOTTOM,
      );
    }
  }
}
