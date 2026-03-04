import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CreateSupplierController extends GetxController {
  //text controller
  final TextEditingController supplierNameController = TextEditingController();
  final TextEditingController addressController = TextEditingController();
  final TextEditingController mobileController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController vatPanController = TextEditingController();
  final TextEditingController contactPersonController = TextEditingController();
  final TextEditingController ledgerIdController = TextEditingController();

  //dropdown values
  var selectedSupplierGroup = 'Label1'.obs;
  var selectedCategory = 'Label1'.obs;
  var selectedDistrict = 'Label1'.obs;

  //dropdown items
  final List<String> dropdownItems = ['Label1', 'Label2', 'Label3'];

  //close
  void onCloseClicked() {
    if (supplierNameController.text.isEmpty) {
      return;
    }
    Get.back();
  }
  // Clear form
  void clearForm() {
    supplierNameController.clear();
    addressController.clear();
    mobileController.clear();
    emailController.clear();
    vatPanController.clear();
    contactPersonController.clear();
    ledgerIdController.clear();
    selectedSupplierGroup.value = 'Label1';
    selectedCategory.value = 'Label1';
    selectedDistrict.value = 'Label1';
  }

  @override
  void onClose() {
    supplierNameController.dispose();
    addressController.dispose();
    mobileController.dispose();
    emailController.dispose();
    vatPanController.dispose();
    contactPersonController.dispose();
    ledgerIdController.dispose();
    super.onClose();
  }
}

