import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:oxymon/constants.dart';
import 'package:oxymon/controllers/app_controller.dart';
import 'package:oxymon/models/loan.dart';
import 'package:oxymon/views/dashboard/components/app_drawer.dart';
import 'package:oxymon/views/loan_apply/loan_apply_screen.dart';

import 'components/loan_card.dart';

class DashBoard extends GetView<AppController> {
  const DashBoard({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(AppController());
    return Scaffold(
        drawer: const AppDrawer(),
        appBar: AppBar(
          elevation: 0,
          leading: Builder(
            builder: (context) {
              return IconButton(
                onPressed: () {
                  Scaffold.of(context).openDrawer();
                },
                icon: Image.asset("assets/images/menu.png"),
              );
            }
          ),
          actions: [
            IconButton(
              onPressed: () {
                Get.to(() => const LoanApply());
              },
              icon: const Icon(Icons.add, color: primaryColor),
            )
          ],
        ),
        body: Padding(
          padding: const EdgeInsets.only(top: 8),
          child: StreamBuilder<QuerySnapshot<Loan>>(
            stream: controller.getUserLoans(),
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return const Center(
                  child: CircularProgressIndicator(
                    color: primaryColor,
                  ),
                );
              } else if (snapshot.hasData) {
                if (snapshot.data!.size > 0) {
                  return SingleChildScrollView(
                    physics: const ScrollPhysics(),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 15),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              const Text(
                                "Loans",
                                style: TextStyle(
                                    fontSize: 29,
                                    fontWeight: FontWeight.bold),
                              ),
                              CircleAvatar(
                                radius: 15,
                                backgroundColor: primaryColor,
                                child: Text(
                                  snapshot.data!.size.toString(),
                                  style: const TextStyle(color: Colors.white),
                                ),
                              )
                            ],
                          ),
                        ),
                        const SizedBox(
                          height: 30,
                        ),
                        ListView.builder(
                            physics: const NeverScrollableScrollPhysics(),
                            itemCount: snapshot.data!.size,
                            shrinkWrap: true,
                            itemBuilder: (_, index) => LoanCard(
                                  loan: snapshot.data!.docs[index].data(),
                                ))
                      ],
                    ),
                  );
                }
                return Center(
                  child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Image.asset('assets/images/personal2.png'),
                    const SizedBox(height: 10),
                    const Text("No loans yet")
                  ]),
                );
              }
              return Text(snapshot.error.toString());
            },
          ),
        ));
  }
}
