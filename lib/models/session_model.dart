import 'package:cloud_firestore/cloud_firestore.dart';
import 'dart:async';

class SessionModel {
  late num sessionNumber;
  late String bidders;
  late num value;

  SessionModel({required this.bidders,
    required this.sessionNumber,
    required this.value});

}

