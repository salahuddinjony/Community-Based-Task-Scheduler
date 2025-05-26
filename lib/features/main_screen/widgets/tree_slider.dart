import 'package:flutter/material.dart';
import 'package:tread256/features/main_screen/widgets/navigation_dots.dart';
import 'package:tread256/features/main_screen/widgets/slide_content.dart';

// features/main_screen/widgets/tree_slider.dart
class TreeSlide {
  final String imagePath;
  final String text;

  TreeSlide({required this.imagePath, required this.text});
}

class TreeSlider extends StatelessWidget {
  final List<TreeSlide> slides;

  const TreeSlider({super.key, required this.slides});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [SlideContent(), SizedBox(height: 20), NavigationDots()],
    );
  }
}
