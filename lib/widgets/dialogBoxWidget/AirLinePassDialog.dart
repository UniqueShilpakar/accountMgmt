import 'package:accounts/controllers/dialogController/Aairlinepasscontroller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AirLinePassDialog extends StatelessWidget {
  AirLinePassDialog({Key? key}) : super(key: key);

  final AirlinePassController controller = Get.put(AirlinePassController());

  @override
  Widget build(BuildContext context) {
    return Dialog(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      child: Container(
        width: 420,
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
          mainAxisSize: .min,
          children: [
            //header
            Container(
              width: double.infinity,
              padding: EdgeInsets.symmetric(vertical: 12),
              decoration: BoxDecoration(
                color: Color(0xFF1E3A5F),
                borderRadius: BorderRadius.circular(8),
              ),
              child: Center(
                child: Text(
                  'Airline Pass. Entry Form',
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.w700,
                    color: Color(0xFFFF8B3D),
                  ),
                ),
              ),
            ),
            SizedBox(height: 20),

            // Organization Dropdown
            _buildFormField(
              label: 'Organization',
              child: _buildDropdown(
                controller.selectedOrganization,
                controller.organizations,
              ),
            ),

            SizedBox(height: 12),

            // UserID
            _buildFormField(
              label: 'UserID',
              child: _buildTextField(controller.userIdController),
            ),

            SizedBox(height: 12),

            // Password
            _buildFormField(
              label: 'Password',
              child: _buildTextField(
                controller.passwordController,
                isPassword: true,
              ),
            ),

            SizedBox(height: 12),

            // Dcode
            _buildFormField(
              label: 'Dcode',
              child: _buildTextField(controller.dcodeController),
            ),

            SizedBox(height: 12),

            // URL
            _buildFormField(
              label: 'URL',
              child: _buildTextField(controller.urlController),
            ),

            SizedBox(height: 12),

            // Expiry Date
            _buildFormField(
              label: 'Expiry Date',
              child: _buildTextField(controller.expiryDateController),
            ),

            SizedBox(height: 12),

            // PWID
            _buildFormField(
              label: 'PWID',
              child: _buildTextField(controller.pwidController, hint: '(New)',),
            ),

            SizedBox(height: 24),

            // Action Buttons
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
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
              fontWeight: .w500,
              color: Colors.black,
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
          borderRadius: .circular(6),
        ),
        child: DropdownButtonHideUnderline(
          child: DropdownButton(
            value: selectedValue.value,
            isExpanded: true,
            //used icon for now
            // ---------------------------------
            icon: Icon(Icons.arrow_drop_down, color: Colors.black, size: 20),
            style: TextStyle(
              fontSize: 13,
              fontWeight: .w500,
              color: Colors.black,
            ),
            items: items.map((String value) {
              return DropdownMenuItem<String>(value: value, child: Text(value));
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
  Widget _buildTextField(
    TextEditingController controller, {
    String hint = '',
    bool isPassword = false,
  }) {
    return Container(
      height: 40,
      child: TextField(
        controller: controller,
        obscureText: isPassword,
        style: TextStyle(fontSize: 13),
        decoration: InputDecoration(
          hintText: hint,
          hintStyle: TextStyle(color: Colors.black54, fontSize: 13),
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

void showAirlinePassDialog() {
  Get.dialog(AirLinePassDialog(), barrierDismissible: true);
}
