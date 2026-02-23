import 'package:accounts/controllers/dialogController/gdspassController.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class GdsPassDialog extends StatelessWidget {
  GdsPassDialog({Key? key}) : super(key: key);

  final GdsPassController controller = Get.put(GdsPassController());

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
                  'GDS Pass. Entry Form',
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.w700,
                    color: Color(0xFFFF8B3D),
                  ),
                ),
              ),
            ),
            SizedBox(height: 20),

            //gds dropdown
            _buildFormField(label: 'GDS', child: _buildDropdown(
              controller.selectedGds,
              controller.gdsList,
              ),
            ),
            SizedBox(height: 12),

            //username
            _buildFormField(label: 'User Name', 
            child: _buildTextField(
              controller.userNameController,
              ),
            ),
            SizedBox(height: 12),

            //OID_PCC
            _buildFormField(label: 'OID_PCC', 
            child: _buildTextField(controller.oidPccController),
            ),
            SizedBox(height: 12),

            //userId
            _buildFormField(label: 'UserId', 
            child: _buildTextField(controller.userIdController),
            ),
            SizedBox(height: 12),

            //password
            _buildFormField(label: 'Password', 
            child: _buildTextField(controller.passwordController, isPassword: true),
            ),
            SizedBox(height: 12),

            //Decode
            _buildFormField(label: 'Dcode', 
            child: _buildTextField(controller.dcodeController),
            ),
            SizedBox(height: 12),

            //LNIATA
            _buildFormField(label: 'LNIATA', 
            child: _buildTextField(controller.lniataController),
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

  Widget _buildTextField(
    TextEditingController controller, {
    bool isPassword = false,
  }) {
    return Container(
      height: 40,
      child: TextField(
        controller: controller,
        obscureText: isPassword,
        style: TextStyle(fontSize: 13),
        decoration: InputDecoration(
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

void showGdsPassDialog() {
  Get.dialog(GdsPassDialog(), barrierDismissible: true);
}
