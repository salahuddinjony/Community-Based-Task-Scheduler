import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:tread256/core/services/token_datasource.dart';
import 'package:tread256/core/utils/constants/api_url.dart';
import 'package:tread256/features/perosonal_tree/models/user_search_model.dart';
import 'package:tread256/features/perosonal_tree/models/branch_search_model.dart';
import 'package:tread256/features/perosonal_tree/models/add_person_model.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';

mixin MixinGlobalSearch {
  var isLoading = false.obs;

  var searchResults = <UserData>[].obs;
  var selectedBranchId = ''.obs;
  final relationshipController = TextEditingController();

  var isBranchSearchLoading = false.obs;
  final branchNameController = TextEditingController();
  var selectedUserId = ''.obs;

  var branchSearchResults = <BranchData>[].obs;

  var selectedUserData = Rx<UserData?>(null);
  var canSave = false.obs;

  var selectedBranchData = Rx<BranchData?>(null);

  final nameController = TextEditingController();

  final RxList<UserData> persons = <UserData>[].obs;
  final RxList<BranchData> branches = <BranchData>[].obs;

  void clearFields() {
    nameController.clear();
    relationshipController.clear();
    branchNameController.clear();
    selectedUserId.value = '';
    selectedUserData.value = null;
    selectedBranchId.value = '';
    selectedBranchData.value = null;
    searchResults.clear();
    branchSearchResults.clear();
    updateCanSave();
  }

  void updateCanSave() {
    canSave.value =
        selectedUserId.value.isNotEmpty &&
        relationshipController.text.isNotEmpty;
  }

  final token = TokenDatasource.getToken();

  void onNameChanged(String value) {
    if (value.isEmpty) {
      clearFields();
      return;
    }
    searchUsers(value);
  }

  //Global Search api
  Future<void> searchUsers(String query) async {
    try {
      isLoading.value = true;

      final response = await http.get(
        Uri.parse(ApiUrl.search(query)),
        headers: {'Accept': 'application/json', 'Authorization': token ?? ''},
      );

      if (response.statusCode == 200) {
        final data = jsonDecode(response.body);
        print('Branch Search API Response: ${response.body}');
        if (data['status'] == true && data['data'] != null) {
          searchResults.value =
              (data['data'] as List).map((e) => UserData.fromJson(e)).toList();
        } else {
          searchResults.clear();
        }
      } else {
        searchResults.clear();
      }
    } catch (e) {
      searchResults.clear();
    } finally {
      isLoading.value = false;
    }
  }

  void selectUser(UserData user) {
    selectedUserId.value = user.id;
    nameController.text = user.profile.name;
    selectedUserData.value = user;
    updateCanSave();
  }

  Future<void> toSaveConnection() async {
    try {
      isLoading.value = true;

      final requestBody =
          AddPersonRequest(
            friendId: selectedUserId.value,
            relationship: relationshipController.text,
          ).toJson();

      final response = await http.post(
        Uri.parse(ApiUrl.addNewPerson),
        headers: {
          'Content-Type': 'application/json',
          'Accept': 'application/json',
          'Authorization': token ?? '',
        },
        body: jsonEncode(requestBody),
      );

      final data = jsonDecode(response.body);
      print('Add Person API Response: ${response.body}');

      if (response.statusCode == 200 || response.statusCode == 201) {
        if (data['status'] == true) {
          EasyLoading.showSuccess('Person added successfully');
          clearFields();
        } else {
          final errorMessage = data['message'] ?? 'Failed to add person';

          EasyLoading.showError("$errorMessage");
          clearFields();
        }
      } else {
        final errorMessage = data['message'] ?? 'Failed to add person';
        print('HTTP Error: $errorMessage');
        EasyLoading.showError("$errorMessage");
        clearFields();
      }
    } catch (e) {
      print('Exception in toSaveConnection: $e');
      EasyLoading.showError('$e.toString()');
      clearFields();
    } finally {
      isLoading.value = false;
    }
  }

  void onBranchNameChanged(String value) {
    if (value.length >= 2) {
      searchBranches(value);
    } else {
      branchSearchResults.clear();
    }
  }

  Future<void> searchBranches(String query) async {
    try {
      print('searchBranches: Setting loading to true');
      isBranchSearchLoading.value = true;

      final response = await http.get(
        Uri.parse(ApiUrl.branchSearch(query)),
        headers: {'Accept': 'application/json', 'Authorization': token ?? ''},
      );

      if (response.statusCode == 200) {
        final data = jsonDecode(response.body);
        print('Branch Search API Response: ${response.body}');
        if (data['status'] == true && data['data'] != null) {
          branchSearchResults.value =
              (data['data'] as List)
                  .map((e) => BranchData.fromJson(e))
                  .toList();
        } else {
          branchSearchResults.clear();
        }
      } else {
        branchSearchResults.clear();
      }
    } catch (e) {
      print('searchBranches error: $e');
      branchSearchResults.clear();
    } finally {
      print('searchBranches: Setting loading to false');
      isBranchSearchLoading.value = false;
    }
  }
}
