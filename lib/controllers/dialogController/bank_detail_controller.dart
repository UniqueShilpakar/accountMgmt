import 'package:flutter/material.dart';
import 'package:get/get.dart';

class BankDetailsController extends GetxController {
  //text controller
  final TextEditingController bankNameController = TextEditingController();
  final TextEditingController accountNameController = TextEditingController();
  final TextEditingController accountNoController = TextEditingController();
  final TextEditingController branchController = TextEditingController();
  final TextEditingController remarksController = TextEditingController();

  // dropDown values
  var selectedCreditorName = 'Label1'.obs;

  //dropdown items
  final List<String> creditorNames = ['Label1', 'Label2', 'Label3'];

  //delete
  void onDeleteClicked() {
    Get.dialog(
      AlertDialog(
        title: Text('Confirm Delete'),
        content: Text('Are you sure you want to delete this record?'),
        actions: [
          TextButton(onPressed: () => Get.back(), child: Text('Cancel')),
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

  //save
  void onSaveClicked() {
    if (bankNameController.text.isEmpty) {
      return;
    }
    Get.back();
  }

  //clear form
  void clearForm() {
    bankNameController.clear();
    accountNameController.clear();
    accountNoController.clear();
    branchController.clear();
    remarksController.clear();
    selectedCreditorName.value = 'Label1';
  }

  @override
  void onClose() {
    bankNameController.dispose();
    accountNameController.dispose();
    accountNoController.dispose();
    branchController.dispose();
    remarksController.dispose();
    super.onClose();
  }
}
