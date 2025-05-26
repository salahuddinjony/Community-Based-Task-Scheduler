import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:tread256/features/calender/controller/calendar_controller.dart';

class CalendarStrip extends GetView<CalendarController> {
  CalendarStrip({super.key});
  @override
  final CalendarController controller = Get.put(CalendarController());

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 10),
      child: Column(
        children: [
          // Month and Year with Navigation Arrows
          Obx(
            () => Container(
              padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
              color: Colors.transparent,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  IconButton(
                    icon: const Icon(
                      Icons.arrow_left,
                      color: Colors.black54,
                      size: 40,
                    ),
                    onPressed: controller.previousMonth,
                  ),
                  Text(
                    controller.getMonthYear(),
                    style: const TextStyle(
                      color: Colors.red,
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  IconButton(
                    icon: const Icon(
                      Icons.arrow_right,
                      color: Colors.black54,
                      size: 40,
                    ),
                    onPressed: controller.nextMonth,
                  ),
                ],
              ),
            ),
          ),
          const SizedBox(height: 10),
          // Days Row
          Obx(() {
            final days = controller.getDaysInWeek();
            return Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children:
                  days.map((day) {
                    final isMarked = controller.isMarked(day);
                    final isSelected = controller.selectedDays.contains(day);
                    return GestureDetector(
                      onTap: () => controller.toggleSelectDay(day),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            DateFormat(
                              'E',
                            ).format(day).substring(0, 3).toUpperCase(),
                            style: const TextStyle(
                              fontSize: 12,
                              color: Colors.black,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          const SizedBox(height: 5),
                          Container(
                            width: 30,
                            height: 30,
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              color: const Color(
                                0xFFE0F7FA,
                              ), // Light cyan background
                              border:
                                  isSelected
                                      ? Border.all(color: Colors.blue, width: 2)
                                      : null, // Blue border for selected days
                            ),
                            child: Center(
                              child:
                                  (isMarked || isSelected)
                                      ? const Icon(
                                        Icons
                                            .eco, // Leaf icon for marked or selected days
                                        color: Colors.green,
                                        size: 20,
                                      )
                                      : null,
                            ),
                          ),
                        ],
                      ),
                    );
                  }).toList(),
            );
          }),
        ],
      ),
    );
  }
}
