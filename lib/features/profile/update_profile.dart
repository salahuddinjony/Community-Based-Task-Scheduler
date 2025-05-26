import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'controller/profile_controller.dart';

class UpdateProfile extends StatelessWidget {
  const UpdateProfile({super.key});

  @override
  Widget build(BuildContext context) {
    final ProfileController _profileController = Get.put(ProfileController());

    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Center(
          child: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const SizedBox(height: 24),
                  Stack(
                    clipBehavior: Clip.none,
                    children: [
                      Obx(() {
                        final imageFile = _profileController.imageFile.value;
                        return CircleAvatar(
                          radius: 38,
                          backgroundImage:
                              imageFile != null
                                  ? FileImage(imageFile)
                                  : const NetworkImage(
                                        'https://randomuser.me/api/portraits/men/32.jpg',
                                      )
                                      as ImageProvider,
                        );
                      }),

                      // Positioned(
                      //   bottom: 10, // Adjust as needed
                      //   right: 10, // Adjust as needed
                      //   child: Container(
                      //     decoration: BoxDecoration(
                      //       shape: BoxShape.circle,
                      //       border: Border.all(color: Colors.white, width: 2),
                      //     ),
                      //     child: Padding(
                      //       padding: const EdgeInsets.all(4.0),
                      //       child: InkWell(
                      //         onTap: () {
                      //           _profileController.showImageSourceDialog(
                      //             context,
                      //           );
                      //         },
                      //         child: Image.asset(
                      //           'assets/icons/edit.png',
                      //           width: 30, // Adjust the size of the icon
                      //           fit: BoxFit.cover,
                      //         ),
                      //       ),
                      //     ),
                      //   ),
                      // ),
                      Positioned(
                        right: -5,
                        bottom: 0,
                        child: GestureDetector(
                          onTap: () {
                            _profileController.showImageSourceDialog(context);
                          },
                          child: CircleAvatar(
                            radius: 13,
                            backgroundImage: AssetImage(
                              'assets/icons/edit.png', // Replace with actual image URL
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 20),
                  const Text(
                    'Sarah Anderson',
                    style: TextStyle(
                      fontSize: 26,
                      fontWeight: FontWeight.w600,
                      color: Colors.black87,
                    ),
                  ),
                  const SizedBox(height: 6),
                  const Text(
                    'Growing Intentional Communities',
                    style: TextStyle(fontSize: 16, color: Colors.green),
                  ),
                  const SizedBox(height: 32),
                  Align(
                    alignment: Alignment.centerLeft,
                    child: Text('Name', style: _labelStyle),
                  ),
                  const SizedBox(height: 6),
                  TextFormField(
                    initialValue: 'Sarah Anderson',
                    decoration: _inputDecoration(hintText: 'Enter your name'),
                  ),
                  const SizedBox(height: 18),
                  Align(
                    alignment: Alignment.centerLeft,
                    child: Text('Email Address', style: _labelStyle),
                  ),
                  const SizedBox(height: 6),
                  TextFormField(
                    initialValue: 'name@email.com',
                    decoration: _inputDecoration(hintText: 'name@email.com'),
                  ),
                  const SizedBox(height: 18),
                  Align(
                    alignment: Alignment.centerLeft,
                    child: Text('Address', style: _labelStyle),
                  ),
                  const SizedBox(height: 6),
                  TextFormField(
                    initialValue: 'metrotech center, brooklyn, ny 11201, usa',
                    decoration: _inputDecoration(
                      hintText: 'Enter your address',
                    ),
                  ),
                  const SizedBox(height: 18),
                  Align(
                    alignment: Alignment.centerLeft,
                    child: Text('Your Password', style: _labelStyle),
                  ),
                  const SizedBox(height: 6),
                  Obx(
                    () => TextFormField(
                      obscureText: _profileController.obscurePassword.value,

                      decoration: InputDecoration(
                        hintText: 'Enter your password',
                        suffixIcon: IconButton(
                          icon: Icon(
                            _profileController.obscurePassword.value
                                ? Icons.visibility_off
                                : Icons.visibility,
                          ),
                          onPressed: () {
                            _profileController.togglePasswordVisibility();
                          },
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(height: 36),
                  SizedBox(
                    width: double.infinity,
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        padding: const EdgeInsets.symmetric(vertical: 16),
                        backgroundColor: Colors.green,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12),
                        ),
                      ),
                      child: const Text(
                        'Submit',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 16,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      onPressed: () {},
                    ),
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
}

const _labelStyle = TextStyle(
  fontSize: 15,
  fontWeight: FontWeight.w500,
  color: Colors.black87,
);

InputDecoration _inputDecoration({Widget? suffixIcon, String? hintText}) {
  return InputDecoration(
    filled: true,
    fillColor: Colors.white,
    contentPadding: const EdgeInsets.symmetric(vertical: 14, horizontal: 16),
    border: OutlineInputBorder(
      borderRadius: BorderRadius.circular(10),
      borderSide: const BorderSide(color: Colors.grey),
    ),
    enabledBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(10),
      borderSide: const BorderSide(color: Colors.grey),
    ),
    focusedBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(10),
      borderSide: const BorderSide(color: Colors.grey, width: 2),
    ),
    disabledBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(10),
      borderSide: const BorderSide(
        color: Colors.grey,
        style: BorderStyle.solid,
        width: 1,
      ),
    ),
    hintText: hintText,
    hintStyle: const TextStyle(color: Colors.red),
    suffixIcon: suffixIcon,
  );
}
