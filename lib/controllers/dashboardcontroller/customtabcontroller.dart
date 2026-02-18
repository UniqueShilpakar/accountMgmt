import 'package:get/get.dart';

class CustomTabsController extends GetxController {
  var selectedTabIndex = 0.obs;
  void changeTab(int index) {
    selectedTabIndex.value = index;
  }

  String get currentTab {
    switch (selectedTabIndex) {
      case 0:
        return 'User Management';
      case 1:
        return 'Tickets';
      case 2:
        return 'Acc.Entry';
      case 3:
        return 'Credits';
      case 4:
        return 'Cr sales';
      case 5:
        return 'Reissue';
      case 6:
        return 'Refunds';
      case 7:
        return 'DateX';
      case 8:
        return 'L/P Qry';
      case 9:
        return 'Modify';
      case 10:
        return 'Invoice';
      case 11:
        return 'Statements';
      default:
        return 'Accounts';
    }
  }
}
