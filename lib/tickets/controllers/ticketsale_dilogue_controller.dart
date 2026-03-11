import 'package:flutter/material.dart';
import 'package:get/get.dart';

class TicketSaleDialogController extends GetxController {
  // text controllers
  final TextEditingController pnrController = TextEditingController();
  final TextEditingController netFareController = TextEditingController();
  final TextEditingController salesFareController = TextEditingController();
  final TextEditingController ticketNumberController = TextEditingController();
  final TextEditingController discountController = TextEditingController();
  final TextEditingController remarksController = TextEditingController();

  // dropdown values
  var selectedTransactionDate = 'New Ticket'.obs;
  var selectedGender = 'Male'.obs;
  var selectedBilling = 'Yes'.obs;
  var selectedTicketStatus = 'Issued'.obs;
  var selectedPayamentStatus = 'Settled'.obs;

  // dropdownn items
  final List<String> transactionDates = ['New Ticket', 'Today', 'Yesterday'];
  final List<String> genders = ['Male', 'Female', 'Other'];
  final List<String> billingOptions = ['Yes', 'No'];
  final List<String> ticketStatuses = ['Issued', 'Cancelled', 'Exchange', 'Refund', 'Void'];
  final List<String> payamentStatuses = ['Settled', 'Due', 'Pending'];

  // onclosing
  void onCloseClicked() {
    Get.back();
  }

  // saving
  void onSaveClicked() {
    if (pnrController.text.isEmpty) {
      return;
    }

    Get.back();
  }

  // clearing form
  void clearForm() {
    pnrController.clear();
    netFareController.clear();
    salesFareController.clear();
    ticketNumberController.clear();
    discountController.clear();
    remarksController.clear();
    selectedTransactionDate.value = 'New Ticket';
    selectedGender.value = 'Male';
    selectedBilling.value = 'Yes';
    selectedTicketStatus.value = 'Issued';
    selectedPayamentStatus.value = 'Settled';
  }

  @override
  void onClose() {
    pnrController.dispose();
    netFareController.dispose();
    salesFareController.dispose();
    ticketNumberController.dispose();
    discountController.dispose();
    remarksController.dispose();
    super.onClose();
  }
}