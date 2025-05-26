import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

class AddIntentionsController extends GetxController {
  // Text Controllers
  final personNameController = TextEditingController();
  final titleController = TextEditingController();
  final dateController = TextEditingController();
  final relationshipController = TextEditingController();
  final noteController = TextEditingController();

  // Rx Variables for Dropdowns
  final selectedTree = ''.obs;
  final selectedCategory = ''.obs;

  void setSelectedTree(String value) {
    selectedCategory.value = value;
  }

  // List to store intentions
  final RxList<Map<String, dynamic>> intentions = <Map<String, dynamic>>[].obs;

  @override
  void onInit() {
    super.onInit();
    // personNameController.text = 'SALAH'; We can initialize this at the begainig
    dateController.text = DateFormat('yyyy-MM-dd').format(DateTime.now());
  }

  @override
  void onClose() {
    personNameController.dispose();
    titleController.dispose();
    dateController.dispose();
    relationshipController.dispose();
    noteController.dispose();
    super.onClose();
  }

  void saveIntention() {
    //Map
    final intention = {
      'personName': personNameController.text,
      'title': titleController.text,
      'tree': selectedTree.value,
      'category': selectedCategory.value,
      'date': dateController.text,
      'relationship': relationshipController.text,
      'note': noteController.text,
    };

    intentions.add(intention);

    personNameController.clear();
    titleController.clear();
    dateController.clear();
    relationshipController.clear();
    noteController.clear();
    selectedTree.value = '';
    selectedCategory.value = '';

    // print('Saved Intention: $intention');
    // print('All Intentions: $intentions');
  }
}
