import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tread256/features/perosonal_tree/controller/personal_tree_controller.dart';
import 'package:tread256/features/perosonal_tree/screen/user_profile.dart';
import 'package:tread256/features/perosonal_tree/widgets/custom_toggle_switch.dart';
import 'package:tread256/features/perosonal_tree/widgets/intentional_act_row.dart';
import 'package:tread256/features/perosonal_tree/widgets/section_header.dart';

class IntentionalActsSection extends StatelessWidget {
  final PersonalTreeController controller;

  const IntentionalActsSection({super.key, required this.controller});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            SectionHeader(title: "Intentional Acts"),
            CustomToggleButton(controller: controller),
          ],
        ),
        Obx(
          () =>
              controller.isIntentionalActsOn.value
                  ? controller.persons.isEmpty
                      ? const Center(child: Text("No persons added yet"))
                      : ListView.separated(
                        shrinkWrap: true,
                        physics: const NeverScrollableScrollPhysics(),
                        itemCount: controller.persons.length,
                        itemBuilder: (context, index) {
                          final data = controller.persons[index];
                          return GestureDetector(
                            onTap: () {
                              Get.to(
                                UserProfile(data: data, controller: controller),
                              );
                            },
                            child: IntentionalActRow(index: index),
                          );
                        },

                        separatorBuilder: (_, __) => const Divider(),
                      )
                  : const SizedBox.shrink(),
        ),
      ],
    );
  }
}
