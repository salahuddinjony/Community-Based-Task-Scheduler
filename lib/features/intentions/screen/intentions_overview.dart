import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tread256/core/utils/constants/colors.dart';
import 'package:tread256/features/intentions/widgets/custom_input_decoration.dart';
import 'package:tread256/features/intentions/widgets/header_section.dart';
import 'package:tread256/features/perosonal_tree/widgets/custom_button.dart';

class IntentionsOverview extends StatelessWidget {
  const IntentionsOverview({super.key});

  @override
  Widget build(BuildContext context) {
    // Retrieve the intention data passed from IntentionList
    final Map<String, dynamic>? intention =
        Get.arguments as Map<String, dynamic>?;

    if (intention == null) {
      return Scaffold(
        body: Center(
          child: Text(
            'No intention data available!',
            style: TextStyle(fontSize: 20, color: AppColors.error),
          ),
        ),
      );
    }

    // final displayDatess =
    //     DateTime.tryParse(
    //       intention['date'] ?? '',
    //     )?.let((dt) => DateFormat('yyyy-MM-dd').format(dt)) ??
    //     'No Date';

    return Scaffold(
      body: SingleChildScrollView(
        padding: const EdgeInsets.only(top: 70, left: 20, right: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Header with Image and Checkmark
            HeaderSection(
              headerText: 'Intention Overview',
              immagePath: 'assets/images/component.png',
              boxHeight: 10,
            ),

            SizedBox(height: 20),
            // Intention Overview
            Stack(
              children: [
                Container(
                  width: double.infinity,
                  padding: const EdgeInsets.all(15),
                  decoration: BoxDecoration(
                    color: Color(0xFFF2F4F5),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      CircleAvatar(
                        radius: 30,
                        backgroundColor: AppColors.primary.withOpacity(
                          0.3,
                        ), // Semi-transparent background
                        child: const Icon(
                          size: 40,
                          Icons.phone,
                          color: AppColors.primary,
                        ), // Phone icon inside
                      ),

                      const SizedBox(height: 15),
                      Text(
                        intention['tree'] ?? 'No tree',
                        style: const TextStyle(
                          fontSize: 20,
                          color: Colors.black,
                          fontWeight: FontWeight.w800,
                        ),
                      ),
                      const SizedBox(height: 5),
                      Text(
                        'Completed',
                        style: TextStyle(fontSize: 14, color: Colors.grey),
                      ),
                      const SizedBox(height: 5),
                      Text(
                        'Call with ${intention['personName'] ?? 'Unknown'}',
                        style: TextStyle(fontSize: 16, color: Colors.black),
                      ),
                      SizedBox(height: 5),
                      Text(
                        '${intention['relationship']} •${intention['category']} •${intention['date']?.contains('T') == true ? intention['date']!.split('T')[0] : intention['date'] ?? ''}',
                        style: const TextStyle(
                          fontSize: 14,
                          color: Colors.grey,
                        ),
                      ),
                    ],
                  ),
                ),
                Positioned(
                  right: 10,
                  top: 10,
                  child: Image.asset(
                    'assets/icons/right.png',
                    height: 30,
                    width: 30,
                    errorBuilder:
                        (context, error, stackTrace) => const Icon(Icons.error),
                  ),
                ),
              ],
            ),
            SizedBox(height: 20),
            // Private Notes
            Container(
              padding: EdgeInsets.all(0),

              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Center(
                    child: Text(
                      'Private Notes',
                      style: TextStyle(color: Color(0xff57B396), fontSize: 28),
                    ),
                  ),
                  SizedBox(height: 20),
                  Text(
                    'Reflection or Details',
                    style: TextStyle(fontSize: 20, color: Colors.grey),
                  ),
                  const SizedBox(height: 10),
                  TextField(
                    decoration: customInputDecoration(
                      hintText: 'Add your thought or note...',
                    ),
                    maxLines: 8,
                  ),
                  SizedBox(height: 30),
                  CustomButtom(
                    buttonText: "Save Note",
                    onPressed: () {
                      Get.back();
                    },
                  ),
                ],
              ),
            ),

            SizedBox(height: 30),
          ],
        ),
      ),
    );
  }
}

extension DateTimeExtension on DateTime {
  T? let<T>(T Function(DateTime) transform) => transform(this);
}
