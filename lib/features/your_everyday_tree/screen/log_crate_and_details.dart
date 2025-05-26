import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tread256/core/common/styles/global_text_style.dart';
import 'package:tread256/core/common/styles/input_decoration.dart';
import 'package:tread256/features/perosonal_tree/widgets/custom_button.dart';

import 'my_initiatives.dart';
import 'save_log.dart';

class LogCrateAndDetailsScreen extends StatelessWidget {
  const LogCrateAndDetailsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: Padding(
          padding: const EdgeInsets.all(8.0),
          child: CircleAvatar(
            backgroundColor: Color(0xffF2F4F5),

            child: IconButton(
              icon: const Icon(Icons.arrow_back, color: Colors.teal),
              onPressed: () => Navigator.of(context).pop(),
            ),
          ),
        ),
        title: const Text(
          'Log Crate And Details',
          style: TextStyle(
            color: Color(0xFF3CB496),
            fontWeight: FontWeight.w500,
            fontSize: 24,
          ),
        ),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              const SizedBox(height: 8),
              const Text(
                'Document Your Recent Contribution To Track\nAnd Celebrate Your Impact.',
                textAlign: TextAlign.center,
                style: TextStyle(color: Colors.black87, fontSize: 15),
              ),
              const SizedBox(height: 16),

              Container(
                decoration: BoxDecoration(
                  // color: const Color(0xFFF6FAF8),
                  color: Color(0xffF8F8F7),
                  borderRadius: BorderRadius.circular(14),
                ),
                padding: const EdgeInsets.symmetric(
                  vertical: 18,
                  horizontal: 14,
                ),
                child: Column(
                  children: [
                    CircleAvatar(
                      backgroundColor: Color(0x3357B396),
                      child: Image.asset(
                        "assets/icons/flage.png",
                        color: const Color(0xFF689F38),
                      ),
                    ),
                    const SizedBox(height: 10),
                    Text(
                      "Neighborhood garden",
                      style: getTextStyle(
                        color: AppColors.primary,
                        fontWeight: FontWeight.w400,
                        fontSize: 20,
                      ),
                      textAlign: TextAlign.center,
                    ),
                    const SizedBox(height: 9),
                    Text(
                      "start shared garden for your block",
                      style: getTextStyle(
                        color: Color(0xFF535A6C),
                        fontWeight: FontWeight.w400,
                        fontSize: 16,
                      ),
                      textAlign: TextAlign.center,
                    ),
                    const SizedBox(height: 12),
                  ],
                ),
              ),

              const SizedBox(height: 24),
              Text(
                'Log Details',
                style: getTextStyle(
                  fontWeight: FontWeight.w400,
                  fontSize: 14,
                  color: Color(0xff535A6C),
                ),
              ),
              const SizedBox(height: 12),
              Text(
                'What Did You Do?',
                style: getTextStyle(
                  fontWeight: FontWeight.w400,
                  fontSize: 14,
                  color: Color(0xff535A6C),
                ),
              ),
              const SizedBox(height: 6),
              TextFormField(
                maxLines: 4,
                decoration: CustomInputDecoration.customInputDecoration(
                  hintStyle: getTextStyle(
                    color: Color(0x9E535A6C),
                    fontSize: 12,
                    fontWeight: FontWeight.w400,
                  ),
                  hintText: 'Describe your activity)',
                ),
              ),

              const SizedBox(height: 16),
              Text(
                'Date',
                style: getTextStyle(
                  fontWeight: FontWeight.w400,
                  fontSize: 16,
                  color: Color(0xff535A6C),
                ),
              ),
              const SizedBox(height: 6),
              TextFormField(
                decoration: CustomInputDecoration.customInputDecoration(
                  hintStyle: getTextStyle(
                    color: Color(0x9E535A6C),
                    fontSize: 12,
                    fontWeight: FontWeight.w400,
                  ),
                  hintText: 'MM/DD/YYYY',
                  suffixIcon: Icon(Icons.access_time, color: Color(0xff535A6C)),
                ),
              ),
              const SizedBox(height: 16),
              Text(
                'Tag Participants',
                style: getTextStyle(
                  fontWeight: FontWeight.w400,
                  fontSize: 14,
                  color: Color(0xff535A6C),
                ),
              ),
              const SizedBox(height: 6),
              TextFormField(
                maxLines: 1,
                decoration: CustomInputDecoration.customInputDecoration(
                  hintStyle: getTextStyle(
                    color: Color(0x9E535A6C),
                    fontSize: 12,
                    fontWeight: FontWeight.w400,
                  ),
                  hintText: 'Add names or emails',
                  suffixIcon: Icon(
                    Icons.group_outlined,
                    color: Color(0xff535A6C),
                  ),
                ),
              ),
              const SizedBox(height: 44),
              CustomButtom(
                buttonText: 'Save Log',
                onPressed: () {
                  // print("hello flutter");
                  Get.to(() => SaveLogScreen());
                },
                vertical: 20,
              ),
              const SizedBox(height: 16),
            ],
          ),
        ),
      ),
    );
  }
}
