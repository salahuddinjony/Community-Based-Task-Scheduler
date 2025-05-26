import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tread256/features/calender/screen/calendar_strip.dart';
import 'package:tread256/features/perosonal_tree/controller/personal_tree_controller.dart';
import 'package:tread256/features/perosonal_tree/widgets/intentional_acts_section.dart';
import 'package:tread256/features/perosonal_tree/widgets/personal_tree_section.dart';
import 'package:tread256/features/perosonal_tree/widgets/progress_overview_section.dart';

class PersonalTreeMin extends StatelessWidget {
  PersonalTreeMin({super.key});

  final PersonalTreeController controller = Get.put(PersonalTreeController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          width: double.infinity,
          color: const Color.fromARGB(255, 244, 243, 243),
          padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              CalendarStrip(),
              const Image(image: AssetImage("assets/images/peopleScreen.png")),
              const SizedBox(height: 30),
              PersonalTreeSection(controller: controller),
              const SizedBox(height: 30),
              IntentionalActsSection(controller: controller),
              const SizedBox(height: 20),
              // SuggestionsSeedsSection(),
              ProgressOverviewSection(),
              const SizedBox(height: 20),
            ],
          ),
        ),
      ),
    );
  }
}
