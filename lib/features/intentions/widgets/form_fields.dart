import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:tread256/core/utils/constants/colors.dart';
import 'package:tread256/features/intentions/controller/add_new_intentions_controller.dart';
import 'package:tread256/features/intentions/widgets/custom_input_decoration.dart';

Widget buildTextField({
  TextEditingController? controller,
  String? label,
  required String hintText,

  int? maxLines = 1,

  final Color? fillColor,
}) {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Text(
        label ?? "",
        style: TextStyle(fontSize: 16, color: AppColors.textSecondary),
      ),
      SizedBox(height: 10),
      TextFormField(
        controller: controller,
        decoration:
            maxLines == null
                ? customInputDecoration(hintText: hintText)
                : InputDecoration(
                  fillColor: fillColor,
                  labelText: hintText,
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8.0),
                  ),
                ),
        maxLines: maxLines,
      ),
    ],
  );
}

Widget buildDropdown({
  required String label,
  required String hintText,
  required RxString selectedValue,
  required List<String> items,
  required void Function(String?) onChanged,
}) {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Text(
        label,
        style: TextStyle(fontSize: 16, color: AppColors.textSecondary),
      ),
      SizedBox(height: 10),
      GetX<AddIntentionsController>(
        builder:
            (controller) => DropdownButtonFormField<String>(
              value: selectedValue.value.isEmpty ? null : selectedValue.value,
              hint: Text(hintText),
              decoration: customInputDecoration(hintText: ''),
              items:
                  items.map((value) {
                    return DropdownMenuItem<String>(
                      value: value,
                      child: Row(
                        children: [
                          Expanded(
                            child: Text(value, overflow: TextOverflow.visible),
                          ),
                          CircleAvatar(
                            backgroundColor: AppColors.primary.withOpacity(0.3),
                            radius: 15,
                            child: const Icon(
                              Icons.eco,
                              color: Colors.green,
                              size: 20,
                            ),
                          ),
                        ],
                      ),
                    );
                  }).toList(),
              onChanged: onChanged,
              dropdownColor: Colors.white,
              icon: const Icon(Icons.arrow_drop_down, color: Colors.grey),
              isExpanded: true,
              menuMaxHeight: 200,
            ),
      ),
    ],
  );
}

Widget buildDateField(
  BuildContext context,
  AddIntentionsController controller,
) {
  Future<void> selectDate() async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2000),
      lastDate: DateTime(2101),
      builder:
          (context, child) => Theme(
            data: ThemeData.light().copyWith(
              colorScheme: const ColorScheme.light(
                primary: AppColors.primary,
                onPrimary: Colors.white,
                onSurface: Colors.black,
              ),
              dialogTheme: const DialogTheme(backgroundColor: Colors.white),
            ),
            child: child!,
          ),
    );
    if (picked != null) {
      final now = DateTime.now();
      final dateTime = DateTime(
        picked.year,
        picked.month,
        picked.day,
        now.hour,
        now.minute,
        now.second,
      );
      controller.dateController.text = DateFormat(
        'yyyy-MM-ddTHH:mm:ss',
      ).format(dateTime);
    }
  }

  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Text(
        'Date',
        style: TextStyle(fontSize: 16, color: AppColors.textSecondary),
      ),
      const SizedBox(height: 10),
      GestureDetector(
        onTap: selectDate,
        child: AbsorbPointer(
          child: TextField(
            controller: controller.dateController,
            decoration: customInputDecoration(
              hintText: "Date",
            ).copyWith(suffixIcon: const Icon(Icons.calendar_today)),
          ),
        ),
      ),
    ],
  );
}
