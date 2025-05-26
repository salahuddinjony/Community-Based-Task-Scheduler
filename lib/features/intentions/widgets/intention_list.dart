import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:tread256/core/utils/constants/colors.dart';
import 'package:tread256/features/intentions/controller/add_new_intentions_controller.dart';
import 'package:tread256/features/intentions/screen/intentions_overview.dart';
import 'package:tread256/features/intentions/widgets/header_section.dart';

class IntentionList extends StatelessWidget {
  final AddIntentionsController controller;

  const IntentionList({super.key, required this.controller});

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      final sortedIntentions =
          controller.intentions.toList()..sort((a, b) {
            final dateA = DateTime.tryParse(a['date'] ?? '') ?? DateTime(2000);
            final dateB = DateTime.tryParse(b['date'] ?? '') ?? DateTime(2000);
            return dateB.compareTo(dateA);
          });

      return sortedIntentions.isEmpty
          ? Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                // Icon(Icons.warning, color: AppColors.error, size: 48),
                SizedBox(height: 16),
                Text(
                  "You don't have any intentions set right now, add a new intention to get started on watering your trees and watching your relationships grow!",
                  style: TextStyle(fontSize: 15, color: AppColors.info),
                  textAlign: TextAlign.justify,
                ),
              ],
            ),
          )
          : ListView.builder(
            padding: EdgeInsets.all(0),
            shrinkWrap: true,
            physics: NeverScrollableScrollPhysics(),
            itemCount: sortedIntentions.length,
            itemBuilder: (context, index) {
              final intention = sortedIntentions[index];
              final displayDate =
                  DateTime.tryParse(
                    intention['date'] ?? '',
                  )?.let((dt) => DateFormat('yyyy-MM-dd').format(dt)) ??
                  'No Date';
              return GestureDetector(
                onTap: () {
                  // print(intention);
                  Get.to(() => IntentionsOverview(), arguments: intention);
                },
                child: Stack(
                  children: [
                    Container(
                      margin: const EdgeInsets.only(bottom: 15),
                      padding: const EdgeInsets.all(20),
                      decoration: BoxDecoration(
                        color: AppColors.cardColor,
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Column(
                        children: [
                          HeaderSection(
                            headerText: '',
                            immagePath: 'assets/icons/profile_icon.png',
                            boxHeight: 0,
                          ),
                          // const SizedBox(height: 10),
                          Text(
                            "${intention['tree'] ?? 'Unknown'}",
                            style: const TextStyle(
                              color: AppColors.textPrimary,
                              fontSize: 12,
                            ),
                          ),
                          SizedBox(height: 5),
                          Text(
                            "Call with ${intention['personName'] ?? 'Unknown'}",
                            style: TextStyle(
                              color: AppColors.textPrimary,
                              fontSize: 14,
                            ),
                          ),
                          SizedBox(height: 5),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                intention['title'] ?? 'No Title',
                                style: const TextStyle(
                                  color: AppColors.textPrimary,
                                  fontSize: 14,
                                ),
                              ),
                              const SizedBox(width: 2),
                              Container(
                                height: 5,
                                width: 5,
                                decoration: BoxDecoration(
                                  color: Colors.grey,
                                  borderRadius: BorderRadius.circular(50),
                                ),
                              ),
                              const SizedBox(width: 2),
                              Text(
                                intention['category'] ?? 'No Category',
                                style: const TextStyle(
                                  color: AppColors.textPrimary,
                                  fontSize: 14,
                                ),
                              ),
                              const SizedBox(width: 2),
                              Container(
                                height: 5,
                                width: 5,
                                decoration: BoxDecoration(
                                  color: Colors.grey,
                                  borderRadius: BorderRadius.circular(50),
                                ),
                              ),
                              const SizedBox(width: 2),
                              Text(
                                displayDate,
                                style: const TextStyle(
                                  color: AppColors.textPrimary,
                                  fontSize: 14,
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                    Positioned(
                      right: 10,
                      top: 10,
                      child: Image.asset(
                        'assets/icons/right.png',
                        height: 50,
                        width: 50,
                        errorBuilder:
                            (context, error, stackTrace) =>
                                const Icon(Icons.error),
                      ),
                    ),
                  ],
                ),
              );
            },
          );
    });
  }
}
