import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import 'package:oxymon/models/loan.dart';

class AppController extends GetxController {
  static AppController get to => Get.find();

  
  final _loanRef = FirebaseFirestore.instance.collection('loans').withConverter(
      fromFirestore: (snapshot, _) =>
          Loan.fromJson(snapshot.data() as Map<String, dynamic>),
      toFirestore: (loan, __) => loan.toJson());

  Stream<QuerySnapshot<Loan>> getUserLoans() {
    return _loanRef
        .where('userId', isEqualTo: FirebaseAuth.instance.currentUser!.uid)
        .orderBy('timestamp', descending: true)
        .snapshots();
  }

  Future<bool> addLoan(Loan loan) async {
    try {
      await _loanRef.add(loan);
      return true;
    } catch (_) {
      Get.snackbar("Oxymon", 'something went wrong');
      return false;
    }
  }
}
