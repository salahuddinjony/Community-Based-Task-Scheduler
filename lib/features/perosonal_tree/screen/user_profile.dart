import 'dart:io';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tread256/features/intentions/widgets/custom_input_decoration.dart';
import 'package:tread256/features/intentions/widgets/form_fields.dart';
import 'package:tread256/features/perosonal_tree/controller/personal_tree_controller.dart';
import 'package:tread256/features/perosonal_tree/widgets/custom_button.dart';
import 'package:tread256/features/perosonal_tree/widgets/custom_toggle_switch.dart';
import 'package:tread256/features/your_everyday_tree/screen/my_initiatives.dart';

class UserProfile extends StatelessWidget {
  final Map<String, dynamic>? data;
  final PersonalTreeController controller;

  const UserProfile({super.key, required this.data, required this.controller});

  @override
  Widget build(BuildContext context) {
    // print("parsinge data: $data");
    return Scaffold(
      body: SingleChildScrollView(
        child: Center(
          child: Container(
            width: double.infinity,
            color: Colors.white,
            padding: const EdgeInsets.symmetric(vertical: 60, horizontal: 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Container(
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    border: Border.all(color: AppColors.primary, width: 3.0),
                  ),
                  child: CircleAvatar(
                    radius: 60,
                    backgroundImage:
                        data?['imagePath'] != null &&
                                (data?['imagePath'] as String).isNotEmpty
                            ? FileImage(File(data?['imagePath']))
                            : const AssetImage("assets/icons/userprofile.png"),
                    backgroundColor: Colors.grey.shade200,
                  ),
                ),
                const SizedBox(height: 10),
                Text(
                  data?['name'] ?? '',
                  style: TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                    fontSize: 25,
                  ),
                ),
                const SizedBox(height: 10),
                Text(
                  "3 Actions Completed",
                  style: TextStyle(color: AppColors.primary, fontSize: 15),
                ),
                const SizedBox(height: 10),
                CustomToggleButton(
                  controller: controller,
                  leftText: "Completed",
                  rightText: "Open Acts",
                  backgroundColor: Colors.grey[200]!,
                  activeColor: AppColors.primary,
                  inactiveColor: AppColors.primary,
                  textActiveColor: Colors.white,
                  textInactiveColor: Colors.black,
                  widthFactor: 0.8,
                  height: 50.0,
                  borderRadius: 10.0,
                  padding: 3.0,
                ),

                Obx(
                  () =>
                      controller.isIntentionalActsOn.value
                          ? ListView.builder(
                            itemCount: 5,
                            shrinkWrap: true,
                            physics: NeverScrollableScrollPhysics(),

                            itemBuilder: (BuildContext context, int index) {
                              return Card(
                                color: Colors.grey[200],
                                margin: EdgeInsets.only(bottom: 15),
                                elevation: 0,
                                child: ListTile(
                                  leading: Image.asset(
                                    "assets/icons/right.png",
                                  ),
                                  title: Text("Schedule coffee meetup"),
                                  subtitle: Text("2024-02-20 at 14:00"),
                                ),
                              );
                            },
                          )
                          : ListView.builder(
                            itemCount: 5,
                            shrinkWrap: true,
                            physics: NeverScrollableScrollPhysics(),

                            itemBuilder: (BuildContext context, int index) {
                              return Card(
                                color: Colors.grey[200],
                                margin: EdgeInsets.only(bottom: 15),
                                elevation: 0,
                                child: ListTile(
                                  leading: Image.asset(
                                    "assets/icons/right2.png",
                                    height: 40,
                                  ),
                                  title: Text("Schedule coffee meetup"),
                                  subtitle: Text("2024-02-20 at 14:00"),
                                ),
                              );
                            },
                          ),
                ),
                CustomButtom(
                  buttonText: "Add New Action",
                  onPressed: () {
                    Get.bottomSheet(
                      isDismissible: false,
                      Container(
                        padding: EdgeInsets.symmetric(
                          horizontal: 40,
                          vertical: 20,
                        ),
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: SingleChildScrollView(
                          child: Column(
                            // mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text(
                                    "Add New Actions",
                                    style: TextStyle(
                                      fontSize: 25,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  Spacer(),
                                  IconButton(
                                    icon: const Icon(
                                      Icons.close,
                                      size: 35,
                                      weight: 800,
                                    ),
                                    onPressed: () => Get.back(),
                                  ),
                                ],
                              ),
                              buildTextField(hintText: "Actions Title"),
                              SizedBox(height: 10),
                              TextField(
                                decoration: customInputDecoration(
                                  hintText: 'Descriptions',
                                ),
                                maxLines: 6,
                              ),
                              SizedBox(height: 10),
                              buildTextField(hintText: "Date"),
                              SizedBox(height: 10),
                              buildTextField(hintText: "Time"),
                              SizedBox(height: 10),
                              CustomButtom(
                                buttonText: "Apply Now",
                                onPressed: () {
                                  Get.back();
                                },
                              ),
                            ],
                          ),
                        ),
                      ),
                      isScrollControlled: true,
                    );
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
