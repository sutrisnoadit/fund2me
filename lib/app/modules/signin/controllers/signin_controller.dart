import 'package:flutter/material.dart';
import 'package:fund2me1/app/routes/app_pages.dart';
import 'package:get/get.dart';
import 'package:firebase_auth/firebase_auth.dart';

class SigninController extends GetxController {
 
  var email = ''.obs;
  var password = ''.obs;
  final count = 0.obs;

  void setEmail(String value) => email.value = value;
  void setPassword(String value) => password.value = value;

  void signin() async {
    try {
      final userCredential =
          await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: email.value,
        password: password.value,
      );

      Get.offAndToNamed(Routes.DASHBOARD);
    } catch (error) {
      print('Login error: $error');
      if (error is FirebaseAuthException) {
        Get.snackbar(
          'Error',
          'Email Atau Password Salah',
          backgroundColor: Colors.red,
          colorText: Colors.white,
          snackPosition: SnackPosition.TOP,
        );
      } else {
        Get.snackbar(
          'Success',
          'Login successful',
          backgroundColor: Colors.green,
          colorText: Colors.white,
          snackPosition: SnackPosition.TOP,
        );
        Get.offAndToNamed(Routes.DASHBOARD);
      }
    } finally {}
  }

  @override
  void onInit() {
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
  }

  void increment() => count.value++;
}
