import 'package:get/get.dart';

class SidebarController extends GetxController {
  var selectedMenuItem = 'Receipt'.obs;

  void selectMenuItem(String menuItem) {
    selectedMenuItem.value = menuItem;
  }
}