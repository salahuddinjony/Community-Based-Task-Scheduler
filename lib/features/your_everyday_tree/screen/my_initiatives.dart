import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tread256/core/common/styles/global_text_style.dart';
import 'package:tread256/features/perosonal_tree/widgets/custom_button.dart';

import '../../../core/common/styles/input_decoration.dart';

// Assuming these are defined elsewhere in your project
class AppColors {
  static const Color primary = Colors.teal;
}

class MyInitiativesController extends GetxController {
  var selectedCategory = 'Meal Train'.obs;

  void setSelectedTree(String value) {
    selectedCategory.value = value;
  }
}

// Sample initiatives list moved before usage
final List<Map<String, dynamic>> initiatives = [
  {
    'icon': 'assets/icons/light_icon.png',
    'title': 'Meal Train',
    'description': 'Organize meals for a family in need.',
    'participants': 4,
    'tagged': 4,
    'status': 'Document',
  },
  {
    'icon': 'assets/icons/frame_image1.png',
    'title': 'Tip Night',
    'description': 'Host a fundraising night at a local restaurant',
    'participants': 2,
    'tagged': 2,
    'status': 'Complete',
  },
  {
    'icon': 'assets/icons/frame_image1.png',
    'title': 'Tip Night',
    'description': 'Host a fundraising night at a local restaurant',
    'participants': 4,
    'tagged': 4,
    'status': 'Complete',
    'iconvalue': 'assets/icons/Frame.png',
    "isSelected": true,
  },
];

class MyInitiativesScreen extends StatelessWidget {
  MyInitiativesScreen({super.key});
  final controller = Get.put(MyInitiativesController());

