import 'package:cloud_firestore/cloud_firestore.dart';

class BidModel {
  late String? id;
  late String? amount;

  BidModel({required this.id, required this.amount});

  BidModel.fromJson(Map<String, dynamic> json) {
    this.id = json['id'];
    this.amount = json['amount'];
  }
  BidModel.fromDocumentSnapshot({required DocumentSnapshot documentSnapshot}) {
    id = documentSnapshot["id"];
    amount = documentSnapshot["amount"];
  }

  Map<String, dynamic> toJson() => {'id': id, 'amount': amount};
}
