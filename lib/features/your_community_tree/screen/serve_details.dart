import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tread256/core/common/styles/global_text_style.dart';
import 'package:tread256/core/common/styles/input_decoration.dart';
import 'package:tread256/core/utils/constants/colors.dart' show AppColors;
import 'package:tread256/features/perosonal_tree/widgets/custom_button.dart';

import 'opportunities_details.dart';

class ServeDetailsScreen extends StatelessWidget {
  const ServeDetailsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Color mainColor = Color(0xFF6EC6B2); // Soft green
    Color borderColor = Color(0xFFB2DFDB); // Lighter green
    int selectedShift = 0;
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: Padding(
          padding: const EdgeInsets.all(8.0),
          child: CircleAvatar(
            backgroundColor: Color(0xffF2F4F5),

            child: IconButton(
              icon: const Icon(Icons.arrow_back, color: Colors.teal),
              onPressed: () {
                Get.back();
              },
            ),
          ),
        ),
        title: Text(
          'Opportunities Details',
          style: TextStyle(
            color: AppColors.primary,
            fontWeight: FontWeight.w400,
            fontSize: 24,
          ),
        ),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.symmetric(horizontal: 24),
        child: Column(
          children: [
            SizedBox(height: 24),
            Image.asset("assets/icons/food_drive.png", width: 52, height: 52),
            SizedBox(height: 12),
            Text(
              "Food Drive",
              style: TextStyle(
                color: AppColors.primary,
                fontSize: 20,
                fontWeight: FontWeight.w400,
              ),
            ),
            SizedBox(height: 5),
            Text(
              "Grace Community Church",
              style: getTextStyle(
                color: Color(0xff535A6C),
                fontSize: 16,
                fontWeight: FontWeight.w400,
              ),
            ),
            SizedBox(height: 53),
            Text(
              "Sign Up",
              style: TextStyle(
                color: AppColors.primary,
                fontSize: 28,
                fontWeight: FontWeight.w400,
              ),
            ),
            SizedBox(height: 16),

            TextFormField(
              decoration: CustomInputDecoration.customInputDecoration(
                isSuffixIcon: true,
                hintStyle: getTextStyle(
                  color: Color(0x9E535A6C),
                  fontSize: 12,
                  fontWeight: FontWeight.w400,
                ),
                hintText: 'Enter name',
                suffixIcon: Icon(Icons.person_outline),
              ),
            ),

            SizedBox(height: 12),

            TextFormField(
              decoration: CustomInputDecoration.customInputDecoration(
                isSuffixIcon: true,
                hintStyle: getTextStyle(
                  color: Color(0x9E535A6C),
                  fontSize: 12,
                  fontWeight: FontWeight.w400,
                ),
                hintText: 'Enter email',
                suffixIcon: Icon(Icons.email),
              ),
            ),

            SizedBox(height: 12),
            TextFormField(
              decoration: CustomInputDecoration.customInputDecoration(
                isSuffixIcon: true,
                hintStyle: getTextStyle(
                  color: Color(0x9E535A6C),
                  fontSize: 12,
                  fontWeight: FontWeight.w400,
                ),
                hintText: 'Enter number',
                suffixIcon: Icon(Icons.phone),
              ),
            ),
            SizedBox(height: 18),
            Row(
              children: [
                _buildShiftCard(
                  title: "Morning",
                  time: "Sat, 10: am-2pm",
                  selected: selectedShift == 0,
                  onTap: () {},
                  mainColor: mainColor,
                  borderColor: Colors.red,
                ),
                SizedBox(width: 12),
                _buildShiftCard(
                  title: "Afternoon",
                  time: "Sat, 10: am-2pm",
                  selected: selectedShift == 1,
                  onTap: () {},
                  mainColor: mainColor,
                  borderColor: borderColor,
                ),
              ],
            ),
            SizedBox(height: 28),
            SizedBox(
              width: double.infinity,
              child: CustomButtom(
                horizontal: 70,
                isPadding: true,
                buttonText: 'Sign Up For Serve',
                onPressed: () {
                  // print("hello flutter");

                  Get.to(() => OpportunitiesDetailsScreen());
                },
                vertical: 20,
              ),
            ),
            SizedBox(height: 24),
          ],
        ),
      ),
    );
  }

  Widget _buildShiftCard({
    required String title,
    required String time,
    required bool selected,
    required VoidCallback onTap,
    required Color mainColor,
    required Color borderColor,
  }) {
    return Expanded(
      child: GestureDetector(
        onTap: onTap,
        child: Container(
          padding: EdgeInsets.symmetric(vertical: 16),
          decoration: BoxDecoration(
            color: selected ? Colors.white : Color(0xFFF5F5F5),
            border: Border.all(
              color:
                  selected
                      ? Color(0xff57B396).withValues(alpha: 0.5)
                      : Colors.transparent,
              // color: Colors.red,
              width: 2,
            ),
            borderRadius: BorderRadius.circular(8),
          ),
          child: Column(
            children: [
              Icon(Icons.ac_unit, color: mainColor, size: 28),
              SizedBox(height: 6),
              Text(
                title,
                style: TextStyle(
                  color: mainColor,
                  fontSize: 16,
                  fontWeight: FontWeight.w500,
                ),
              ),
              Text(
                time,
                style: TextStyle(
                  color: Colors.black54,
                  fontSize: 13,
                  fontWeight: FontWeight.w400,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