  final List<String> categories = [
    'Park',
    'Community Center',
    'School',
    'Library',
    'Other',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: false,
      resizeToAvoidBottomInset: true,
      backgroundColor: const Color(0xFFF6FAFF),
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 18, vertical: 8),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            const SizedBox(height: 40),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                CircleAvatar(
                  backgroundColor: const Color(0xFFF2F4F5),
                  child: IconButton(
                    icon: const Icon(
                      Icons.arrow_back,
                      color: AppColors.primary,
                    ),
                    onPressed: () {
                      Get.back();
                    },
                  ),
                ),
                const SizedBox(width: 8),
                const Expanded(
                  child: Center(
                    child: Text(
                      "My Initiatives",
                      style: TextStyle(
                        color: AppColors.primary,
                        fontWeight: FontWeight.w600,
                        fontSize: 28,
                      ),
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 30),
            ListView.builder(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemCount: initiatives.length,
              itemBuilder: (_, index) {
                final initiative = initiatives[index];
                return _InitiativeCard(
                  icon: initiative['icon'],
                  title: initiative['title'],
                  description: initiative['description'],
                  participants: initiative['participants'],
                  tagged: initiative['tagged'],
                  status: initiative['status'],
                  iconvalue: initiative['iconvalue'],
                  isSelected: initiative['isSelected'] ?? false,
                );
              },
            ),
            const SizedBox(height: 12),
            Center(
              child: Text(
                "Create New Initiative",
                style: TextStyle(
                  color: AppColors.primary,
                  fontWeight: FontWeight.w600,
                  fontSize: 20,
                ),
              ),
            ),
            const SizedBox(height: 18),

            GetX<MyInitiativesController>(
              builder:
                  (controller) => Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: DropdownButtonFormField<String>(
                      value:
                          controller.selectedCategory.value.isEmpty
                              ? null
                              : controller.selectedCategory.value,
                      hint: const Text('Select Category'),
                      // decoration: InputDecoration(
                      //   // Define the default border
                      //   border: OutlineInputBorder(
                      //     borderRadius: BorderRadius.circular(12),
                      //     borderSide: const BorderSide(
                      //       color: Color(0xffE0E0E0),
                      //       width: 1.5,
                      //     ),
                      //   ),
                      //   // Explicitly define enabled border
                      //   enabledBorder: OutlineInputBorder(
                      //     borderRadius: BorderRadius.circular(12),
                      //     borderSide: const BorderSide(
                      //       color: Color(0xffE0E0E0),
                      //       width: 1.5,
                      //     ),
                      //   ),
                      //   // Explicitly define focused border
                      //   focusedBorder: OutlineInputBorder(
                      //     borderRadius: BorderRadius.circular(12),
                      //     borderSide: const BorderSide(
                      //       color: Color(0xffF8F8F7),
                      //       width: 2.0,
                      //     ), // Highlight when focused
                      //   ),
                      //   // Optional: Define error border if validation is used
                      //   errorBorder: OutlineInputBorder(
                      //     borderRadius: BorderRadius.circular(12),
                      //     borderSide: const BorderSide(
                      //       color: Colors.red,
                      //       width: 1.5,
                      //     ),
                      //   ),
                      //   focusedErrorBorder: OutlineInputBorder(
                      //     borderRadius: BorderRadius.circular(12),
                      //     borderSide: const BorderSide(
                      //       color: Colors.red,
                      //       width: 2.0,
                      //     ),
                      //   ),
                      //   filled: true,
                      //   fillColor: const Color(
                      //     0xffF8F8F7,
                      //   ), // Applied field color
                      //   contentPadding: const EdgeInsets.symmetric(
                      //     horizontal: 12,
                      //     vertical: 14,
                      //   ),
                      // ),
                      decoration: CustomInputDecoration.customInputDecoration(
                        hintText: "Add a location",
                      ),

                      items:
                          ["Meal Train", "Tip Night"].map((value) {
                            return DropdownMenuItem<String>(
                              value: value,
                              child: Row(
                                children: [
                                  Expanded(
                                    child: Text(
                                      value,
                                      overflow: TextOverflow.visible,
                                      style: getTextStyle(
                                        fontSize: 16,
                                        fontWeight: FontWeight.w400,
                                        color: AppColors.primary,
                                      ),
                                    ),
                                  ),
                                  CircleAvatar(
                                    backgroundColor: AppColors.primary
                                        .withValues(alpha: 0.3),
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
                      onChanged: (String? newValue) {
                        controller.setSelectedTree(newValue ?? '');
                      },
                      dropdownColor: Colors.white,
                      icon: const Icon(
                        Icons.arrow_drop_down,
                        color: Colors.grey,
                      ),
                      isExpanded: true,
                      menuMaxHeight: 200,
                    ),
                  ),
            ),

            const SizedBox(height: 14),
            Align(
              alignment: Alignment.centerLeft,
              child: const Text(
                'Description',
                style: TextStyle(
                  fontWeight: FontWeight.w500,
                  fontSize: 16,
                  color: Color(0xff535A6C),
                ),
              ),
            ),
            const SizedBox(height: 8),
            TextFormField(
              maxLines: 4,
              decoration: InputDecoration(
                hintText: 'Description....',
                hintStyle: TextStyle(
                  color: Color(0x9E535A6C),
                  fontSize: 14,
                  fontWeight: FontWeight.w400,
                ),
                filled: true,
                fillColor: Color(0xFFF8F8F7),
                contentPadding: EdgeInsets.symmetric(
                  horizontal: 12,
                  vertical: 14,
                ),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                  borderSide: BorderSide(color: Color(0xFFE0E0E0)),
                ),
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                  borderSide: BorderSide(color: Color(0xFFE0E0E0)),
                ),
              ),
            ),
            const SizedBox(height: 14),
            Align(
              alignment: Alignment.centerLeft,
              child: const Text(
                'Add People',
                style: TextStyle(
                  fontWeight: FontWeight.w500,
                  fontSize: 16,
                  color: Color(0xff535A6C),
                ),
              ),
            ),
            const SizedBox(height: 8),
            TextFormField(
              decoration: InputDecoration(
                hintText: 'Type Names Or Emails',
                hintStyle: TextStyle(
                  color: Color(0x9E535A6C),
                  fontSize: 14,
                  fontWeight: FontWeight.w400,
                ),
                filled: true,
                fillColor: Color(0xFFF8F8F7),
                contentPadding: EdgeInsets.symmetric(
                  horizontal: 12,
                  vertical: 14,
                ),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                  borderSide: BorderSide(color: Color(0xFFE0E0E0)),
                ),
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                  borderSide: BorderSide(color: Color(0xFFE0E0E0)),
                ),
                suffixIcon: Icon(
                  Icons.group_outlined,
                  color: Color(0xFF535A6C),
                ),
              ),
            ),
            const SizedBox(height: 18),
            CustomButtom(
              buttonText: 'Create Initiative',
              onPressed: () {},
              vertical: 20,
            ),
            const SizedBox(height: 12),
          ],
        ),
      ),
    );
  }
}

