import 'package:get/get.dart';
import 'package:flutter/material.dart';

class ForgotPasswordOtpController extends GetxController {
  final otp1 = TextEditingController();
  final otp2 = TextEditingController();
  final otp3 = TextEditingController();
  final otp4 = TextEditingController();

  final formKey = GlobalKey<FormState>();
  var isResending = false.obs;

  void continueAction() {
    if (formKey.currentState!.validate()) {
      final code = otp1.text + otp2.text + otp3.text + otp4.text;
      Get.snackbar('OTP', 'Entered code: $code');
      // Add your OTP verification logic here
    }
  }

  void resendCode() async {
    isResending.value = true;
    await Future.delayed(const Duration(seconds: 2));
    isResending.value = false;
    Get.snackbar('Resent', 'A new code has been sent to your email.');
    // Add your resend code logic here
  }

  @override
  void onClose() {
    otp1.dispose();
    otp2.dispose();
    otp3.dispose();
    otp4.dispose();
    super.onClose();
  }
}
