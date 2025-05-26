import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tread256/core/utils/constants/colors.dart';
import 'package:tread256/features/intentions/controller/add_new_intentions_controller.dart';
import 'package:tread256/features/intentions/screen/add_new_intentions.dart';
import 'package:tread256/features/intentions/widgets/header_section.dart';
import 'package:tread256/features/intentions/widgets/intention_list.dart';
import 'package:tread256/features/perosonal_tree/widgets/custom_button.dart';

class IntentionsScreen extends StatelessWidget {
  IntentionsScreen({super.key});
  final AddIntentionsController controller = Get.put(AddIntentionsController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          padding: const EdgeInsets.only(
            top: 80,
            left: 20,
            right: 20,
            bottom: 10,
          ),
          color: Colors.white,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              HeaderSection(
                headerText: 'My Intentions',
                immagePath: 'assets/images/component.png',
                boxHeight: 10,
              ),
              SizedBox(height: 30),
              Text(
                "Intentions List",
                style: TextStyle(fontSize: 22, color: AppColors.primary),
              ),
              const SizedBox(height: 10),
              IntentionList(controller: controller),
              const SizedBox(height: 10),
              CustomButtom(
                buttonText: "New Intention",
                onPressed: () {
                  Get.to(() => AddNewIntentions());
                },
              ),
              SizedBox(height: 20),

              SizedBox(height: 20),
            ],
          ),
        ),
      ),
    );
  }
}
