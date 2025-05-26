import 'package:get/get.dart';
import 'package:flutter/material.dart';

class ForgotPasswordController extends GetxController {
  final formKey = GlobalKey<FormState>();
  final emailController = TextEditingController();

  void sendCode() {
    if (formKey.currentState!.validate()) {
      Get.snackbar('Code Sent', 'A reset code has been sent to your email.');
      // Add your send code logic here
    }
  }

  @override
  void onClose() {
    emailController.dispose();
    super.onClose();
  }
}
