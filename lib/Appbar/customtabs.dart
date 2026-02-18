
import 'package:accounts/controllers/dashboardcontroller/customtabcontroller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';


class CustomTabs extends StatelessWidget {
  CustomTabs({Key? key}) : super(key: key);

  final CustomTabsController controller = Get.put(CustomTabsController());

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.centerLeft,
      child: IntrinsicHeight(
        child: Container(
          width: double.infinity,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(30),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.04),
                blurRadius: 8,
                offset: const Offset(0, 2),
              ),
            ],
          ),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              // account - Large Blue Pill Button
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 16),
                decoration: const BoxDecoration(
                  color: Color(0xFF113C7C),
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(50),
                    topRight: Radius.circular(50),
                    bottomLeft: Radius.circular(50),
                    bottomRight: Radius.circular(0),
                  ),
                ),
                child: const Text(
                  'Accounts',
                  style: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w700,
                    color: Colors.white,
                  ),
                ),
              ),

              const SizedBox(width: 20),

              // User and Role Tabs
              Obx(
                () => Row(
                  children: [
                    _buildTab(
                      label: 'Tickets',
                      index: 0,
                      isSelected: controller.selectedTabIndex.value == 0,
                    ),
                    const SizedBox(width: 20),
                    _buildTab(
                      label: 'Acc. Entry',
                      index: 1,
                      isSelected: controller.selectedTabIndex.value == 1,
                    ),
                    const SizedBox(width: 20),
                    _buildTab(
                      label: 'Credits',
                      index: 2,
                      isSelected: controller.selectedTabIndex.value == 2,
                    ),
                    const SizedBox(width: 20),
                    _buildTab(
                      label: 'Cr sales',
                      index: 3,
                      isSelected: controller.selectedTabIndex.value == 3,
                    ),
                    const SizedBox(width: 20),
                    _buildTab(
                      label: 'Reissue',
                      index: 4,
                      isSelected: controller.selectedTabIndex.value == 4,
                    ),
                    const SizedBox(width: 20),
                    _buildTab(
                      label: 'Refunds',
                      index: 5,
                      isSelected: controller.selectedTabIndex.value == 5,
                    ),
                    const SizedBox(width: 20),
                    _buildTab(
                      label: 'DateX',
                      index: 6,
                      isSelected: controller.selectedTabIndex.value == 6,
                    ),
                    const SizedBox(width: 20),
                    _buildTab(
                      label: 'L/P Qry',
                      index: 7,
                      isSelected: controller.selectedTabIndex.value == 7,
                    ),
                    const SizedBox(width: 20),
                    _buildTab(
                      label: 'Modify',
                      index: 8,
                      isSelected: controller.selectedTabIndex.value == 8,
                    ),
                    const SizedBox(width: 20),
                    _buildTab(
                      label: 'Invoice',
                      index: 9,
                      isSelected: controller.selectedTabIndex.value == 9,
                    ),
                    const SizedBox(width: 20),
                    _buildTab(
                      label: 'Statements',
                      index: 10,
                      isSelected: controller.selectedTabIndex.value == 10,
                    ),
                    const SizedBox(width: 20),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildTab({
    required String label,
    required int index,
    required bool isSelected,
  }) {
    return InkWell(
      onTap: () => controller.changeTab(index),
      child: Container(
        decoration: isSelected
            ? BoxDecoration(
                gradient: const LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [
                    Color(0xFFFFFFFF), 
                    Color.fromARGB(255, 107, 138, 184), 
                  ],
                ),
                borderRadius: const BorderRadius.vertical(top: Radius.circular(8)),
              )
            : null,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
              child: Text(
                label,
                style: TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.w700,
                  color: isSelected ? Colors.black : const Color(0xFF6B7280),
                ),
              ),
            ),
            // Optional: thin bottom border for non-selected tabs
            if (!isSelected)
              Container(
                height: 1,
                color: Colors.grey.shade300,
              ),
          ],
        ),
      ),
    );
  }
}