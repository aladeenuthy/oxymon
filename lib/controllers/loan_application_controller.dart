import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:oxymon/constants.dart';
import 'package:oxymon/controllers/app_controller.dart';
import 'package:oxymon/models/loan.dart';

class LoanApplicationController extends GetxController {
  var isLoading = false.obs;
  final formKey = GlobalKey<FormState>();
  final loanInfo = {};
  static LoanApplicationController get to => Get.find();



  
  void apply() async {
    if (!formKey.currentState!.validate()) {
      return;
    }
    isLoading.value = true;
    Get.focusScope?.unfocus();
    loanInfo['timestamp'] = Timestamp.now();
    final loan = Loan.fromJson(loanInfo);
    final result = await AppController.to.addLoan(loan);
    isLoading.value = false;
    if (result) {
      Get.defaultDialog(
          title: '',
          content: Column(
            children: const [
              CircleAvatar(
                radius: 40,
                backgroundColor: primaryColor,
                child: Icon(
                  Icons.done,
                  size: 40,
                  color: Colors.white,
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Text("Application Succesfull",
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
              SizedBox(
                height: 10,
              )
            ],
          ));
    }
  }
}
