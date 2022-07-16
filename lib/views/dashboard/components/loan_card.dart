import 'package:flutter/material.dart';

import '../../../constants.dart';
import '../../../models/loan.dart';

class LoanCard extends StatelessWidget {
  final Loan loan;
  const LoanCard({
    Key? key,
    required this.loan
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 25, right: 15, left: 15),
      padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 25),
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(20),
          boxShadow: [
            BoxShadow(
                color: Colors.grey.withOpacity(0.1),
                spreadRadius: 5,
                blurRadius: 6,
                offset: const Offset(0, 3))
          ]),
      child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children:  [
                const Text("Cash loan",
                    style: TextStyle(
                        fontSize: 15,
                        color: Colors.grey,
                        fontWeight: FontWeight.bold)),
                const SizedBox(
                  height: 7,
                ),
                Text(loan.bankName,
                    style: const TextStyle(fontSize: 15, fontWeight: FontWeight.bold))
              ],
            ),
            CircleAvatar(
              backgroundColor: primaryColor,
              child: Image.asset('assets/images/bank.png'),
            )
          ],
        ),
        const SizedBox(
          height: 5,
        ),
        const Divider(
          color: Colors.grey,
        ),
        const SizedBox(
          height: 5,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text("Amount",
                    style: TextStyle(
                        fontSize: 16,
                        color: Colors.grey,
                        fontWeight: FontWeight.bold)),
                const SizedBox(
                  height: 7,
                ),
                Text("#${loan.amount}",
                    style:
                        const TextStyle(fontSize: 17, fontWeight: FontWeight.bold)),
                const SizedBox(
                  height: 10,
                ),
                const Text("Status",
                    style: TextStyle(
                        fontSize: 16,
                        color: Colors.grey,
                        fontWeight: FontWeight.bold)),
                const SizedBox(
                  height: 7,
                ),
                const Text("Pending",
                    style:
                        TextStyle(fontSize: 17, fontWeight: FontWeight.bold)),
              ],
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children:[
                const Text("Date",
                    style: TextStyle(
                        fontSize: 16,
                        color: Colors.grey,
                        fontWeight: FontWeight.bold)),
                const SizedBox(
                  height: 7,
                ),
                Text(loan.date,
                    style:
                    const TextStyle(fontSize: 17, fontWeight: FontWeight.bold)),
                const SizedBox(
                  height: 10,
                ),
                const Text("Period",
                    style: TextStyle(
                        fontSize: 16,
                        color: Colors.grey,
                        fontWeight: FontWeight.bold)),
                const SizedBox(
                  height: 7,
                ),
                Text(loan.period.toString() + (loan.period == 1 ? " month" : " months"),
                    style:
                        const TextStyle(fontSize: 17, fontWeight: FontWeight.bold)),
              ],
            ),
          ],
        ),
      ]),
    );
  }
}
