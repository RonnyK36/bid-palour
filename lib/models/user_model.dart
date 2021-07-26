import 'package:cloud_firestore/cloud_firestore.dart';

class UserModel {
  late String? id;
  late String? email;
  late String? phone;

  UserModel({this.id, this.email, this.phone});

  UserModel.fromDocumentSnapshot({required DocumentSnapshot documentSnapshot}) {
    id = documentSnapshot.id;
    email = documentSnapshot["email"];
    phone = documentSnapshot["phone"];
  }
}
