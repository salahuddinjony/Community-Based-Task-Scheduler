import 'package:flutter/material.dart';
import 'package:tread256/features/calender/screen/calendar_strip.dart';
import 'package:tread256/features/main_screen/widgets/tree_slider.dart';

class HeaderSection extends StatelessWidget {
  final List<TreeSlide> slides;

  const HeaderSection({super.key, required this.slides});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CalendarStrip(),
        const SizedBox(height: 20),
        TreeSlider(slides: slides),
      ],
    );
  }
}
