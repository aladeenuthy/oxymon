import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import "package:get/get.dart";
import 'package:oxymon/constants.dart';
import 'package:oxymon/views/auth/auth_screen.dart';
import 'package:oxymon/views/dashboard/dashboard.dart';

import 'controllers/auth_controller.dart';


void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  Get.put(AuthController());
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Oxymon',
      theme: ThemeData(
          colorScheme: ThemeData().colorScheme.copyWith(primary: Colors.grey),
          appBarTheme: const AppBarTheme(
            backgroundColor: Colors.white
          ),
          scaffoldBackgroundColor: Colors.white,
          inputDecorationTheme: const InputDecorationTheme(
              hintStyle: TextStyle(
                  color: Colors.grey,
                  fontWeight: FontWeight.bold,
                  fontSize: 19)),
          elevatedButtonTheme: ElevatedButtonThemeData(
              style: ElevatedButton.styleFrom(
                  primary: primaryColor,
                  minimumSize: const Size(double.infinity, 53),
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(25))))),
      home: FirebaseAuth.instance.currentUser != null ? const DashBoard() : const AuthScreen(),
    );
  }
}
