import 'package:get/get.dart';
import 'package:flutter/material.dart';

class LoginController extends GetxController {
  final formKey = GlobalKey<FormState>();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  var obscurePassword = true.obs;

  void togglePassword() {
    obscurePassword.value = !obscurePassword.value;
  }

  void login() {
    if (formKey.currentState!.validate()) {
      Get.snackbar('Login', 'Logging in...');
      // Add your login logic here
    }
  }

  @override
  void onClose() {
    emailController.dispose();
    passwordController.dispose();
    super.onClose();
  }
}
