import 'package:flutter/material.dart';
import 'package:oxymon/constants.dart';
import 'components/login.dart';
import 'components/signup.dart';

class AuthScreen extends StatelessWidget {
  const AuthScreen({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        body: Column(
          children: [
            Expanded(
              flex: 3,
              child: Container(
                decoration: BoxDecoration(
                  boxShadow: [
                    BoxShadow(
                      offset: const Offset(0, 4.0),
                      blurRadius: 30.0,
                      color: Colors.black.withOpacity(0.06),
                    ),
                  ],
                  color: Colors.white,
                  borderRadius:
                      const BorderRadius.vertical(bottom: Radius.circular(25)),
                ),
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Column(
                  children:  [
                    Expanded(
                      child: Image.asset('assets/images/oxymon.png'),
                    ),
                    const TabBar(
                      indicatorColor: primaryColor,
                      labelColor: Colors.black,
                      tabs: [
                        Tab(text: "login"),
                        Tab(text: 'signup'),
                      ],
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            const Expanded(
              flex: 5,
              child: TabBarView(
                children: [Login(), Signup()],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
