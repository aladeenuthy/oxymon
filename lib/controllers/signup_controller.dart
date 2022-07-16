import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:oxymon/controllers/auth_controller.dart';

class SignupController extends GetxController {
  final authController = AuthController.to;
  final formKey = GlobalKey<FormState>();
  final Map<String, dynamic> userInfo = {};

  void signUp() async {
    if (!formKey.currentState!.validate()) {
      return;
    }
    Get.focusScope?.unfocus();
    authController.signUp(userInfo);
  }
}
