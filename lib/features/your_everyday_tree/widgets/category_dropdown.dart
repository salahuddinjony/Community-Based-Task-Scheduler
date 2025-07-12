import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tread256/core/common/styles/global_text_style.dart';
import 'package:tread256/core/utils/constants/colors.dart';
import 'package:tread256/features/intentions/widgets/custom_input_decoration.dart'
    as CustomInputDecoration;
import 'package:tread256/features/your_everyday_tree/controller/my_initiatives_controller.dart';

Widget buildCategoryDropdown({
  required MyInitiativesController controller,
  required BuildContext context,
}) {
  return Obx(
    () => Padding(
      padding: const EdgeInsets.all(8.0),
      child: DropdownButtonFormField<String>(
        value:
            controller.selectedCategory.value.isEmpty
                ? null
                : controller.selectedCategory.value,
        hint: const Text(
          'Select Category',
          style: TextStyle(color: AppColors.primary),
        ),
        decoration: CustomInputDecoration.customInputDecoration(
          hintText: "Add a location",
        ),
        items:
            ["MEAL_TRAIN", "TIP_NIGHT"].map((value) {
              return DropdownMenuItem<String>(
                value: value,
                child: Row(
                  children: [
                    Expanded(
                      child: Text(
                        value,
                        overflow: TextOverflow.visible,
                        style: getTextStyle(
                          context: context,
                          fontSize: 16,
                          fontWeight: FontWeight.w400,
                          color: AppColors.primary,
                        ),
                      ),
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
        onChanged: (val) => controller.selectedCategory.value = val ?? '',
        dropdownColor: Colors.white,
        icon: const Icon(Icons.arrow_drop_down, color: Colors.grey),
        isExpanded: true,
        menuMaxHeight: 200,
      ),
    ),
  );
}
