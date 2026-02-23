import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AirlinePassController extends GetxController {
  // Text Controllers
  final TextEditingController userIdController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController dcodeController = TextEditingController();
  final TextEditingController urlController = TextEditingController();
  final TextEditingController expiryDateController = TextEditingController();
  final TextEditingController pwidController = TextEditingController();

  // Dropdown Values
  var selectedOrganization = 'Label1'.obs;

  // Dropdown Items
  final List<String> organizations = ['Label1', 'Label2', 'Label3'];

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
    if (userIdController.text.isEmpty) {
      return;
    }

    Get.back();
  }

  // Clear form
  void clearForm() {
    userIdController.clear();
    passwordController.clear();
    dcodeController.clear();
    urlController.clear();
    expiryDateController.clear();
    pwidController.clear();
    selectedOrganization.value = 'Label1';
  }

  @override
  void onClose() {
    userIdController.dispose();
    passwordController.dispose();
    dcodeController.dispose();
    urlController.dispose();
    expiryDateController.dispose();
    pwidController.dispose();
    super.onClose();
  }
}