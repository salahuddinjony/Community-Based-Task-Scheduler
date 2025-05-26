import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:tread256/features/main_screen/controller/tree_slider_controller.dart';
import 'package:tread256/features/main_screen/data/slide_data.dart';
import 'package:tread256/features/main_screen/widgets/actions_card_section.dart';
import 'package:tread256/features/main_screen/widgets/header_section.dart';
import 'package:tread256/features/main_screen/widgets/milestones_badges_section.dart';
import 'package:tread256/features/main_screen/widgets/tree_slider.dart';

class YourPersonalTree extends StatelessWidget {
  YourPersonalTree({super.key});

  final TextEditingController chatController = TextEditingController();
  final List<TreeSlide> slides = getSlides();
  final TreeSliderController controller = Get.put(
    TreeSliderController(getSlides()),
  );

  @override
  Widget build(BuildContext context) {
    // add a button to go to your everyday tree

    return SingleChildScrollView(
      child: Container(
        color: const Color.fromARGB(255, 244, 243, 243),
        padding: const EdgeInsets.symmetric(vertical: 20),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              HeaderSection(slides: slides),
              // const SizedBox(height: 80),

              // ChatInputSection(chatController: chatController),
              const SizedBox(height: 20),
              const ActionsCardSection(),
              const SizedBox(height: 20),
              const MilestonesBadgesSection(),
            ],
          ),
        ),
      ),
    );
  }
}
