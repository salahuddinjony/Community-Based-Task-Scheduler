import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

class PersonalTreeController extends GetxController {
  var isIntentionalActsOn = false.obs;

  final nameController = TextEditingController();
  final relationshipController = TextEditingController();
  final tagsController = TextEditingController();
  final RxString selectedImagePath = ''.obs; // Store the selected image path

  final RxList<Map<String, dynamic>> persons = <Map<String, dynamic>>[].obs;

  @override
  void onClose() {
    nameController.dispose();
    relationshipController.dispose();
    tagsController.dispose();
    super.onClose();
  }

  void toggleIntentionalActs() => isIntentionalActsOn.toggle();

  // Pick an image from the gallery
  Future<void> pickImage() async {
    final picker = ImagePicker();
    final pickedFile = await picker.pickImage(source: ImageSource.gallery);
    if (pickedFile != null) {
      selectedImagePath.value = pickedFile.path;
    }
  }

  void savePerson() {
    if (nameController.text.isEmpty ||
        relationshipController.text.isEmpty ||
        selectedImagePath.value.isEmpty) {
      Get.snackbar('Error', 'Name,Relationship and Image are required');
      return;
    }

    final person = {
      'name': nameController.text,
      'relationship': relationshipController.text,
      'tag': tagsController.text,
      'imagePath':
          selectedImagePath.value.isNotEmpty
              ? selectedImagePath.value
              : 'assets/icons/profile.png', // Store image path, or null if not selected
    };

    persons.add(person);

    // Reset fields after saving
    nameController.clear();
    relationshipController.clear();
    tagsController.clear();
    selectedImagePath.value = ''; // Reset image path
    Get.back(); // Close the dialog after saving
  }

  // Future<void> _savePersons() async {
  //   final prefs = await SharedPreferences.getInstance();
  //   final personsJson = jsonEncode(persons.toList());
  //   await prefs.setString('persons', personsJson);
  // }

  // Future<void> _loadPersons() async {
  //   final prefs = await SharedPreferences.getInstance();
  //   final personsJson = prefs.getString('persons');
  //   if (personsJson != null) {
  //     final List<dynamic> decoded = jsonDecode(personsJson);
  //     persons.assignAll(decoded.cast<Map<String, dynamic>>());
  //   }
  // }
}