class _InitiativeCard extends StatelessWidget {
  final String icon;
  final String title;
  final String description;
  final int participants;
  final int tagged;
  final String status;
  final String? iconvalue;
  final bool isSelected;

  const _InitiativeCard({
    required this.icon,
    required this.title,
    required this.description,
    required this.participants,
    required this.tagged,
    required this.status,
    this.iconvalue,
    this.isSelected = false,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(14),
      decoration: BoxDecoration(borderRadius: BorderRadius.circular(16)),
      child: Column(
        children: [
          CircleAvatar(
            backgroundColor: const Color(0xFFE6F2EF),
            radius: 28,
            backgroundImage: AssetImage(icon),
          ),
          const SizedBox(height: 8),
          Text(
            title,
            style: const TextStyle(
              color: AppColors.primary,
              fontWeight: FontWeight.w400,
              fontSize: 20,
            ),
          ),
          const SizedBox(height: 4),
          Text(
            description,
            textAlign: TextAlign.center,
            style: const TextStyle(color: Colors.black87, fontSize: 14),
          ),
          const SizedBox(height: 4),
          Text(
            'Participants: $participants tagged',
            style: const TextStyle(color: Colors.black54, fontSize: 13),
          ),
          const SizedBox(height: 10),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  side: const BorderSide(color: Colors.transparent),
                  backgroundColor: AppColors.primary,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8),
                    side: BorderSide.none,
                  ),
                  padding: const EdgeInsets.symmetric(
                    horizontal: 28,
                    vertical: 14,
                  ),
                ),
                onPressed: () {},
                child: Row(
                  children: [
                    Text(
                      status == 'Complete' ? 'Complete' : 'Document',
                      style: const TextStyle(color: Colors.white),
                    ),
                    const SizedBox(width: 4),
                    isSelected == true
                        ? Image.asset(
                          iconvalue ?? 'assets/icons/Frame.png',
                          width: 20,
                          height: 20,
                        )
                        : const SizedBox.shrink(),
                  ],
                ),
              ),
              const SizedBox(width: 12),
              OutlinedButton(
                style: OutlinedButton.styleFrom(
                  foregroundColor: AppColors.primary,
                  side: const BorderSide(color: Colors.teal),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                  padding: const EdgeInsets.symmetric(
                    horizontal: 28,
                    vertical: 14,
                  ),
                ),
                onPressed: () {},
                child: const Text('Share'),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class CreateInitiativeForm extends StatelessWidget {
  final MyInitiativesController controller;

  const CreateInitiativeForm({super.key, required this.controller});

  Widget buildDropdown({
    required String label,
    required String hintText,
    required RxString selectedValue,
    required List<String> items,
    required Function(String?) onChanged,
  }) {
    return DropdownButtonFormField<String>(
      decoration: InputDecoration(
        labelText: label,
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(8)),
        contentPadding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
      ),
      hint: Text(hintText),
      value: selectedValue.value.isEmpty ? null : selectedValue.value,
      items:
          items.map((String value) {
            return DropdownMenuItem<String>(value: value, child: Text(value));
          }).toList(),
      onChanged: onChanged,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Obx(
          () => buildDropdown(
            label: 'Categories',
            hintText: 'Select Category',
            selectedValue: controller.selectedCategory,
            items: [
              'Encouragement',
              'Support',
              'Health & Fitness',
              'Daily Routine',
              'Volunteering',
              'Mental Wellness',
            ],
            onChanged: (newValue) {
              controller.selectedCategory.value = newValue ?? '';
            },
          ),
        ),
        const SizedBox(height: 10),
        TextField(
          decoration: InputDecoration(
            labelText: 'Description',
            border: OutlineInputBorder(borderRadius: BorderRadius.circular(8)),
            contentPadding: const EdgeInsets.symmetric(
              horizontal: 12,
              vertical: 8,
            ),
          ),
          maxLines: 2,
        ),
        const SizedBox(height: 10),
        TextField(
          decoration: InputDecoration(
            labelText: 'Add People',
            hintText: 'Type Names Or Emails',
            border: OutlineInputBorder(borderRadius: BorderRadius.circular(8)),
            contentPadding: const EdgeInsets.symmetric(
              horizontal: 12,
              vertical: 8,
            ),
            suffixIcon: Icon(Icons.person_add_alt_1, color: Colors.teal),
          ),
        ),
        const SizedBox(height: 14),
        SizedBox(
          width: double.infinity,
          child: ElevatedButton(
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.teal,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(8),
              ),
              padding: const EdgeInsets.symmetric(vertical: 14),
            ),
            onPressed: () {},
            child: const Text(
              'Create Initiative',
              style: TextStyle(fontSize: 16, color: Colors.white),
            ),
          ),
        ),
      ],
    );
  }
}

