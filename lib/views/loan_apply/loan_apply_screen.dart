import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:oxymon/controllers/loan_application_controller.dart';

import '../components/input_field.dart';

class LoanApply extends GetView<LoanApplicationController> {
  const LoanApply({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(LoanApplicationController());
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        centerTitle: true,
        title: const Text(
          "Loan Application",
          style: TextStyle(
              fontSize: 19, fontWeight: FontWeight.bold, color: Colors.black),
        ),
        leading: IconButton(
            color: Colors.black,
            onPressed: () {
              Get.back();
            },
            icon: const Icon(Icons.arrow_back_ios)),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(
              horizontal: 25, vertical: 10),
          child: Column(
            children: [
              Obx(() => AbsorbPointer(
                  absorbing: controller.isLoading.value,
                  child: Form(
                      key: controller.formKey,
                      child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            InputField(
                              labelText: "Full name",
                              validator: (value) {
                                if (value!.isEmpty) {
                                  return 'Field empty';
                                }
                                return null;
                              },
                              onChanged: (val) {
                                controller.loanInfo['fullName'] = val;
                              },
                            ),
                            const SizedBox(height: 10),
                            InputField(
                              labelText: "Home address",
                              validator: (value) {
                                if (value!.isEmpty) {
                                  return "Field empty";
                                }
                                return null;
                              },
                              onChanged: (val) {
                                controller.loanInfo['address'] = val;
                              },
                            ),
                            const SizedBox(height: 10),
                            InputField(
                              labelText: "Bank account Number",
                              keyBoardType: TextInputType.number,
                              validator: (value) {
                                if (value!.isEmpty) {
                                  return 'Field empty';
                                }
                                return null;
                              },
                              onChanged: (val) {
                                controller.loanInfo['bankNumber'] =
                                    int.parse(val ?? "0");
                              },
                            ),
                            const SizedBox(height: 10),
                            InputField(
                              labelText: "Bank name",
                              validator: (value) {
                                if (value!.isEmpty) {
                                  return 'Field empty';
                                }
                                return null;
                              },
                              onChanged: (val) {
                                controller.loanInfo['bankName'] = val;
                              },
                            ),
                            const SizedBox(height: 10),
                            InputField(
                              labelText: "Telephone number",
                              keyBoardType: TextInputType.number,
                              validator: (value) {
                                if (value!.isEmpty) {
                                  return 'Field empty';
                                }
                                return null;
                              },
                              onChanged: (val) {
                                controller.loanInfo['phoneNumber'] =
                                    int.parse(val ?? "0");
                              },
                            ),
                            const SizedBox(height: 10),
                            InputField(
                              labelText: "Amount requested",
                              keyBoardType: TextInputType.number,
                              validator: (value) {
                                if (value!.isEmpty) {
                                  return 'Field empty';
                                }
                                return null;
                              },
                              onChanged: (val) {
                                controller.loanInfo['amount'] =
                                    double.parse(val ?? "0");
                              },
                            ),
                            const SizedBox(height: 10),
                            InputField(
                              labelText: "Period(1-12 months)",
                              keyBoardType: TextInputType.number,
                              validator: (value) {
                                if (value!.isEmpty) {
                                  return 'Field empty';
                                } else if (int.parse(value) > 12 || int.parse(value) <= 0) {
                                  return "Out of range";
                                }
                                return null;
                              },
                              onChanged: (val) {
                                controller.loanInfo['period'] =
                                    int.parse(val ?? "0");
                              },
                            ),
                            const SizedBox(height: 10),
                            ElevatedButton(
                              onPressed: controller.apply,
                              child: controller.isLoading.value
                                  ? const CircularProgressIndicator(
                                      color: Colors.white,
                                    )
                                  : const Text(
                                      "Apply",
                                      style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 18,
                                      ),
                                    ),
                            ),
                            const SizedBox(height: 10),
                          ]))))
            ],
          ),
        ),
      ),
    );
  }
}
