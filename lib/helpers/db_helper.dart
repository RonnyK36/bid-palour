import 'package:bid_palour/models/user_model.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class Database {
  static final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  Future<bool> createNewUser(UserModel user) async {
    try {
      await _firestore.collection("users").doc(user.id).set({
        "email": user.email,
        "phone": user.phone,
      });
      return true;
    } catch (e) {
      print(e);
      return false;
    }
  }

  Future<UserModel> getUser(String uid) async {
    try {
      DocumentSnapshot _doc =
          await _firestore.collection("users").doc(uid).get();

      return UserModel.fromDocumentSnapshot(documentSnapshot: _doc);
    } catch (e) {
      print(e);
      rethrow;
    }
  }

  static savePayment(
      {required UserModel user,
      required int amount,
      required int value}) async {
    try {
      await _firestore
          .collection("register")
          .doc("payments")
          .collection("payments")
          .doc(user.id)
          .set({
        "phone": user.phone,
        "amount": amount,
        "value": value,
      });
    } catch (e) {
      print(e);
    }
  }
}
