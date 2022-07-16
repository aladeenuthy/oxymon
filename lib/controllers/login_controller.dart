import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:oxymon/controllers/auth_controller.dart';

class LoginController extends GetxController {
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final authController = AuthController.to;

  void login() {
    if (emailController.text.isEmpty || passwordController.text.isEmpty) {
      return;
    }
    Get.focusScope?.unfocus();
    authController.login(emailController.text, passwordController.text);
  }

  @override
  void onClose() {
    emailController.dispose();
    passwordController.dispose();
    super.onClose();
  }
}
