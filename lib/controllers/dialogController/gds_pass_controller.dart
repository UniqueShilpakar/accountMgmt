import 'package:flutter/material.dart';
import 'package:get/get.dart';

class GdsPassController extends GetxController {
  // Text Controllers
  final TextEditingController userNameController = TextEditingController();
  final TextEditingController oidPccController = TextEditingController();
  final TextEditingController userIdController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController dcodeController = TextEditingController();
  final TextEditingController lniataController = TextEditingController();
  final TextEditingController urlController = TextEditingController();
  final TextEditingController expiryDateController = TextEditingController();

  // Dropdown Values
  var selectedGds = 'Label1'.obs;

  // Dropdown Items
  final List<String> gdsList = ['Label1', 'Label2', 'Label3'];

  // Delete
  void onDeleteClicked() {
    Get.dialog(
      AlertDialog(
        title: Text('Confirm Delete'),
        content: Text('Are you sure you want to delete this record?'),
        actions: [
          TextButton(
            onPressed: () => Get.back(),
            child: Text('Cancel'),
          ),
          ElevatedButton(
            onPressed: () {
              clearForm();
              Get.back();
            },
            style: ElevatedButton.styleFrom(backgroundColor: Colors.red),
            child: Text('Delete', style: TextStyle(color: Colors.white)),
          ),
        ],
      ),
    );
  }

  // Save
  void onSaveClicked() {
    if (userNameController.text.isEmpty) {
      return;
    }

    Get.back();
  }

  // Clear form
  void clearForm() {
    userNameController.clear();
    oidPccController.clear();
    userIdController.clear();
    passwordController.clear();
    dcodeController.clear();
    lniataController.clear();
    urlController.clear();
    expiryDateController.clear();
    selectedGds.value = 'Label1';
  }

  @override
  void onClose() {
    userNameController.dispose();
    oidPccController.dispose();
    userIdController.dispose();
    passwordController.dispose();
    dcodeController.dispose();
    lniataController.dispose();
    urlController.dispose();
    expiryDateController.dispose();
    super.onClose();
  }
}