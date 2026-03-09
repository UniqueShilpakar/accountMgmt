import 'package:get/get.dart';
import 'dart:developer' as developer;

class AccountContentController extends GetxController {
  // Airlines Contacts
  var airlinesContact = ''.obs;
  var selectedAirlinesLabel = 'Label1'.obs;

  // Airlines Credentials
  var airlinesCredentials = ''.obs;
  var selectedCredentialsLabel = 'Label1'.obs;

  // GDS Credentials
  var gdsCredentials = ''.obs;
  var selectedGDSLabel = 'Label1'.obs;

  // Bank Details
  var bankDetails = ''.obs;
  var selectedBankLabel = 'Label1'.obs;

  // Routes
  var routes = ''.obs;
  var selectedRouteLabel = 'Label1'.obs;

  // Ledger
  var ledger = ''.obs;
  var selectedLedgerLabel = 'Label1'.obs;

  // Supplier
  var supplier = ''.obs;
  var selectedSupplierLabel = 'Label1'.obs;

  // Vendor
  var selectedVendorLabel = 'Label1'.obs;

  // Airline
  var selectedAirlineLabel = 'Label1'.obs;

  // Group
  var selectedGroupLabel = 'Label1'.obs;

  // Methods for button actions
  void addAirlinesContact() {
    developer.log('Add Airlines Contact clicked', name: 'MainContentController');
  }

  void getAirlinesContact() {
    developer.log('Get Airlines Contact clicked', name: 'MainContentController');
  }

  void addAirlineCredentials() {
    developer.log('Add Airline Credentials clicked', name: 'MainContentController');
  }

  void getAirlinesCredentials() {
    developer.log('Get Airlines Credentials clicked', name: 'MainContentController');
  }

  void addGDSCredentials() {
    developer.log('Add GDS Credentials clicked', name: 'MainContentController');
  }

  void getGDSCredentials() {
    developer.log('Get GDS Credentials clicked', name: 'MainContentController');
  }

  void addBankDetails() {
    developer.log('Add Bank Details clicked', name: 'MainContentController');
  }

  void getBankDetails() {
    developer.log('Get Bank Details clicked', name: 'MainContentController');
  }

  void addRoutes() {
    developer.log('Add Routes clicked', name: 'MainContentController');
  }

  void getRouteDetails() {
    developer.log('Get Route Details clicked', name: 'MainContentController');
  }

  void createLedger() {
    developer.log('Create Ledger clicked', name: 'MainContentController');
  }

  void getLedgerInfo() {
    developer.log('Get Ledger Info clicked', name: 'MainContentController');
  }

  void createSupplier() {
    developer.log('Create Supplier clicked', name: 'MainContentController');
  }

  void getSupplierInfo() {
    developer.log('Get Supplier Info clicked', name: 'MainContentController');
  }

  void getVendorInfo() {
    developer.log('Get Vendor Info clicked', name: 'MainContentController');
  }

  void viewCommission() {
    developer.log('View Commission clicked', name: 'MainContentController');
  }

  void createNewGroup() {
    developer.log('Create New Group clicked', name: 'MainContentController');
  }
}