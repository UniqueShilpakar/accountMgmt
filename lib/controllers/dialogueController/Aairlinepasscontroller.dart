import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AirlinePassController extends GetxController {
  //text controllers
  final TextEditingController userIdController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController dcodeController = TextEditingController();
  final TextEditingController urlController = TextEditingController();
  final TextEditingController expiryDateController = TextEditingController();
  final TextEditingController pwidController = TextEditingController();

  //dropdown values
  var selectedOrganization = 'Label1'.obs;

  //dropdown items
  final List<String> organizations = ['Label1', 'Label2', 'Label3'];

  //delete
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
              Get.snackbar(
                'Deleted',
                'Record deleted successfully',
                snackPosition: SnackPosition.BOTTOM,
                backgroundColor: Colors.red,
                colorText: Colors.white,
              );
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
      Get.snackbar(
        'Validation Error',
        'UserID is required',
        snackPosition: SnackPosition.BOTTOM,
        backgroundColor: Colors.red,
        colorText: Colors.white,
      );
      return;
    }

    Get.snackbar(
      'Success',
      'Record saved successfully',
      snackPosition: SnackPosition.BOTTOM,
      backgroundColor: Colors.green,
      colorText: Colors.white,
    );

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

