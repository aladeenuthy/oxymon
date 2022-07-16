import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:oxymon/constants.dart';
import 'package:oxymon/controllers/auth_controller.dart';

class AppDrawer extends StatelessWidget {
  const AppDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        children: [
          SizedBox(
            height: Get.height * 0.15,
          ),
          ListTile(
            leading: const Icon(
              Icons.logout_outlined,
              color: primaryColor,
            ),
            title: const Text("Logout"),
            onTap: () {
              AuthController.to.logout();
            },
          ),
          ListTile(
            leading: CircleAvatar(
              backgroundColor: primaryColor,
              child: Image.asset("assets/images/card.png"),
            ),
            title: const Text("Cards"),
            onTap: () {},
          ),
          ListTile(
            leading: const Icon(
              Icons.person,
              color: primaryColor,
            ),
            title: const Text("Profile"),
            onTap: () {},
          ),
        ],
      ),
    );
  }
}
