import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AirlineContactsDialogController extends GetxController {
  // Text Controllers
  final TextEditingController contactNameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController mobileController = TextEditingController();
  final TextEditingController phoneController = TextEditingController();
  final TextEditingController whatsappController = TextEditingController();
  final TextEditingController remarksController = TextEditingController();

  // Dropdown Values
  var selectedAirlineCode = 'Label3'.obs;
  var selectedAirlineName = 'Label1'.obs;
  var selectedDepartment = 'Label1'.obs;
  var selectedHierarchy = 'Label1'.obs;

  // Dropdown Items
  final List<String> airlineCodes = ['Label3', 'Label1', 'Label2'];
  final List<String> airlineNames = ['Label1', 'Label2', 'Label3'];
  final List<String> departments = ['Label1', 'Label2', 'Label3'];
  final List<String> hierarchies = ['Label1', 'Label2', 'Label3'];

  // Navigation Methods
  void onFirstClicked() {
    print('First clicked');
  }

  void onLastClicked() {
    print('Last clicked');
  }

  void onNextClicked() {
    print('Next clicked');
  }

  // Delete
  void onDeleteClicked() {
    Get.dialog(
      AlertDialog(
        title: Text('Confirm Delete'),
        content: Text('Are you sure you want to delete this contact?'),
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
                'Contact deleted successfully',
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
    if (contactNameController.text.isEmpty) {
      Get.snackbar(
        'Validation Error',
        'Contact Name is required',
        snackPosition: SnackPosition.BOTTOM,
        backgroundColor: Colors.red,
        colorText: Colors.white,
      );
      return;
    }

    Get.snackbar(
      'Success',
      'Contact saved successfully',
      snackPosition: SnackPosition.BOTTOM,
      backgroundColor: Colors.green,
      colorText: Colors.white,
    );

    Get.back();
  }

  // Clear form
  void clearForm() {
    contactNameController.clear();
    emailController.clear();
    mobileController.clear();
    phoneController.clear();
    whatsappController.clear();
    remarksController.clear();
    selectedAirlineCode.value = 'Label3';
    selectedAirlineName.value = 'Label1';
    selectedDepartment.value = 'Label1';
    selectedHierarchy.value = 'Label1';
  }

  @override
  void onClose() {
    contactNameController.dispose();
    emailController.dispose();
    mobileController.dispose();
    phoneController.dispose();
    whatsappController.dispose();
    remarksController.dispose();
    super.onClose();
  }
}