import 'package:accounts/controllers/sidebarController.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';


class CustomSidebar extends StatelessWidget {
  CustomSidebar({Key? key}) : super(key: key);

  final List<String> menuItems = [
    'Receipt',
    'Payment',
    'Purchase',
    'Purchase Return',
    'Debit Note',
    'Credit Note',
    'Sales',
    'Sales Return',
    'Journal',
    'Contra',
    'Receipts',
    'Debit Notes',
    'Credit Notes',
  ];

  @override
  Widget build(BuildContext context) {
    final SidebarController controller = Get.put(SidebarController(), permanent: false);
    
    return Container(
      width: 135,
      child: Column(
        children: [
          // Top orange curve
          Container(
            height: 20,
            margin: EdgeInsets.fromLTRB(10, 10, 10, 0),
            decoration: BoxDecoration(
              color: Color(0xFFFF8B3D),
              borderRadius: BorderRadius.vertical(
                top: Radius.circular(50),
              ),
            ),
          ),
          
          // Menu items with side borders
          Expanded(
            child: Container(
              margin: EdgeInsets.symmetric(horizontal: 10),
              decoration: BoxDecoration(
                border: Border(
                  left: BorderSide(color: Color(0xFFE5E7EB), width: 1),
                  right: BorderSide(color: Color(0xFFE5E7EB), width: 1),
                ),
              ),
              child: GetBuilder<SidebarController>(
                init: controller,
                builder: (ctrl) {
                  return ListView.builder(
                    padding: EdgeInsets.symmetric(vertical: 8, horizontal: 8),
                    itemCount: menuItems.length,
                    itemBuilder: (context, index) {
                      final item = menuItems[index];
                      final isSelected = ctrl.selectedMenuItem.value == item;
                      
                      return _buildMenuItem(
                        label: item,
                        isSelected: isSelected,
                        onTap: () => ctrl.selectMenuItem(item),
                      );
                    },
                  );
                },
              ),
            ),
          ),
          
          // Bottom orange curve
          Container(
            height: 20,
            margin: EdgeInsets.fromLTRB(10, 0, 10, 10),
            decoration: BoxDecoration(
              color: Color(0xFFFF8B3D),
              borderRadius: BorderRadius.vertical(
                bottom: Radius.circular(50),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildMenuItem({
    required String label,
    required bool isSelected,
    required VoidCallback onTap,
  }) {
    return StatefulBuilder(
      builder: (context, setState) {
        bool isHovering = false;
        
        return MouseRegion(
          cursor: SystemMouseCursors.click,
          onEnter: (_) => setState(() => isHovering = true),
          onExit: (_) => setState(() => isHovering = false),
          child: InkWell(
            onTap: onTap,
            child: Container(
              padding: EdgeInsets.symmetric(horizontal: 8, vertical: 10),
              margin: EdgeInsets.symmetric(vertical: 1),
              decoration: BoxDecoration(
                color: isSelected 
                    ? Color(0xFFF3F4F6) 
                    : isHovering 
                        ? Color(0xFFF9FAFB) 
                        : Colors.transparent,
                borderRadius: BorderRadius.circular(4),
              ),
              child: Text(
                label,
                style: TextStyle(
                  fontSize: 13,
                  fontWeight: isSelected ? FontWeight.w600 : FontWeight.w500,
                  color: Colors.black87,
                  height: 1.3,
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}