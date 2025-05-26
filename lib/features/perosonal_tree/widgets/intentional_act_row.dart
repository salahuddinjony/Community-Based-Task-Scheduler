import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tread256/features/perosonal_tree/controller/personal_tree_controller.dart';

class IntentionalActRow extends StatelessWidget {
  final int index;

  IntentionalActRow({super.key, required this.index});

  final PersonalTreeController controller = Get.find<PersonalTreeController>(
    // tag: 'personal_tree',
  );

  @override
  Widget build(BuildContext context) {
    if (index >= controller.persons.length) {
      return const SizedBox.shrink();
    }

    final personData = controller.persons[index];
    // print("Print all data: ${personData}");

    // Fallback for icons and colors
    const iconPaths = ["assets/icons/right.png", "assets/icons/right2.png"];
    const colors = [Colors.green, Colors.red];

    final isPending = [
      'pending',
      'panding',
      'pendng',
    ].any((word) => personData['tag'].toString().toLowerCase().contains(word));

    final iconPath = isPending ? iconPaths[1] : iconPaths[0];

    final iconColor = isPending ? colors[1] : colors[0];

    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 16.0),
      child: Row(
        children: [
          CircleAvatar(
            radius: 20,
            backgroundImage:
                personData['imagePath'] != null &&
                        personData['imagePath'].isNotEmpty
                    ? FileImage(File(personData['imagePath']))
                    : const AssetImage("assets/icons/userprofile.png"),
          ),
          const SizedBox(width: 16),
          Expanded(
            child: Text(
              personData['name'] ?? 'Unknown',
              style: const TextStyle(fontWeight: FontWeight.bold),
            ),
          ),
          Expanded(
            child: Text(
              personData['relationship'] ?? 'Unknown',
              style: const TextStyle(),
            ),
          ),
          Expanded(
            child: Text(
              personData['tag'] ?? 'Unknown',
              style: const TextStyle(),
            ),
          ),
          SizedBox(
            width: isPending ? 18 : 25,
            height: isPending ? 18 : 25,
            child: Image.asset(iconPath, color: iconColor, fit: BoxFit.contain),
          ),
        ],
      ),
    );
  }
}
