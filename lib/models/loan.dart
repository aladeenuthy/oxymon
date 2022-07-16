import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:intl/intl.dart';

class Loan {
  final String fullName;
  final String bankName;
  final String address;
  final double amount;
  final int period;
  final int bankNumber;
  final int phoneNumber;
  final Timestamp timestamp;
  String get date {
    return DateFormat.yMd().format(timestamp.toDate());
  }

  Loan(
      {required this.fullName,
      required this.bankName,
      required this.address,
      required this.amount,
      required this.period,
      required this.bankNumber,
      required this.phoneNumber,
      required this.timestamp});
  factory Loan.fromJson(Map json) {
    return Loan(
        fullName: json['fullName'],
        bankName: json['bankName'],
        address: json['address'],
        amount: json['amount'],
        period: json['period'],
        bankNumber: json['bankNumber'],
        phoneNumber: json['phoneNumber'],
        timestamp: json['timestamp']);
  }
  Map<String, dynamic> toJson() {
    return {
      'fullName': fullName,
      'address': address,
      'bankNumber': bankNumber,
      'bankName': bankName,
      'phoneNumber': phoneNumber,
      'amount': amount,
      'period': period,
      'timestamp': timestamp,
      'userId': FirebaseAuth.instance.currentUser?.uid
    };
  }
}
