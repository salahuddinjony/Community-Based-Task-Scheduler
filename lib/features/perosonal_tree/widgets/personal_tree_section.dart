import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tread256/features/intentions/widgets/form_fields.dart';
import 'package:tread256/features/perosonal_tree/controller/personal_tree_controller.dart';
import 'package:tread256/features/perosonal_tree/widgets/custom_button.dart';
import 'package:tread256/features/perosonal_tree/widgets/personal_tree_data.dart';
import 'package:tread256/features/perosonal_tree/widgets/section_header.dart';

class PersonalTreeSection extends StatelessWidget {
  final PersonalTreeController controller;

  const PersonalTreeSection({super.key, required this.controller});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SectionHeader(title: "Your Personal Tree"),
        Column(
          children: [
            Row(
              children: [
                Expanded(
                  child: GestureDetector(
                    onTap: () async {
                      await showDialog(
                        barrierDismissible: false,
                        context: context,
                        builder:
                            (context) => Dialog(
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(20),
                              ),
                              child: SingleChildScrollView(
                                child: Container(
                                  padding: const EdgeInsets.all(20.0),
                                  child: Column(
                                    mainAxisSize: MainAxisSize.min,
                                    children: [
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          const Text(
                                            "Add New Person",
                                            style: TextStyle(
                                              fontSize: 18,
                                              fontWeight: FontWeight.bold,
                                            ),
                                          ),
                                          IconButton(
                                            icon: const Icon(Icons.close),
                                            onPressed: () => Get.back(),
                                          ),
                                        ],
                                      ),
                                      const SizedBox(height: 20),
                                      Obx(
                                        () => Stack(
                                          alignment: Alignment.center,
                                          children: [
                                            CircleAvatar(
                                              radius: 40,
                                              backgroundImage:
                                                  controller
                                                          .selectedImagePath
                                                          .value
                                                          .isNotEmpty
                                                      ? FileImage(
                                                        File(
                                                          controller
                                                              .selectedImagePath
                                                              .value,
                                                        ),
                                                      )
                                                      : const AssetImage(
                                                        "assets/icons/userprofile.png",
                                                      ),
                                            ),
                                            Positioned(
                                              bottom: 0,
                                              right: 0,
                                              child: GestureDetector(
                                                onTap: controller.pickImage,
                                                child: Container(
                                                  padding: const EdgeInsets.all(
                                                    4,
                                                  ),
                                                  decoration:
                                                      const BoxDecoration(
                                                        color: Colors.white,
                                                        shape: BoxShape.circle,
                                                      ),
                                                  child: const Icon(
                                                    Icons.edit,
                                                    size: 20,
                                                    color: Colors.green,
                                                  ),
                                                ),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                      const SizedBox(height: 20),
                                      buildTextField(
                                        controller: controller.nameController,
                                        hintText: "Name",
                                      ),
                                      const SizedBox(height: 10),
                                      buildTextField(
                                        controller:
                                            controller.relationshipController,
                                        hintText: "Relationship",
                                      ),
                                      const SizedBox(height: 10),
                                      buildTextField(
                                        controller: controller.tagsController,
                                        hintText: "Tags (comma separated)",
                                      ),
                                      const SizedBox(height: 20),
                                      CustomButtom(
                                        buttonText: "Add Person",
                                        onPressed: controller.savePerson,
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                      );
                    },
                    child: PersonalTreeData(
                      imagePath: "assets/icons/add.png",
                      title: "Add New Branches",
                      boldText: "New connection",
                      subTitle: "Add a person to your circle",
                    ),
                  ),
                ),
                Expanded(
                  child: PersonalTreeData(
                    imagePath: "assets/icons/addleap.png",
                    title: "New Branches",
                    boldText: "${controller.persons.length} Leaves",
                    subTitle: "New People joined",
                  ),
                ),
              ],
            ),
            SizedBox(height: 20),
            Row(
              children: [
                Expanded(
                  child: PersonalTreeData(
                    imagePath: "assets/icons/map.png",
                    title: "New Branches",
                    boldText: "${controller.persons.length} Added",
                    subTitle: "New People joined ",
                  ),
                ),
                Expanded(
                  child: PersonalTreeData(
                    imagePath: "assets/icons/rightsign.png",
                    title: "Actions ",
                    boldText: "3 Completed",
                    subTitle: "Great Jov staying Active! ",
                  ),
                ),
              ],
            ),
          ],
        ),
      ],
    );
  }
}
