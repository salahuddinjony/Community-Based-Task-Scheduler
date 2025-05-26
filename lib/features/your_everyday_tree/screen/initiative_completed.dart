import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tread256/core/utils/constants/image_path.dart';

import 'document_meal_train.dart';

class InitiativeCompletedScreen extends StatelessWidget {
  const InitiativeCompletedScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              // Replace with your asset path or use an Icon if you don't have an image
              CircleAvatar(
                radius: 48,
                backgroundColor: const Color(0xFF5DBB9B),
                backgroundImage: AssetImage(ImagePath.component),
              ),
              SizedBox(height: 32),
              Text(
                'Thank You',
                style: TextStyle(
                  color: Color(0xFF5DB39A),
                  fontSize: 24,
                  fontWeight: FontWeight.w500,
                ),
              ),
              SizedBox(height: 16),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 32.0),
                child: Text(
                  'Your initiative has been marked as complete.\nYour impact helps our community thrive.',
                  textAlign: TextAlign.center,
                  style: TextStyle(color: Colors.black54, fontSize: 15),
                ),
              ),
              SizedBox(height: 32),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Color(0xFF5DB39A),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                  padding: EdgeInsets.symmetric(horizontal: 32, vertical: 12),
                ),
                onPressed: () {
                  // TODO: Implement navigation to initiatives
                  Get.to(() => DocumentMealTrainScreen());
                },
                child: Text(
                  'Return to Initiatives',
                  style: TextStyle(color: Colors.white, fontSize: 16),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
