import 'package:get/get.dart';

class MainContentController extends GetxController {
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
    print('Add Airlines Contact clicked');
  }

  void getAirlinesContact() {
    print('Get Airlines Contact clicked');
  }

  void addAirlineCredentials() {
    print('Add Airline Credentials clicked');
  }

  void getAirlinesCredentials() {
    print('Get Airlines Credentials clicked');
  }

  void addGDSCredentials() {
    print('Add GDS Credentials clicked');
  }

  void getGDSCredentials() {
    print('Get GDS Credentials clicked');
  }

  void addBankDetails() {
    print('Add Bank Details clicked');
  }

  void getBankDetails() {
    print('Get Bank Details clicked');
  }

  void addRoutes() {
    print('Add Routes clicked');
  }

  void getRouteDetails() {
    print('Get Route Details clicked');
  }

  void createLedger() {
    print('Create Ledger clicked');
  }

  void getLedgerInfo() {
    print('Get Ledger Info clicked');
  }

  void createSupplier() {
    print('Create Supplier clicked');
  }

  void getSupplierInfo() {
    print('Get Supplier Info clicked');
  }

  void getVendorInfo() {
    print('Get Vendor Info clicked');
  }

  void viewCommission() {
    print('View Commission clicked');
  }

  void createNewGroup() {
    print('Create New Group clicked');
  }
}