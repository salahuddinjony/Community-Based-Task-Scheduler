import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tread256/core/common/styles/global_text_style.dart';
import 'package:tread256/core/utils/constants/colors.dart';
import 'package:tread256/routes/app_routes.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            // Profile Header
            SizedBox(height: 40),
            Container(
              padding: EdgeInsets.symmetric(vertical: 32, horizontal: 16),
              color: Colors.white,
              child: Column(
                children: [
                  Stack(
                    clipBehavior: Clip.none,
                    children: [
                      CircleAvatar(
                        radius: 38,
                        backgroundImage: AssetImage(
                          'assets/icons/profile_icon.png', // Replace with actual image URL
                        ),
                      ),

                      Positioned(
                        right: -5,
                        bottom: 0,
                        child: GestureDetector(
                          onTap: () {
                            Get.toNamed(AppRoute.getUpdateProfileScreen());
                          },
                          child: CircleAvatar(
                            radius: 13,
                            backgroundImage: AssetImage(
                              'assets/icons/edit.png', // Replace with actual image URL
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 15),
                  // Name
                  Text(
                    'Sarah Anderson',
                    style: getTextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w400,
                      color: Color(0xff2C3E50),
                    ),
                  ),
                  const SizedBox(height: 15),
                  // Tagline as clickable link
                  Text(
                    'Growing Intentional Communities',
                    style: getTextStyle(
                      fontSize: 12,
                      color: AppColors.primary,
                      fontWeight: FontWeight.w500,
                    ),
                  ),

                  const SizedBox(height: 15),
                  // Location with icon
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(Icons.location_on, size: 16, color: Colors.teal),
                      SizedBox(width: 4),
                      Text(
                        'San Francisco, CA',
                        style: getTextStyle(
                          fontSize: 12,
                          color: const Color(0xff94A3B8),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            const SizedBox(height: 20),
            // Stats Section
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Row(
                children: [
                  Expanded(
                    child: _buildStatCard(
                      icon: "assets/icons/frame_image2.png",
                      title: 'Actions',
                      count: '25 Completed',
                      subtitle: 'Great Job Staying Active!',
                    ),
                  ),
                  const SizedBox(width: 12),
                  Expanded(
                    child: _buildStatCard(
                      icon: "assets/icons/frame_image1.png",
                      title: 'Initiatives',
                      count: '5 Active',
                      subtitle: 'Staying Initiatives Active!',
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 20),
            // Options Section
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Container(
                decoration: BoxDecoration(
                  color: Color(0xffF8FAF9),
                  borderRadius: BorderRadius.circular(5),
                ),
                child: Column(
                  children: [
                    _buildOptionTile(
                      onTap: () {
                        Get.toNamed(AppRoute.getPrivacySecurityScreen());
                      },
                      'Privacy & Security',
                      showBlueDivider: true,
                    ),
                    _buildOptionTile(
                      'About App',
                      showGreyDivider: true,
                      onTap: () {
                        Get.toNamed(AppRoute.getSeedsAppScreen());
                      },
                    ),

                    _buildOptionTile(
                      'Help',
                      onTap: () {
                        Get.toNamed(
                          AppRoute.getFrequentlyAskedQuestionsScreen(),
                        );
                      },
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 20),
            // Log Out Button
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Card(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(16),
                ),
                elevation: 0,
                child: _buildOptionTile(
                  onTap: () {
                    Get.toNamed(AppRoute.getLoginScreen());
                  },
                  'Log Ou0t',
                ),
              ),
            ),
            const SizedBox(height: 24),
          ],
        ),
      ),

      // Bottom Navigation Bar
    );
  }

  static Widget _buildStatCard({
    required String icon,
    required String title,
    required String count,
    required String subtitle,
  }) {
    return Card(
      elevation: 0,
      color: Color(0xffF8FAF9),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      child: Padding(
        padding: EdgeInsets.symmetric(vertical: 18, horizontal: 8),
        child: Column(
          children: [
            // Icon(icon, color: Colors.teal, size: 28),
            // Image.asset(icon, width: 28, height: 28),
            SizedBox(width: 48, height: 48, child: Image.asset(icon)),
            const SizedBox(height: 8),
            Text(
              title,
              style: getTextStyle(
                fontSize: 12,
                fontWeight: FontWeight.w400,
                color: Color(0xff535A6C),
              ),
            ),
            const SizedBox(height: 8),
            Text(
              count,
              style: getTextStyle(
                fontSize: 14,
                color: Color(0xff535A6C),
                fontWeight: FontWeight.w600,
              ),
            ),
            const SizedBox(height: 7),
            Text(
              subtitle,
              textAlign: TextAlign.center,
              style: const TextStyle(
                fontSize: 12,
                color: Color(0xff535A6C),
                fontWeight: FontWeight.w400,
              ),
            ),
          ],
        ),
      ),
    );
  }

  static Widget _buildOptionTile(
    String title, {
    bool showBlueDivider = false,
    bool showGreyDivider = false,
    VoidCallback? onTap,
  }) {
    return Container(
      decoration: BoxDecoration(
        color: Color(0xffF8FAF9),
        borderRadius: BorderRadius.circular(5),
      ),
      child: Column(
        children: [
          ListTile(
            title: Text(
              title,
              style: getTextStyle(
                color: Color(0xFF535A6C),
                fontSize: 16,
                fontWeight: FontWeight.w400,
              ),
            ),
            trailing: const Icon(
              Icons.chevron_right,
              color: Color(0xFFB0B8C1),
              size: 30,
            ),
            onTap: onTap,
            contentPadding: const EdgeInsets.symmetric(horizontal: 16),
            tileColor: Colors.transparent,
            dense: true,
          ),
          if (showBlueDivider)
            const Divider(
              thickness: 0.5,
              height: 10.0,
              indent: 0,
              endIndent: 0,
            ),
          if (showGreyDivider)
            const Divider(
              color: Color(0xFFE0E0E0),
              thickness: 1,
              height: 0,
              indent: 0,
              endIndent: 0,
            ),
        ],
      ),
    );
  }
}
