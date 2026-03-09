import 'package:flutter/material.dart';
import 'package:get/get.dart';

class RouteEntryController extends GetxController {
  // Text Controllers
  final TextEditingController marketController = TextEditingController();
  final TextEditingController cx1Controller = TextEditingController();
  final TextEditingController cx2Controller = TextEditingController();
  final TextEditingController cx3Controller = TextEditingController();
  final TextEditingController cx1RbdController = TextEditingController();
  final TextEditingController cx2RbdController = TextEditingController();
  final TextEditingController cx3RbdController = TextEditingController();
  final TextEditingController remarksController = TextEditingController();

  // Dropdown Values
  var selectedTieUp = 'Label1'.obs;
  var selectedDestination = 'Label1'.obs;
  var selectedAir1 = 'Label1'.obs;
  var selectedAir2 = 'Label1'.obs;
  var selectedAir3 = 'Label1'.obs;
  var selectedAirR1 = 'Label1'.obs;
  var selectedAirR2 = 'Label1'.obs;
  var selectedAirR3 = 'Label1'.obs;

  // Dropdown Items
  final List<String> dropdownItems = ['Label1', 'Label2', 'Label3'];

  // Save
  void onSaveClicked() {
    Get.back();
  }

  // Clear form
  void clearForm() {
    marketController.clear();
    cx1Controller.clear();
    cx2Controller.clear();
    cx3Controller.clear();
    cx1RbdController.clear();
    cx2RbdController.clear();
    cx3RbdController.clear();
    remarksController.clear();
    selectedTieUp.value = 'Label1';
    selectedDestination.value = 'Label1';
    selectedAir1.value = 'Label1';
    selectedAir2.value = 'Label1';
    selectedAir3.value = 'Label1';
    selectedAirR1.value = 'Label1';
    selectedAirR2.value = 'Label1';
    selectedAirR3.value = 'Label1';
  }

  @override
  void onClose() {
    marketController.dispose();
    cx1Controller.dispose();
    cx2Controller.dispose();
    cx3Controller.dispose();
    cx1RbdController.dispose();
    cx2RbdController.dispose();
    cx3RbdController.dispose();
    remarksController.dispose();
    super.onClose();
  }
}