class CreateNewInitiativeScreen extends StatefulWidget {
  const CreateNewInitiativeScreen({super.key});

  @override
  State<CreateNewInitiativeScreen> createState() =>
      _CreateNewInitiativeScreenState();
}

class _CreateNewInitiativeScreenState extends State<CreateNewInitiativeScreen> {
  String? selectedCategory;
  final List<String> categories = [
    'Park',
    'Community Center',
    'School',
    'Library',
    'Other',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF8FAFB),
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 24),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Center(
              child: Text(
                'Create New Initiative',
                style: TextStyle(
                  color: Color(0xFF3CB496),
                  fontWeight: FontWeight.w600,
                  fontSize: 22,
                  decoration: TextDecoration.underline,
                ),
              ),
            ),
            const SizedBox(height: 32),
            Text(
              'Categories',
              style: TextStyle(
                color: Color(0xFF535A6C),
                fontWeight: FontWeight.w500,
                fontSize: 15,
              ),
            ),
            const SizedBox(height: 6),
            DropdownButtonFormField<String>(
              value: selectedCategory,
              hint: Text(
                'Add A Location',
                style: TextStyle(
                  color: Color(0x9E535A6C),
                  fontSize: 14,
                  fontWeight: FontWeight.w400,
                ),
              ),
              items:
                  categories
                      .map(
                        (cat) => DropdownMenuItem(value: cat, child: Text(cat)),
                      )
                      .toList(),
              onChanged: (val) => setState(() => selectedCategory = val),
              decoration: InputDecoration(
                filled: true,
                fillColor: Color(0xFFF8F8F7),
                contentPadding: EdgeInsets.symmetric(
                  horizontal: 12,
                  vertical: 14,
                ),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                  borderSide: BorderSide(color: Color(0xFFE0E0E0)),
                ),
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                  borderSide: BorderSide(color: Color(0xFFE0E0E0)),
                ),
              ),
              icon: Icon(Icons.keyboard_arrow_down, color: Color(0xFF535A6C)),
            ),
            const SizedBox(height: 18),
            Text(
              'Description',
              style: TextStyle(
                color: Color(0xFF535A6C),
                fontWeight: FontWeight.w500,
                fontSize: 15,
              ),
            ),
            const SizedBox(height: 6),
            TextFormField(
              maxLines: 4,
              decoration: InputDecoration(
                hintText: 'Description....',
                hintStyle: TextStyle(
                  color: Color(0x9E535A6C),
                  fontSize: 14,
                  fontWeight: FontWeight.w400,
                ),
                filled: true,
                fillColor: Color(0xFFF8F8F7),
                contentPadding: EdgeInsets.symmetric(
                  horizontal: 12,
                  vertical: 14,
                ),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                  borderSide: BorderSide(color: Color(0xFFE0E0E0)),
                ),
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                  borderSide: BorderSide(color: Color(0xFFE0E0E0)),
                ),
              ),
            ),
            const SizedBox(height: 18),
            Text(
              'Add People',
              style: TextStyle(
                color: Color(0xFF535A6C),
                fontWeight: FontWeight.w500,
                fontSize: 15,
              ),
            ),
            const SizedBox(height: 6),
            TextFormField(
              decoration: InputDecoration(
                hintText: 'Type Names Or Emails',
                hintStyle: TextStyle(
                  color: Color(0x9E535A6C),
                  fontSize: 14,
                  fontWeight: FontWeight.w400,
                ),
                filled: true,
                fillColor: Color(0xFFF8F8F7),
                contentPadding: EdgeInsets.symmetric(
                  horizontal: 12,
                  vertical: 14,
                ),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                  borderSide: BorderSide(color: Color(0xFFE0E0E0)),
                ),
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                  borderSide: BorderSide(color: Color(0xFFE0E0E0)),
                ),
                suffixIcon: Icon(
                  Icons.group_outlined,
                  color: Color(0xFF535A6C),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
