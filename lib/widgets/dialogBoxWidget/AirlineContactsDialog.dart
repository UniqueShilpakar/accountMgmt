import 'package:accounts/controllers/dialogController/airlinecontactsController.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AirlineContactsDialog extends StatelessWidget {
  AirlineContactsDialog({Key? key}) : super(key: key);

  final AirlineContactsDialogController controller = Get.put(
    AirlineContactsDialogController(),
  );

  @override
  Widget build(BuildContext context) {
    return Dialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
      ),
      child: Container(
        width: 600,
        padding: EdgeInsets.all(24),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(12),
          border: Border(
            left: BorderSide(color: Color(0xFFF7A032), width: 2.5),
            bottom: BorderSide(color: Color(0xFFF7A032), width: 2.5),
          ),
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min, // Fixed: was .min
          children: [
            // Header
            Container(
              padding: EdgeInsets.symmetric(vertical: 12),
              decoration: BoxDecoration(
                color: Color(0xFF1E3A5F),
                borderRadius: BorderRadius.circular(8),
              ),
              child: Center(
                child: Text(
                  'Airline Contacts Entry Form',
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.w700,
                    color: Color(0xFFFF8B3D),
                  ),
                ),
              ),
            ),
            SizedBox(height: 20),

            // Form fields
            _buildFormField(
              label: 'Airline Code',
              child: _buildDropdown(controller.selectedAirlineCode, controller.airlineCodes),
            ),

            SizedBox(height: 12),

            _buildFormField(
              label: 'Airline Name',
              child: _buildDropdown(controller.selectedAirlineName, controller.airlineNames),
            ),

            SizedBox(height: 12),

            _buildFormField(
              label: 'Department',
              child: _buildDropdown(controller.selectedDepartment, controller.departments),
            ),

            SizedBox(height: 12),

            _buildFormField(
              label: 'Hierarchy',
              child: _buildDropdown(controller.selectedHierarchy, controller.hierarchies),
            ),

            SizedBox(height: 12),

            _buildFormField(
              label: 'Contact Name',
              child: _buildTextField(controller.contactNameController, ''),
            ),

            SizedBox(height: 12),

            _buildFormField(
              label: 'Email',
              child: _buildTextField(controller.emailController, ''),
            ),

            SizedBox(height: 12),

            _buildFormField(
              label: 'Mobile#',
              child: _buildTextField(controller.mobileController, ''),
            ),

            SizedBox(height: 12),

            _buildFormField(
              label: 'Phone#',
              child: _buildTextField(controller.phoneController, ''),
            ),

            SizedBox(height: 12),

            _buildFormField(
              label: 'WhatsApp',
              child: _buildTextField(controller.whatsappController, ''),
            ),

            SizedBox(height: 12),

            _buildFormField(
              label: 'Remarks',
              child: _buildTextField(controller.remarksController, ''),
            ),

            SizedBox(height: 24),

            // Action Buttons
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                // Navigation Buttons
                Row(
                  children: [
                    _buildNavigationButton(
                      icon: Icons.arrow_back,
                      label: 'First',
                      color: Color(0xFFFF8B3D),
                      onPressed: controller.onFirstClicked,
                    ),
                    SizedBox(width: 8),
                    _buildNavigationButton(
                      icon: Icons.arrow_back,
                      label: 'Last',
                      color: Color(0xFFFF8B3D),
                      onPressed: controller.onLastClicked,
                    ),
                    SizedBox(width: 8),
                    _buildNavigationButton(
                      icon: Icons.arrow_forward,
                      label: 'Next',
                      color: Color(0xFFFF8B3D),
                      iconRight: true,
                      onPressed: controller.onNextClicked,
                    ),
                  ],
                ),

                // Action Buttons
                Row(
                  children: [
                    _buildActionButton(
                      label: 'Delete',
                      color: Colors.white,
                      textColor: Color(0xFF2563EB),
                      onPressed: controller.onDeleteClicked,
                    ),
                    SizedBox(width: 8),
                    _buildActionButton(
                      label: 'Save',
                      color: Color(0xFF2563EB),
                      textColor: Colors.white,
                      onPressed: controller.onSaveClicked,
                    ),
                  ],
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildFormField({required String label, required Widget child}) {
    return Row(
      children: [
        SizedBox(
          width: 100,
          child: Text(
            label,
            style: TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.w500,
              color: Colors.black87,
            ),
          ),
        ),
        SizedBox(width: 12),
        Expanded(child: child),
      ],
    );
  }

  Widget _buildDropdown(RxString selectedValue, List<String> items) {
    return Obx(
      () => Container(
        padding: EdgeInsets.symmetric(horizontal: 12),
        decoration: BoxDecoration(
          color: Colors.white,
          border: Border.all(color: Color(0xFFD1D5DB)),
          borderRadius: BorderRadius.circular(6),
        ),
        child: DropdownButtonHideUnderline(
          child: DropdownButton<String>(
            value: selectedValue.value,
            isExpanded: true,
            icon: Icon(Icons.arrow_drop_down, color: Colors.black54, size: 20),
            style: TextStyle(
              fontSize: 13,
              fontWeight: FontWeight.w500,
              color: Colors.black87,
            ),
            items: items.map((String value) {
              return DropdownMenuItem<String>(
                value: value,
                child: Text(value),
              );
            }).toList(),
            onChanged: (String? newValue) {
              if (newValue != null) {
                selectedValue.value = newValue;
              }
            },
          ),
        ),
      ),
    );
  }

  Widget _buildTextField(TextEditingController controller, String hint) {
    return Container(
      height: 40,
      child: TextField(
        controller: controller,
        style: TextStyle(fontSize: 13),
        decoration: InputDecoration(
          hintText: hint,
          contentPadding: EdgeInsets.symmetric(horizontal: 12, vertical: 8),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(6),
            borderSide: BorderSide(color: Color(0xFFD1D5DB)),
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(6),
            borderSide: BorderSide(color: Color(0xFFD1D5DB)),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(6),
            borderSide: BorderSide(color: Color(0xFF2563EB), width: 1.5),
          ),
        ),
      ),
    );
  }

  Widget _buildNavigationButton({
    required IconData icon,
    required String label,
    required Color color,
    required VoidCallback onPressed,
    bool iconRight = false,
  }) {
    return ElevatedButton.icon(
      onPressed: onPressed,
      icon: iconRight ? SizedBox.shrink() : Icon(icon, size: 16),
      label: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(label),
          if (iconRight) SizedBox(width: 4),
          if (iconRight) Icon(icon, size: 16),
        ],
      ),
      style: ElevatedButton.styleFrom(
        backgroundColor: color,
        foregroundColor: Colors.white,
        padding: EdgeInsets.symmetric(horizontal: 12, vertical: 8),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(6),
        ),
        elevation: 0,
      ),
    );
  }

  Widget _buildActionButton({
    required String label,
    required Color color,
    required Color textColor,
    required VoidCallback onPressed,
  }) {
    return ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
        backgroundColor: color,
        foregroundColor: textColor,
        padding: EdgeInsets.symmetric(horizontal: 24, vertical: 12),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(6),
          side: color == Colors.white
              ? BorderSide(color: Color(0xFF2563EB), width: 1.5)
              : BorderSide.none,
        ),
        elevation: 0,
      ),
      child: Text(
        label,
        style: TextStyle(
          fontSize: 14,
          fontWeight: FontWeight.w600,
        ),
      ),
    );
  }
}

// Function to show the dialog
void showAirlineContactsDialog() {
  Get.dialog(
    AirlineContactsDialog(),
    barrierDismissible: true,
  );
}