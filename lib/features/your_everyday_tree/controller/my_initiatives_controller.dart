import 'package:get/get.dart';

class MyInitiativesController extends GetxController {
  final selectedCategory = ''.obs;

  void setSelectedTree(String value) {
    selectedCategory.value = value;
  }
}
