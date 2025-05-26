import 'package:flutter/material.dart';
import 'package:tread256/features/perosonal_tree/widgets/custom_button.dart';

class MealTrainDocumentationScreen extends StatelessWidget {
  const MealTrainDocumentationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // Example URLs for demonstration; replace with your own if needed

    final bulletTexts = [
      'Many Seniors Appreciated Not Just The Meals But Also The Brief Social Interaction.',
      'Logistics (Like Parking And Route Planning) Can Significantly Impact Delivery Efficiency. Better To Group Nearby Addresses Together.',
      'Some Recipients Mentioned Needing Additional Help With Pet Supplies. Potential Area For Future Outreach.',
    ];

    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Meal Train Documentation',
          style: TextStyle(
            color: Colors.teal,
            fontWeight: FontWeight.w600,
            fontSize: 22,
          ),
        ),
        centerTitle: true,
        backgroundColor: Colors.white,
        elevation: 0,
        iconTheme: const IconThemeData(color: Colors.black),

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
      ),
      backgroundColor: Colors.white,
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Top spacing
              const SizedBox(height: 12),
              // // Title
              // const Center(
              //   child: Text(
              //     'Meal Train Documentation',
              //     style: TextStyle(
              //       color: Color(0xFF2CB58D),
              //       fontWeight: FontWeight.w600,
              //       fontSize: 22,
              //     ),
              //   ),
              // ),
              // const SizedBox(height: 8),
              // Subtitle
              const Center(
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 8.0),
                  child: Text(
                    'Review the details and impact of your\n documented initiative below.',
                    style: TextStyle(color: Colors.black54, fontSize: 15),
                    textAlign: TextAlign.center,
                  ),
                ),
              ),
              const SizedBox(height: 18),
              // Summary Card
              Container(
                width: double.infinity,
                decoration: BoxDecoration(
                  color: const Color(0xFFF6FAF8),
                  borderRadius: BorderRadius.circular(14),
                ),
                padding: const EdgeInsets.symmetric(
                  vertical: 18,
                  horizontal: 14,
                ),
                child: Column(
                  children: [
                    Container(
                      decoration: BoxDecoration(
                        color: const Color(0xFFE2F3EC),
                        shape: BoxShape.circle,
                      ),
                      padding: const EdgeInsets.all(10),
                      child: Icon(
                        Icons.lightbulb_outline,
                        color: Color(0xFF2CB58D),
                        size: 32,
                      ),
                    ),
                    const SizedBox(height: 8),
                    const Text(
                      'Summary',
                      style: TextStyle(
                        color: Color(0xFF2CB58D),
                        fontWeight: FontWeight.w600,
                        fontSize: 16,
                      ),
                    ),
                    const SizedBox(height: 8),
                    const Text(
                      'Delivered 25 hot meals to elderly residents in the downtown area. Helped 10 families with grocery deliveries, including fresh produce and pantry staples. Assisted 3 homebound individuals with prescription pickups.',
                      style: TextStyle(color: Color(0xff535A6C), fontSize: 15),
                      textAlign: TextAlign.center,
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 22),
              // Participants & Tags
              const Text(
                'Participants & Tags',
                style: TextStyle(
                  fontWeight: FontWeight.w600,
                  fontSize: 15,
                  color: Color(0xff535A6C),
                ),
              ),
              const SizedBox(height: 10),
              Row(
                children: [
                  Image.asset(
                    "assets/icons/porson_icon.png",
                    width: 20,
                    height: 20,
                  ),
                  const SizedBox(width: 8),
                  Expanded(
                    child: Text(
                      'sarah lee, jamal carter, priya patel',
                      style: TextStyle(fontSize: 14, color: Color(0xff535A6C)),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 8),
              const Divider(height: 24, thickness: 1),
              Row(
                children: [
                  const Icon(
                    Icons.access_time,
                    color: Color(0xff535A6C),
                    size: 20,
                  ),
                  const SizedBox(width: 8),

                  const Text(
                    '3 hours (10:00 am - 1:00 pm)',
                    style: TextStyle(fontSize: 14, color: Color(0xff535A6C)),
                  ),
                ],
              ),
              const SizedBox(height: 8),
              const Divider(height: 24, thickness: 1),
              // What Did You Learn?
              const Text(
                'What Did You Learn?',
                style: TextStyle(
                  fontWeight: FontWeight.w600,
                  fontSize: 15,
                  color: Color(0xff535A6C),
                ),
              ),
              const SizedBox(height: 10),
              // Bullet List with links
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: List.generate(bulletTexts.length, (i) {
                  return Padding(
                    padding: const EdgeInsets.only(bottom: 10),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text(
                          '• ',
                          style: TextStyle(
                            fontSize: 18,
                            color: Color(0xff535A6C),
                          ),
                        ),
                        Expanded(
                          child: GestureDetector(
                            onTap: () async {
                              // final url = bulletLinks[i];
                              // if (await canLaunch(url)) {
                              //   await launch(url);
                              // }
                            },
                            child: Text(
                              bulletTexts[i],
                              style: const TextStyle(
                                fontSize: 14.5,
                                color: Color(0xFF535A6C),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  );
                }),
              ),
              const SizedBox(height: 30),

              // Button
              // Center(
              //   child: SizedBox(
              //     width: double.infinity,
              //     child: ElevatedButton(
              //       style: ElevatedButton.styleFrom(
              //         backgroundColor: const Color(0xFF2CB58D),
              //         padding: const EdgeInsets.symmetric(vertical: 14),
              //         shape: RoundedRectangleBorder(
              //           borderRadius: BorderRadius.circular(8),
              //         ),
              //       ),
              //       onPressed: () {
              //         // TODO: Add navigation logic
              //       },
              //       child: const Text(
              //         'Return to Initiatives',
              //         style: TextStyle(fontSize: 16, color: Colors.white),
              //       ),
              //     ),
              //   ),
              // ),
              // const SizedBox(height: 16),
              SizedBox(height: 50),
              CustomButtom(
                buttonText: 'Return to Initiatives',
                onPressed: () {
                  // print("hello flutter");
                  // Get.to(() => MealTrainDocumentationScreen());
                },
                vertical: 20,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
