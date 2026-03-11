import 'package:flutter/widgets.dart';
import 'package:get/get.dart';

class TicketSalesController extends GetxController {
  //search controller
  final TextEditingController searchController = TextEditingController();

  //pagination
  var currentPage = 1.obs;
  var totalPages = 10.obs;
  var itemsPerPage = 10.obs;

  //sample datas
  //----------------------------\\
  var tickets = <Map<String, dynamic>>[
    {
      'sn': '1',
      'date': '2025-01-15',
      'gender': 'Male',
      'pnr': 'P2025001',
      'netFares': '200000',
      'salesFare': '250000',
      'ticketNumber': 'T-1029090',
      'ticketStatus': 'Issued',
      'discount': '2500',
      'paymentStatus': 'Due',
      'invStatus': 'No',
      'remarks': 'Ok',
    },
    {
      'sn': '2',
      'date': '2025-01-26',
      'gender': 'Female',
      'pnr': 'P2025002',
      'netFares': '200000',
      'salesFare': '250000',
      'ticketNumber': 'Q-0909089',
      'ticketStatus': 'cancelled',
      'discount': '2500',
      'paymentStatus': 'pending',
      'invStatus': 'No',
      'remarks': 'Ok',
    },
    {
      'sn': '3',
      'date': '2025-02-01',
      'gender': 'Male',
      'pnr': 'P2025003',
      'netFares': '200000',
      'salesFare': '250000',
      'ticketNumber': 'E-9898976',
      'ticketStatus': 'Exchange',
      'discount': '2500',
      'paymentStatus': 'settled',
      'invStatus': 'Yes',
      'remarks': 'Ok',
    },
    {
      'sn': '4',
      'date': '2025-02-01',
      'gender': 'Female',
      'pnr': 'P2025004',
      'netFares': '200000',
      'salesFare': '250000',
      'ticketNumber': 'Q-9876545',
      'ticketStatus': 'Refund',
      'discount': '2500',
      'paymentStatus': 'settled',
      'invStatus': 'Yes',
      'remarks': 'Ok',
    },
    {
      'sn': '5',
      'date': '2025-02-05',
      'gender': 'Female',
      'pnr': 'P2025005',
      'netFares': '200000',
      'salesFare': '250000',
      'ticketNumber': 'S-1234567',
      'ticketStatus': 'Exchange',
      'discount': '2500',
      'paymentStatus': 'settled',
      'invStatus': 'Yes',
      'remarks': 'Ok',
    },
    {
      'sn': '6',
      'date': '2025-02-05',
      'gender': 'Male',
      'pnr': 'P2025006',
      'netFares': '200000',
      'salesFare': '250000',
      'ticketNumber': 'A-9876545',
      'ticketStatus': 'void',
      'discount': '2500',
      'paymentStatus': 'pending',
      'invStatus': 'No',
      'remarks': 'Ok',
    },
    {
      'sn': '7',
      'date': '2025-02-06',
      'gender': 'Female',
      'pnr': 'P2025007',
      'netFares': '200000',
      'salesFare': '250000',
      'ticketNumber': 'A-9876545',
      'ticketStatus': 'cancelled',
      'discount': '2500',
      'paymentStatus': 'settled',
      'invStatus': 'Yes',
      'remarks': 'Ok',
    },
    {
      'sn': '8',
      'date': '2025-02-06',
      'gender': 'Q2025008',
      'pnr': 'P2025008',
      'netFares': '200000',
      'salesFare': '250000',
      'ticketNumber': 'T-1029090',
      'ticketStatus': 'Issued',
      'discount': '2500',
      'paymentStatus': 'settled',
      'invStatus': 'Yes',
      'remarks': 'Ok',
    },
    {
      'sn': '9',
      'date': '2025-02-08',
      'gender': 'Female',
      'pnr': 'P2025009',
      'netFares': '200000',
      'salesFare': '250000',
      'ticketNumber': 'A-9876545',
      'ticketStatus': 'void',
      'discount': '2500',
      'paymentStatus': 'Due',
      'invStatus': 'No',
      'remarks': 'Ok',
    },
    {
      'sn': '10',
      'date': '2025-02-08',
      'gender': 'Male',
      'pnr': 'P2025010',
      'netFares': '200000',
      'salesFare': '250000',
      'ticketNumber': 'T-1029090',
      'ticketStatus': 'Issued',
      'discount': '2500',
      'paymentStatus': 'pending',
      'invStatus': 'No',
      'remarks': 'Ok',
    },
    {
      'sn': '11',
      'date': '2025-02-08',
      'gender': 'Male',
      'pnr': 'P2025010',
      'netFares': '200000',
      'salesFare': '250000',
      'ticketNumber': 'T-1029090',
      'ticketStatus': 'Issued',
      'discount': '2500',
      'paymentStatus': 'pending',
      'invStatus': 'No',
      'remarks': 'Ok',
    },
    {
      'sn': '12',
      'date': '2025-02-08',
      'gender': 'Male',
      'pnr': 'P2025010',
      'netFares': '200000',
      'salesFare': '250000',
      'ticketNumber': 'T-1029090',
      'ticketStatus': 'Issued',
      'discount': '2500',
      'paymentStatus': 'pending',
      'invStatus': 'No',
      'remarks': 'Ok',
    },
  ].obs;

  //methods
  void onSearch(String query) {
    //implementation search logic
    print('Searching for: $query');
  }
void onExport() {
    // Implement export logic here
    print('Exporting data...');
  }

  void onNewTicketSales() {
    // Implement new ticket sales logic here
    print('Opening new ticket sales form...');
  }

  void changePage(int page) {
    currentPage.value = page;
    // Load data for the selected page
  }

  void nextPage() {
    if (currentPage.value < totalPages.value) {
      currentPage.value++;
    }
  }

  void previousPage() {
    if (currentPage.value > 1) {
      currentPage.value--;
    }
  }

  @override
  void onClose() {
    searchController.dispose();
    super.onClose();
  }
}

