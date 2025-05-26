import 'package:get/get.dart';
import 'package:tread256/features/main_screen/widgets/tree_slider.dart';

class TreeSliderController extends GetxController {
  var slides = <TreeSlide>[].obs;
  var currentIndex = 0.obs;

  TreeSliderController(List<TreeSlide> initialSlides) {
    slides.assignAll(initialSlides);
  }

  void changeSlide(int index) {
    currentIndex.value = index;
  }
}
