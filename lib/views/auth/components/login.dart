import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:oxymon/controllers/login_controller.dart';

import '../../components/input_field.dart';

class Login extends GetView<LoginController> {
  const Login({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(LoginController());
    return SingleChildScrollView(
      child: Padding(
        padding: EdgeInsets.only(
            bottom: MediaQuery.of(context).viewInsets.bottom,
            left: 20,
            right: 20),
        child: Obx(() {
          return AbsorbPointer(
            absorbing: controller.authController.isLoading.value,
            child:
                Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
              InputField(
                labelText: "Email address",
                controller: controller.emailController,
                validator: (value) {
                  if (value!.isEmpty || !value.contains('@')) {
                    return 'Invalid email!';
                  }
                  return null;
                },
                keyBoardType: TextInputType.emailAddress,
              ),
              const SizedBox(height: 10),
              InputField(
                labelText: "Password",
                controller: controller.passwordController,
              ),
              const SizedBox(height: 20),
              ElevatedButton(
                onPressed: controller.login,
                child: controller.authController.isLoading.value
                    ? const CircularProgressIndicator(
                        color: Colors.white,
                      )
                    : const Text(
                        "Login",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 18,
                        ),
                      ),
              )
            ]),
          );
        }),
      ),
    );
  }
}
