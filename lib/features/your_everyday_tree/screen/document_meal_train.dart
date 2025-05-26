import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tread256/core/common/styles/input_decoration.dart';
import 'package:tread256/features/perosonal_tree/widgets/custom_button.dart';

import 'meal_train_tocumentation.dart';

class DocumentMealTrainScreen extends StatelessWidget {
  const DocumentMealTrainScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // final borderRadius = BorderRadius.circular(8);
    return Scaffold(
      appBar: AppBar(
        leading: Padding(
          padding: const EdgeInsets.all(8.0),
          child: CircleAvatar(
            backgroundColor: Color(0xffF2F4F5),
            child: IconButton(
              icon: const Icon(Icons.arrow_back, color: Colors.teal),
              onPressed: () => Get.back(),
            ),
          ),
        ),
        backgroundColor: Colors.white,
        elevation: 0,
        title: const Text(
          'Document Meal Train',
          style: TextStyle(
            color: Colors.teal,
            fontSize: 22,
            fontWeight: FontWeight.w500,
          ),
        ),
        centerTitle: true,
      ),
      backgroundColor: Colors.white,
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 18, vertical: 8),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 8),
              const Text(
                'Share Details And Outcomes Of Your Meal Train Initiative To Celebrate Your Impact.',
                style: TextStyle(color: Colors.black54, fontSize: 15),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 24),
              const Text(
                'What was accomplished?',
                style: TextStyle(
                  fontWeight: FontWeight.w500,
                  fontSize: 16,
                  color: Color(0xff535A6C),
                ),
              ),
              const SizedBox(height: 8),

              TextFormField(
                maxLines: 4,
                decoration: CustomInputDecoration.customInputDecoration(
                  hintText: 'Describe meals delivered, people helped....',
                ),
              ),

              const SizedBox(height: 20),
              const Text(
                'Participants & Tags',
                style: TextStyle(
                  fontWeight: FontWeight.w500,
                  fontSize: 16,
                  color: Color(0xff535A6C),
                ),
              ),
              const SizedBox(height: 8),

              TextFormField(
                maxLines: 1,
                decoration: CustomInputDecoration.customInputDecoration(
                  hintText: 'Describe meals delivered, people helped....',
                  suffixIcon: Icon(
                    Icons.group_outlined,
                    color: Color(0xff535A6C),
                  ),
                ),
              ),
              const SizedBox(height: 8),
              const Text(
                'Duration',
                style: TextStyle(
                  fontWeight: FontWeight.w500,
                  fontSize: 16,
                  color: Color(0xff535A6C),
                ),
              ),
              const SizedBox(height: 8),
              TextFormField(
                decoration: CustomInputDecoration.customInputDecoration(
                  hintText: 'Share insights,or feedback...........',
                  suffixIcon: Icon(Icons.access_time, color: Color(0xff535A6C)),
                ),
              ),
              const SizedBox(height: 20),

              const Text(
                'What Did You Learn?',
                style: TextStyle(fontWeight: FontWeight.w500, fontSize: 16),
              ),
              const SizedBox(height: 8),

              TextFormField(
                maxLines: 6,
                decoration: CustomInputDecoration.customInputDecoration(
                  hintText: 'Share insights,or feedback...........',
                ),
              ),

              SizedBox(height: 50),
              CustomButtom(
                buttonText: 'Save document',
                onPressed: () {
                  // print("hello flutter");
                  Get.to(() => MealTrainDocumentationScreen());
                },
                vertical: 20,
              ),
              const SizedBox(height: 16),
            ],
          ),
        ),
      ),
    );
  }
}
