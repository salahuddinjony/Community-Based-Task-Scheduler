import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tread256/core/common/styles/global_text_style.dart';
import 'package:tread256/features/calender/screen/calendar_strip.dart';
import 'package:tread256/features/perosonal_tree/widgets/graphs_charts.dart';
import 'package:tread256/features/your_everyday_tree/screen/my_initiatives.dart';
import 'ideas_library.dart';

class YourEverydayTreeScreen extends StatelessWidget {
  const YourEverydayTreeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF6FAFF),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20.0),
          child: Column(
            children: [
              // Tree Image
              SizedBox(height: 40),
              CalendarStrip(),
              SizedBox(height: 40),
              Center(
                child: Container(
                  alignment: Alignment.center,
                  width: 250,
                  height: 290,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage('assets/images/tree1.png'),
                      fit: BoxFit.fill,
                    ),
                  ),
                ),
              ),
              SizedBox(height: 12),
              Center(
                child: Text(
                  "Your Everyday Tree",
                  style: getTextStyle(
                    color: Color(0xff57B396),
                    fontWeight: FontWeight.w400,
                    fontSize: 28,
                  ),
                ),
              ),
              SizedBox(height: 16),
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    GestureDetector(
                      onTap: () {
                        // Get.to(() => InitiativeCompletedScreen());
                        Get.to(() => MyInitiativesScreen());
                      },
                      child: Container(
                        width: 150,
                        height: 150,
                        decoration: BoxDecoration(
                          color: Color(0xffF2F4F5),
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            CircleAvatar(
                              radius: 26.5, // 59x59 px
                              backgroundColor: Colors.transparent,
                              backgroundImage: AssetImage(
                                'assets/icons/hand_icon.png',
                              ),
                            ),
                            SizedBox(height: 12),
                            Text(
                              "My Initiatives",
                              style: getTextStyle(
                                color: Color(0xff535A6C),
                                fontWeight: FontWeight.w400,
                                fontSize: 15,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),

                    SizedBox(width: 5),
                    GestureDetector(
                      onTap: () {
                        // Get.to(() => MyInitiativesScreen());
                        Get.to(() => IdeasLibraryScreen());
                      },
                      child: Container(
                        width: 150,
                        height: 150,
                        decoration: BoxDecoration(
                          color: Color(0xffF2F4F5),
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            CircleAvatar(
                              radius: 26.5, // 59x59 px
                              backgroundColor: Colors.transparent,
                              backgroundImage: AssetImage(
                                'assets/icons/light_icon.png',
                              ),
                            ),
                            SizedBox(height: 12),
                            Text(
                              "Ideas library",
                              style: getTextStyle(
                                color: Color(0xff535A6C),
                                fontWeight: FontWeight.w400,
                                fontSize: 15,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 40),
              Text(
                "Progress Overview",
                style: getTextStyle(
                  color: Color(0xff57B396),
                  fontWeight: FontWeight.w400,
                  fontSize: 18,
                ),
                textAlign: TextAlign.center,
              ),
              SizedBox(height: 24),

              Text(
                "Track your impact and see how your\n\n initiatives contribute to the community.",
                style: getTextStyle(
                  color: Color(0xff535A6C),
                  fontWeight: FontWeight.w400,
                  fontSize: 16,
                ),
                textAlign: TextAlign.center,
              ),
              SizedBox(height: 22),

              Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  "Your Activity",
                  style: getTextStyle(
                    color: Color(0xff57B396),
                    fontWeight: FontWeight.w400,
                    fontSize: 16,
                  ),
                  textAlign: TextAlign.center,
                ),
              ),
              SizedBox(height: 24),
              EveryDayTreeActivityCard(
                imagePath: "assets/icons/frame_image2.png",
                states: "Completed",
                countvalue: "8 Initiatives",
                description:
                    "You’ve completed 8 community initiatives this year.",
              ),
              SizedBox(height: 24),
              EveryDayTreeActivityCard(
                imagePath: "assets/icons/group_icon.png",
                states: "People Impacted",
                countvalue: "2 +",
                description: "Your efforts have reached over 120 people.",
              ),
              SizedBox(height: 24),
              EveryDayTreeActivityCard(
                states: "Hours Volunteered",
                countvalue: "34 Hours",
                description: "Total time you’ve dedicated to community work.",
              ),
              SizedBox(height: 24),

              GraphsCharts(),
            ],
          ),
        ),
      ),
    );
  }
}

class EveryDayTreeActivityCard extends StatelessWidget {
  final String? imagePath;
  final String? states;
  final String? countvalue;
  final String? description;
  const EveryDayTreeActivityCard({
    super.key,
    this.imagePath,
    this.states,
    this.countvalue,
    this.description,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 350,
      height: 160,
      decoration: BoxDecoration(
        color: Color(0xffF2F4F5),
        borderRadius: BorderRadius.circular(10),
      ),
      child: Padding(
        padding: const EdgeInsets.only(left: 10.0, top: 15, bottom: 15),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CircleAvatar(
              radius: 25.5, // 59x59 px
              backgroundColor: Colors.transparent,
              backgroundImage: AssetImage(
                imagePath ?? 'assets/icons/hand_icon.png',
              ),
            ),
            SizedBox(height: 12),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  states ?? "Completed",
                  style: getTextStyle(
                    color: Color(0xff535A6C),
                    fontWeight: FontWeight.w400,
                    fontSize: 12,
                  ),
                ),
                SizedBox(height: 18),
                Text(
                  countvalue ?? "8 Initiatives",
                  style: getTextStyle(
                    color: Color(0xff111111),
                    fontWeight: FontWeight.w600,
                    fontSize: 14,
                  ),
                ),
                SizedBox(height: 17),
                Text(
                  description ??
                      "You’ve completed 8 community initiatives this year.",
                  style: getTextStyle(
                    color: Color(0xff535A6C),
                    fontWeight: FontWeight.w400,
                    fontSize: 10,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
