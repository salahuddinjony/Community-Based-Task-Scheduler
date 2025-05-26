import 'package:flutter/material.dart';
import 'package:get/get.dart';

class FAQItem {
  final String question;
  final String answer;
  FAQItem({required this.question, required this.answer});
}

class FAQController extends GetxController {
  RxInt expandedIndex = (-1).obs;

  final faqs =
      [
        FAQItem(
          question: "Is there a free trial available?",
          answer:
              "Yes, you can try us for free for 30 days. If you want, we'll provide you with a free, personalized 30-minute onboarding call to get you up and running as soon as possible.",
        ),
        FAQItem(question: "Can I change my plan later?", answer: ""),
        FAQItem(question: "What is your cancellation policy?", answer: ""),
        FAQItem(question: "Can other info be added to an invoice?", answer: ""),
        FAQItem(question: "How does billing work?", answer: ""),
        FAQItem(question: "How do I change my account email?", answer: ""),
      ].obs;
}

class FrequentlyAskedQuestions extends StatelessWidget {
  FrequentlyAskedQuestions({super.key});
  final FAQController controller = Get.put(FAQController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFE5EAF2),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 18.0, vertical: 12),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(height: 18),
                // Top icon circle
                Center(
                  child: Container(
                    width: 70,
                    height: 70,
                    decoration: BoxDecoration(
                      color: const Color(0xFFE5F5EC),
                      shape: BoxShape.circle,
                    ),
                    child: const Center(
                      child: Icon(
                        Icons.question_answer, // Kept as question_answer
                        color: Color(0xFF3CB371),
                        size: 40,
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 18),
                const Center(
                  child: Text(
                    "Frequently asked questions",
                    style: TextStyle(
                      fontSize: 22,
                      fontWeight: FontWeight.w600,
                      color: Colors.black87,
                    ),
                  ),
                ),
                const SizedBox(height: 8),
                const Center(
                  child: Text(
                    "Everything you need to know about the product and billing.",
                    style: TextStyle(fontSize: 15, color: Colors.black54),
                    textAlign: TextAlign.center,
                  ),
                ),
                const SizedBox(height: 18),

                // FAQ list with ExpansionTile
                Obx(
                  () => ListView.separated(
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    itemCount: controller.faqs.length,
                    separatorBuilder:
                        (_, __) => const Divider(
                          height: 1,
                          thickness: 1,
                          color: Color(0xFFDFE3E8),
                        ),
                    itemBuilder: (context, index) {
                      final faq = controller.faqs[index];
                      final isExpanded =
                          controller.expandedIndex.value == index;
                      return Theme(
                        data: Theme.of(context).copyWith(
                          dividerColor: Colors.transparent,
                          splashColor: Colors.transparent,
                          highlightColor: Colors.transparent,
                        ),
                        child: ExpansionTile(
                          key: Key(index.toString()),
                          initiallyExpanded: isExpanded,
                          onExpansionChanged: (expanded) {
                            if (expanded) {
                              controller.expandedIndex.value = index;
                            } else if (controller.expandedIndex.value ==
                                index) {
                              controller.expandedIndex.value = -1;
                            }
                          },
                          tilePadding: const EdgeInsets.symmetric(
                            horizontal: 0,
                            vertical: 0,
                          ),
                          title: Text(
                            faq.question,
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight:
                                  isExpanded
                                      ? FontWeight.w600
                                      : FontWeight.w500,
                              color:
                                  isExpanded
                                      ? const Color(0xFF3CB371)
                                      : Colors.black87,
                            ),
                          ),
                          trailing: Icon(
                            isExpanded
                                ? Icons.remove_circle_outline
                                : Icons.add_circle_outline,
                            color:
                                isExpanded
                                    ? const Color(0xFF3CB371)
                                    : Colors.grey,
                            size: 24,
                          ),
                          children: [
                            if (faq.answer.isNotEmpty)
                              Padding(
                                padding: const EdgeInsets.only(
                                  left: 16, // Adjusted for better alignment
                                  right: 16,
                                  bottom: 16,
                                ),
                                child: Align(
                                  alignment: Alignment.centerLeft,
                                  child: Text(
                                    faq.answer,
                                    style: const TextStyle(
                                      fontSize: 15,
                                      color: Colors.black87,
                                      height: 1.4,
                                    ),
                                  ),
                                ),
                              ),
                          ],
                        ),
                      );
                    },
                  ),
                ),

                const SizedBox(height: 28),

                // Bottom contact box
                Container(
                  width: double.infinity,
                  padding: const EdgeInsets.symmetric(
                    vertical: 22,
                    horizontal: 16,
                  ),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(14),
                  ),
                  child: Column(
                    children: [
                      const Text(
                        "Still have questions?",
                        style: TextStyle(
                          fontWeight: FontWeight.w600,
                          fontSize: 16,
                          color: Colors.black87,
                        ),
                      ),
                      const SizedBox(height: 8),
                      const Text(
                        "Can't find the answer you're looking for? Please chat to our friendly team.",
                        style: TextStyle(fontSize: 15, color: Colors.black54),
                        textAlign: TextAlign.center,
                      ),
                      const SizedBox(height: 14),
                      SizedBox(
                        width: double.infinity,
                        child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            backgroundColor: const Color(0xFF3CB371),
                            padding: const EdgeInsets.symmetric(vertical: 12),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(8),
                            ),
                          ),
                          onPressed: () {
                            // TODO: Add chat/contact logic
                          },
                          child: const Text(
                            "Get in touch",
                            style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.w600,
                              fontSize: 16,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),

                const SizedBox(height: 24),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
