import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tread256/core/utils/constants/image_path.dart';
import 'package:tread256/features/bottom_navbar/controller/bottom_navbar_controller.dart';
import 'package:tread256/features/bottom_navbar/screen/navbar.dart';
import 'package:tread256/features/inspiration/screen/nspiration.dart'
    show Nspiration;
import 'package:tread256/features/intentions/screen/intentions_screen.dart';

import 'package:tread256/features/main_screen/screen/main_home.dart';
import 'package:tread256/features/profile/profile_screen.dart';

class BottomNavbarScreen extends StatelessWidget {
  BottomNavbarScreen({super.key});

  final BottomNavbarController controller = Get.put(BottomNavbarController());

  final List<Widget> screens = [
    MainHome(),
    IntentionsScreen(),
    Nspiration(),
    ProfileScreen(),
  ];

  final List<String> icons = [
    ImagePath.home,
    ImagePath.intentions,
    ImagePath.inspiration,
    ImagePath.profile,
  ];

  final List<String> labels = ['Home', 'Intentions', 'Inspirations', 'Profile'];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Expanded(child: Obx(() => screens[controller.selectedIndex.value])),
        ],
      ),
      bottomNavigationBar: Navbar(),
    );
  }
}
