import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tread256/core/utils/constants/colors.dart';
import 'package:tread256/core/utils/constants/image_path.dart';
import 'package:tread256/features/auth/controler/login_screen_controller.dart';
import 'package:tread256/features/bottom_navbar/screen/bottom_navbar_screen.dart';
import 'package:tread256/features/perosonal_tree/widgets/custom_button.dart';
import 'package:tread256/routes/app_routes.dart';

class LoginScreen extends StatelessWidget {
  /// LoginScreen is a StatelessWidget that represents the login screen of the application.
  LoginScreen({super.key});

  final LoginController controller = Get.put(LoginController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: SingleChildScrollView(
            padding: const EdgeInsets.symmetric(horizontal: 24.0),
            child: Form(
              key: controller.formKey,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  CircleAvatar(
                    radius: 48,
                    backgroundColor: const Color(0xFF5DBB9B),
                    backgroundImage: AssetImage(ImagePath.component),
                  ),
                  const SizedBox(height: 23),
                  // Welcome Text
                  const Text(
                    'WELCOME TO SEEDS ',
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: Color(0xFF4CB28B),
                    ),
                  ),
                  const SizedBox(height: 24),

                  // Email Field
                  TextFormField(
                    controller: controller.emailController,
                    decoration: InputDecoration(
                      labelText: 'Email Address',
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(8),
                      ),
                    ),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter your email';
                      }
                      if (!RegExp(r'^[^@]+@[^@]+\.[^@]+').hasMatch(value)) {
                        return 'Enter a valid email';
                      }
                      return null;
                    },
                  ),
                  const SizedBox(height: 15),
                  // Password Fieldddd
                  Obx(
                    () => TextFormField(
                      controller: controller.passwordController,
                      obscureText: controller.obscurePassword.value,
                      decoration: InputDecoration(
                        labelText: 'Password',
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(8),
                        ),
                        suffixIcon: IconButton(
                          icon: Icon(
                            controller.obscurePassword.value
                                ? Icons.visibility_off
                                : Icons.visibility,
                          ),
                          onPressed: controller.togglePassword,
                        ),
                      ),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please enter your password';
                        }
                        return null;
                      },
                    ),
                  ),
                  const SizedBox(height: 15),
                  // Forgot Password
                  Align(
                    alignment: Alignment.centerLeft,
                    child: TextButton(
                      onPressed: () {
                        Get.toNamed(AppRoute.getForgotPasswordScreen());
                      },
                      child: const Text(
                        'Forgot password?',
                        style: TextStyle(color: Color(0xFF4CB28B)),
                      ),
                    ),
                  ),
                  const SizedBox(height: 24),

                  // Login Button
                  // GestureDetector(
                  //   onTap: () async {
                  //     await Get.to(BottomNavbarScreen());
                  //   },
                  //   child: Container(
                  //     width: double.infinity,
                  //     padding: const EdgeInsets.symmetric(
                  //       vertical: 25,
                  //       horizontal: 143,
                  //     ),
                  //     decoration: BoxDecoration(
                  //       color: const Color(0xFF4CB28B),
                  //       borderRadius: BorderRadius.circular(12),
                  //     ),
                  //     alignment: Alignment.center,
                  //     child: Text(
                  //       'Login',
                  //       style: getTextStyle(
                  //         fontSize: 16,
                  //         color: Colors.white,
                  //         fontWeight: FontWeight.bold,
                  //       ),
                  //       textAlign: TextAlign.center,
                  //       overflow: TextOverflow.visible,
                  //     ),
                  //   ),
                  // ),
                  CustomButtom(
                    buttonText: "Login",
                    onPressed: () async {
                      await Get.to(BottomNavbarScreen());
                    },
                  ),
                  const SizedBox(height: 16),
                  // Create Account
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text("Don't have an account? "),
                      GestureDetector(
                        onTap: () {
                          // Get.to(ChatPage());
                          Get.toNamed(AppRoute.getCreateAccountScreen());
                        },
                        child: const Text(
                          'Create now',
                          style: TextStyle(
                            color: Color(0xFF4CB28B),
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 24),
                  // Divider
                  Row(
                    children: [
                      const Expanded(child: Divider()),
                      const Padding(
                        padding: EdgeInsets.symmetric(horizontal: 8.0),
                        child: Text('Or continue with'),
                      ),
                      const Expanded(child: Divider()),
                    ],
                  ),
                  const SizedBox(height: 16),
                  // Social Buttons
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      _socialButton(
                        Colors.white,

                        () {
                          // Google login logic
                          // Get.toNamed(AppRoute.getYourCommunityTreeScreen());
                        },
                        textIcon: "G",
                        isGoogle: true,
                      ),
                      const SizedBox(width: 16),
                      _socialButton(Colors.white, () {
                        // Google login logic
                      }, icon: Icons.apple),
                      const SizedBox(width: 16),
                      _socialButton(
                        Colors.white,
                        () {
                          // Google login logic
                        },
                        textIcon: "f",
                        isGoogle: true,
                      ),
                    ],
                  ),
                  const SizedBox(height: 24),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _socialButton(
    Color textColor,
    VoidCallback onTap, {
    bool isGoogle = false,
    IconData? icon,
    String? textIcon,
  }) {
    return InkWell(
      onTap: onTap,
      child: CircleAvatar(
        backgroundColor: AppColors.primary,
        radius: 22,
        child:
            isGoogle
                ? Text(
                  textIcon ?? "",
                  style: TextStyle(color: textColor, fontSize: 20.0),
                )
                : Icon(icon, color: textColor, size: 20.0),
      ),
    );
  }
}
