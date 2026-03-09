import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CreateLedgerController extends GetxController {
  //text controller
  final TextEditingController ledgerNameController = TextEditingController();
  final TextEditingController addressController = TextEditingController();
  final TextEditingController mobile1Controller = TextEditingController();
  final TextEditingController mobile2Controller = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController vatPanController = TextEditingController();
  final TextEditingController contactPersonController = TextEditingController();
  final TextEditingController citizenshipNoController = TextEditingController();
  final TextEditingController fathersNameController = TextEditingController();
  final TextEditingController citizenshipDoiController =
      TextEditingController();
  final TextEditingController remarksController = TextEditingController();

  //dropdown values
  var selectedLedgerGroup = 'Label1'.obs;
  var selectedCategory = 'Label1'.obs;
  var selectedDistrict = 'Label1'.obs;

  //dropdown items
  final List<String> dropdownItems = ['Label1', 'Label2', 'Label3'];

  //close
  void onCloseClicked() {
    Get.back();
  }

  //delete
  void onDeleteClicked() {
    Get.dialog(
      AlertDialog(
        title: Text("Confirm Delete"),
        content: Text('Are you sure you want to delete this ledger?'),
        actions: [
          TextButton(onPressed: () => Get.back(), child: Text('Cancel')),
          ElevatedButton(
            onPressed: () {
              clearForm();
              Get.back();
              Get.back();
            },
            style:  ElevatedButton.styleFrom(backgroundColor: Colors.red),
            child: Text('Delete', style: TextStyle(color: Colors.white)),
          ),
        ],
      ),
    );
  }
 // Save
  void onSaveClicked() {
    if (ledgerNameController.text.isEmpty) {
      return;
    }

    Get.back();
  }

  // Clear form
  void clearForm() {
    ledgerNameController.clear();
    addressController.clear();
    mobile1Controller.clear();
    mobile2Controller.clear();
    emailController.clear();
    vatPanController.clear();
    contactPersonController.clear();
    citizenshipNoController.clear();
    fathersNameController.clear();
    citizenshipDoiController.clear();
    remarksController.clear();
    selectedLedgerGroup.value = 'Label1';
    selectedCategory.value = 'Label1';
    selectedDistrict.value = 'Label1';
  }

  @override
  void onClose() {
    ledgerNameController.dispose();
    addressController.dispose();
    mobile1Controller.dispose();
    mobile2Controller.dispose();
    emailController.dispose();
    vatPanController.dispose();
    contactPersonController.dispose();
    citizenshipNoController.dispose();
    fathersNameController.dispose();
    citizenshipDoiController.dispose();
    remarksController.dispose();
    super.onClose();
  }
}

