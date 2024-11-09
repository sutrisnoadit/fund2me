import 'package:flutter/material.dart';
import 'package:fund2me1/app/routes/app_pages.dart';
import 'package:get/get.dart';
import 'package:firebase_auth/firebase_auth.dart';

class SignupController extends GetxController {
  //TODO: Implement SignupController
  final FirebaseAuth _auth = FirebaseAuth.instance;
  RxBool isLoading = false.obs;
  var email = ''.obs;
  var password = ''.obs;
  var confirmPassword = ''.obs;

  final count = 0.obs;
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

  void setEmail(String value) => email.value = value;
  void setPassword(String value) => password.value = value;
  void setConfirmPassword(String value) => confirmPassword.value = value;

  void signup() async {
    if (password != confirmPassword) {
      Get.snackbar(
        "Failed",
        "Inputan Password Harus Sama",
        snackPosition: SnackPosition.TOP,
        backgroundColor: Colors.red,
        colorText: Colors.white,
      );
      return;
    }

    try {
      isLoading.value = true;
      final userCredential =
          await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: email.value,
        password: password.value,
      );
    } catch (error) {
      print('Registration error: $error');
      if (error is FirebaseAuthException) {
        switch (error.code) {
          case 'invalid-email':
            Get.snackbar('Error', 'Invalid email format.',
                backgroundColor: Colors.red);
            break;
          case 'email-already-in-use':
            Get.snackbar('Error', 'The email address is already in use.',
                backgroundColor: Colors.red);
            break;
          case 'weak-password':
            Get.snackbar('Error', 'The password provided is too weak.',
                backgroundColor: Colors.red);
            break;
          default:
            Get.snackbar('Success', 'Registration successful',
                backgroundColor: Colors.green);
        }
      } else {
        Get.snackbar('Success', 'Registration successful',
            backgroundColor: Colors.green);
        Get.offAndToNamed(Routes.SIGNIN);
      }
    } finally {
      isLoading.value = false;
    }
  }

  void increment() => count.value++;
}
