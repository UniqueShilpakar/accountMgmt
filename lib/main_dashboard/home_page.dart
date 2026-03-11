import 'package:accounts/acc.entry/Appbar/custom_appbar.dart';
import 'package:accounts/acc.entry/Appbar/custom_tabs.dart';
import 'package:accounts/acc.entry/controllers/account_dashboard_controller/custom_tab_controller.dart';
import 'package:accounts/acc.entry/widgets/Account_section_content/custom_sidebar.dart';
import 'package:accounts/acc.entry/widgets/Account_section_content/main_account_content.dart';
import 'package:accounts/tickets/widgets/ticket_Sales_page.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomePage extends StatelessWidget {
  HomePage({Key? key}) : super(key: key);

  // Access the controllers
  final CustomTabsController tabsController = Get.put(CustomTabsController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF5F7FA),
      appBar: const CustomAppBar(),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CustomTabs(), // Tabs stay constant
            const SizedBox(height: 15),

            // Content changes based on selected tab
            Expanded(
              child: Obx(
                () => _getTabContent(tabsController.selectedTabIndex.value),
              ),
            ),
          ],
        ),
      ),
    );
  }

  // Returns different content based on selected tab
  Widget _getTabContent(int index) {
    switch (index) {
      case 0: // Tickets
         return TicketSalesPage();

      case 1: // Acc. Entry - WITH SIDEBAR
        return _buildLayoutWithSidebar(MainContent());

      case 2: // Credits
        return Center(
          child: Text('Credits Content', style: TextStyle(fontSize: 18)),
        );

      case 3: // Cr sales
        return Center(
          child: Text('Cr sales Content', style: TextStyle(fontSize: 18)),
        );

      case 4: // Reissue
        return Center(
          child: Text('Reissue Content', style: TextStyle(fontSize: 18)),
        );

      case 5: // Refunds
        return Center(
          child: Text('Refunds Content', style: TextStyle(fontSize: 18)),
        );

      case 6: // DateX
        return Center(
          child: Text('DateX Content', style: TextStyle(fontSize: 18)),
        );

      case 7: // L/P Qry
        return Center(
          child: Text('L/P Qry Content', style: TextStyle(fontSize: 18)),
        );

      case 8: // Modify
        return Center(
          child: Text('Modify Content', style: TextStyle(fontSize: 18)),
        );

      case 9: // Invoice
        return Center(
          child: Text('Invoice Content', style: TextStyle(fontSize: 18)),
        );

      case 10: // Statements
        return Center(
          child: Text('Statements Content', style: TextStyle(fontSize: 18)),
        );

      default:
        return Center(
          child: Text('Select a tab', style: TextStyle(fontSize: 18)),
        );
    }
  }

  // Layout with Sidebar + Content (ONLY for Acc. Entry)
  Widget _buildLayoutWithSidebar(Widget content) {
    return Row(
      children: [
        // Sidebar
        CustomSidebar(),
        const SizedBox(width: 20),

        // Main Content Area
        Expanded(child: content),
      ],
    );
  }
}
