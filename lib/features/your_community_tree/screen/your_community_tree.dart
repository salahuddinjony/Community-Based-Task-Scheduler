import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tread256/core/common/styles/global_text_style.dart';
import 'package:tread256/core/utils/constants/colors.dart';
import 'package:tread256/features/calender/screen/calendar_strip.dart';
import 'package:tread256/routes/app_routes.dart';

import 'all_serving_opportunities.dart';

class YourCommunityTreeScreen extends StatelessWidget {
  const YourCommunityTreeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final borderColor = Colors.teal.shade200;
    final iconColor = Colors.teal.shade200;
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 40),
              CalendarStrip(),
              SizedBox(height: 40),
              Center(
                child: Container(
                  width: 220,
                  height: 250,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage('assets/images/tree1.png'),
                      fit: BoxFit.contain,
                    ),
                  ),
                ),
              ),
              SizedBox(height: 12),
              Center(
                child: Text(
                  "Your Community Tree",
                  style: getTextStyle(
                    color: AppColors.primary,
                    fontWeight: FontWeight.w400,
                    fontSize: 20,
                  ),
                ),
              ),
              SizedBox(height: 16),
              // Organization Cards
              _organizationCard(
                iconPath: 'assets/icons/house.png',
                name: "Grace Community Church",
                desc:
                    "Where food drives and youth mentorship sow seeds to serve all children.",
              ),
              _organizationCard(
                iconPath: 'assets/icons/hand_icon.png',
                name: "Hope For All",
                desc:
                    "Support Homeless And Meal Programs. Volunteer Or Donate (Saturdays).",
              ),
              _organizationCard(
                iconPath: 'assets/icons/cape_icon.png',
                name: "Bright Future Fund",
                desc:
                    "Scholarships And Tutoring For Local Students Get Involved Or Give.",
              ),
              SizedBox(height: 20),
              // Recommend Opportunities title
              Center(
                child: Text(
                  'Recommend Opportunities',
                  style: TextStyle(
                    color: Colors.teal.shade400,
                    fontSize: 18,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
              SizedBox(height: 20),
              // Card for Food Drive
              Container(
                padding: EdgeInsets.symmetric(vertical: 18, horizontal: 15),
                decoration: BoxDecoration(
                  color: Colors.white,
                  border: Border.all(color: borderColor),
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Column(
                  children: [
                    CircleAvatar(
                      radius: 22,
                      backgroundColor: Colors.teal.shade100,
                      child: Icon(Icons.food_bank, color: iconColor, size: 28),
                    ),
                    SizedBox(height: 10),
                    Text(
                      'Food Drive',
                      style: TextStyle(
                        color: Colors.teal.shade800,
                        fontWeight: FontWeight.bold,
                        fontSize: 16,
                      ),
                    ),
                    SizedBox(height: 5),
                    Text(
                      'Grace Community Church',
                      style: TextStyle(color: Colors.grey[700], fontSize: 14),
                    ),
                    SizedBox(height: 3),
                    Text(
                      'Saturday, 10:00 AM',
                      style: TextStyle(color: Colors.grey[600], fontSize: 13),
                    ),
                    SizedBox(height: 15),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        OutlinedButton(
                          onPressed: () {},
                          style: OutlinedButton.styleFrom(
                            side: BorderSide(color: borderColor),
                            padding: EdgeInsets.symmetric(
                              horizontal: 20,
                              vertical: 10,
                            ),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(5),
                            ),
                          ),
                          child: Text(
                            'See All',
                            style: getTextStyle(color: AppColors.primary),
                          ),
                        ),
                        ElevatedButton(
                          onPressed: () {},
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.teal.shade400,
                            padding: EdgeInsets.symmetric(
                              horizontal: 30,
                              vertical: 10,
                            ),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(5),
                            ),
                          ),
                          child: Text('Sign Up'),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              SizedBox(height: 30),
            ],
          ),
        ),
      ),
    );
  }

  Widget _organizationCard({
    required String iconPath,
    required String name,
    required String desc,
  }) {
    return Container(
      padding: const EdgeInsets.all(18.0),
      margin: const EdgeInsets.only(bottom: 16.0),
      decoration: BoxDecoration(
        color: const Color(0xFFF7FAFA),
        border: Border.all(color: Colors.teal.shade50),
        borderRadius: BorderRadius.circular(12),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CircleAvatar(
            backgroundColor: Colors.teal[50],
            child: Padding(
              padding: const EdgeInsets.all(4.0),
              child: Image.asset(iconPath, width: 38, height: 38),
            ),
          ),
          SizedBox(height: 14.0),
          Text(
            name,
            style: getTextStyle(fontWeight: FontWeight.bold, fontSize: 16),
          ),
          SizedBox(height: 8.0),
          Text(desc, style: TextStyle(color: Colors.grey[600], fontSize: 13)),
          SizedBox(height: 14.0),
          Row(
            children: [
              OutlinedButton(
                onPressed: () {
                  Get.to(() => AllServingOpportunities());
                },
                style: OutlinedButton.styleFrom(
                  padding: EdgeInsets.symmetric(horizontal: 24, vertical: 10),
                  foregroundColor: Colors.teal.shade400,
                  side: BorderSide(color: Colors.teal.shade400),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(5),
                  ),
                ),
                child: Text("Serve", style: TextStyle(fontSize: 14)),
              ),
              SizedBox(width: 8),

              ElevatedButton(
                onPressed: () {
                  Get.toNamed(AppRoute.getDonationScreen());
                },
                style: ElevatedButton.styleFrom(
                  elevation: 0,
                  padding: EdgeInsets.symmetric(horizontal: 24, vertical: 10),
                  backgroundColor: AppColors.primary,
                  shape: RoundedRectangleBorder(
                    side: BorderSide(
                      color:
                          AppColors
                              .primary, // Replace with your desired border color
                      // Adjust the border width as needed
                    ),
                    borderRadius: BorderRadius.circular(5),
                  ),
                ),
                child: Text(
                  "Donate",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 14,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
