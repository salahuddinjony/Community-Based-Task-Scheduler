import 'package:get/get.dart';
import 'package:intl/intl.dart';

class CalendarController extends GetxController {
  var selectedMonthYear = DateTime(2025, 1, 1).obs; // Start at Jan 2025
  var markedDays = <DateTime>[].obs;
  var selectedDays = <DateTime>{}.obs; // Set to track selected days

  @override
  void onInit() {
    super.onInit();
    updateMarkedDays();
  }

  void updateMarkedDays() {
    markedDays.clear();
    // final year = selectedMonthYear.value.year;
    // final month = selectedMonthYear.value.month;
    // Mark the 2nd, 5th, and 6th days of the first week (if they exist and aren't Thursday)
    final days = getDaysInWeek();
    if (days.length > 1) markedDays.add(days[1]); // 2nd day (e.g., Tue)
    if (days.length > 4) markedDays.add(days[4]); // 5th day (e.g., Sat)
    if (days.length > 5) markedDays.add(days[5]); // 6th day (e.g., Sun)
  }

  void previousMonth() {
    int newMonth = selectedMonthYear.value.month - 1;
    int newYear = selectedMonthYear.value.year;
    if (newMonth < 1) {
      newMonth = 12;
      newYear -= 1;
    }
    selectedMonthYear.value = DateTime(newYear, newMonth, 1);
    updateMarkedDays();
    selectedDays.clear(); // Clear selections when month/year changes
  }

  void nextMonth() {
    int newMonth = selectedMonthYear.value.month + 1;
    int newYear = selectedMonthYear.value.year;
    if (newMonth > 12) {
      newMonth = 1;
      newYear += 1;
    }
    selectedMonthYear.value = DateTime(newYear, newMonth, 1);
    updateMarkedDays();
    selectedDays.clear(); // Clear selections when month/year changes
  }

  String getMonthYear() {
    return DateFormat('MMM yyyy').format(selectedMonthYear.value).toUpperCase();
  }

  List<DateTime> getDaysInWeek() {
    final year = selectedMonthYear.value.year;
    final month = selectedMonthYear.value.month;
    DateTime firstDayOfMonth = DateTime(year, month, 1);
    int weekday = firstDayOfMonth.weekday;
    DateTime firstMonday = firstDayOfMonth.add(
      Duration(days: (weekday == 1 ? 0 : 8 - weekday)),
    );
    return [
      firstMonday, // Mon
      firstMonday.add(const Duration(days: 1)), // Tue
      firstMonday.add(const Duration(days: 2)), // Wed
      firstMonday.add(const Duration(days: 4)), // Fri
      firstMonday.add(const Duration(days: 5)), // Sat
      firstMonday.add(const Duration(days: 6)), // Sun
    ];
  }

  bool isMarked(DateTime day) {
    return markedDays.any(
      (markedDay) =>
          markedDay.year == day.year &&
          markedDay.month == day.month &&
          markedDay.day == day.day,
    );
  }

  void toggleSelectDay(DateTime day) {
    if (selectedDays.contains(day)) {
      selectedDays.remove(day);
    } else {
      selectedDays.add(day);
    }
  }
}
