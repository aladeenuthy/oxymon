import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:oxymon/controllers/signup_controller.dart';

import '../../components/input_field.dart';

class Signup extends GetView<SignupController> {
  const Signup({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(SignupController());
    return SingleChildScrollView(
      child: Padding(
        padding: EdgeInsets.only(
            bottom: MediaQuery.of(context).viewInsets.bottom,
            left: 20,
            right: 20),
        child: Obx(() {
          return AbsorbPointer(
            absorbing: controller.authController.isLoading.value,
            child: Form(
              key: controller.formKey,
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    InputField(
                      labelText: "First Name",
                      validator: (value) {
                        if (value!.isEmpty || value.length < 5) {
                          return 'First Name is too short!';
                        }
                        return null;
                      },
                      onChanged: (val) {
                        controller.userInfo['firstName'] = val;
                      },
                    ),
                    const SizedBox(height: 10),
                    InputField(
                      labelText: "Last Name",
                      validator: (value) {
                        if (value!.isEmpty || value.length < 5) {
                          return 'Last Name is too short!';
                        }
                        return null;
                      },
                      onChanged: (val) {
                        controller.userInfo['lastName'] = val;
                      },
                    ),
                    const SizedBox(height: 10),
                    InputField(
                      labelText: "Email address",
                      keyBoardType: TextInputType.emailAddress,
                      validator: (value) {
                        if (value!.isEmpty || !value.contains('@')) {
                          return 'Invalid email!';
                        }
                        return null;
                      },
                      onChanged: (val) {
                        controller.userInfo['email'] = val;
                      },
                    ),
                    const SizedBox(height: 10),
                    InputField(
                      labelText: "Phone number",
                      keyBoardType: TextInputType.number,
                      validator: (value) {
                        if (value!.isEmpty || value.length < 5) {
                          return 'too short!';
                        }
                        return null;
                      },
                      onChanged: (val) {
                        controller.userInfo['phoneNumber'] =
                            int.parse(val ?? "0");
                      },
                    ),
                    const SizedBox(height: 10),
                    InputField(
                      labelText: "Password",
                      validator: (value) {
                        if (value!.isEmpty || value.length < 5) {
                          return 'Password is too short!';
                        }
                        return null;
                      },
                      onChanged: (val) {
                        controller.userInfo['password'] = val?.trim();
                      },
                    ),
                    const SizedBox(height: 10),
                    InputField(
                      labelText: "Confirm Password",
                      validator: (value) {
                        if (controller.userInfo['password'] != value) {
                          return 'Passwords do not match';
                        }
                        return null;
                      },
                    ),
                    const SizedBox(height: 10),
                    ElevatedButton(
                      onPressed: controller.signUp,
                      child: controller.authController.isLoading.value
                          ? const CircularProgressIndicator(
                              color: Colors.white,
                            )
                          : const Text(
                              "Sign up",
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 18,
                              ),
                            ),
                    ),
                    const SizedBox(height: 10),
                  ]),
            ),
          );
        }),
      ),
    );
  }
}
