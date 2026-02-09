import 'package:accounts/Appbar/customAppbar.dart';
import 'package:accounts/Appbar/customtabs.dart';
import 'package:accounts/controllers/customtabcontroller.dart';
import 'package:accounts/widgets/customSidebar.dart';
import 'package:accounts/widgets/main_content.dart';

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
            CustomTabs(), 
            const SizedBox(height: 15),
            // Row with sidebar and main content
            Expanded(
              child: Row(
                children: [
                  // Sidebar
                  CustomSidebar(),
                  
                  const SizedBox(width: 20),
                  
                  //Main Content Area
                  Expanded(
                    child: MainContent(),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}