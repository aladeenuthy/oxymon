import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:oxymon/views/auth/auth_screen.dart';
import 'package:oxymon/views/dashboard/dashboard.dart';


class AuthController extends GetxController {
  var isLoading = false.obs;
  final auth = FirebaseAuth.instance;
  static AuthController get to => Get.find();

  Future<bool> signUp(Map<String, dynamic> userInfo) async {
    isLoading.value = true;
    try {
      final user = await auth.createUserWithEmailAndPassword(
          email: userInfo['email'], password: userInfo['password']);
      userInfo.remove('password');
      await FirebaseFirestore.instance
          .collection('users')
          .doc(user.user!.uid)
          .set(userInfo);
      isLoading.value = false;
      Get.off(() => const DashBoard());
      return true;
    } on FirebaseAuthException catch (err) {
      Get.snackbar('Authentication', err.toString());
    } catch (_) {
      Get.snackbar('Authentication', "something went wrong");
    }
    isLoading.value = false;
    return false;
  }

  Future<bool> login(String emailAddress, String password) async {
    isLoading.value = true;
    try {
      await auth.signInWithEmailAndPassword(
          email: emailAddress, password: password);
      isLoading.value = false;
      Get.off(() => const DashBoard());
      return true;
    } on FirebaseAuthException catch (err) {
      Get.snackbar('Authentication', err.toString());
    } catch (_) {
      Get.snackbar('Authentication', "something went wrong");
    }
    isLoading.value = false;
    return false;
  }

  Future<bool> logout() async {
    try {
      await auth.signOut();
      Get.offAll(()=>const AuthScreen());
      return true;
    } on FirebaseAuthException catch (err) {
      Get.snackbar('Authentication', err.toString());
    } catch (_) {
      Get.snackbar('Authentication', "something went wrong");
    }
    return false;
  }
}
