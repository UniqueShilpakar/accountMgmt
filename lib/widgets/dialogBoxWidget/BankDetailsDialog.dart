import 'package:accounts/controllers/dialogController/BankdetailController.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class BankDetailsDialog extends StatelessWidget {
  BankDetailsDialog({Key? key}) : super(key: key);

  final BankDetailsController controller = Get.put(BankDetailsController());

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
                  'Bank Details Entry Form',
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: .w700,
                    color: Color(0xFFFF8B3D),
                  ),
                ),
              ),
            ),
            SizedBox(height: 20),

            //Creaditor Name DropDown
            _buildFormField(
              label: 'Creditor Name',
              child: _buildDropdown(
                controller.selectedCreditorName,
                controller.creditorNames,
              ),
            ),

            SizedBox(height: 12),
            //bank name
            _buildFormField(
              label: 'Bank Name',
              child: _buildTextField(controller.bankNameController),
            ),

            SizedBox(height: 12),

            // Account Name
            _buildFormField(
              label: 'Account Name',
              child: _buildTextField(controller.accountNameController),
            ),

            SizedBox(height: 12),

            // Account No
            _buildFormField(
              label: 'Account No',
              child: _buildTextField(controller.accountNoController),
            ),

            SizedBox(height: 12),

            // Branch
            _buildFormField(
              label: 'Branch',
              child: _buildTextField(controller.branchController),
            ),

            SizedBox(height: 12),

            // Remarks
            _buildFormField(
              label: 'Remarks',
              child: _buildTextField(controller.remarksController),
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
          width: 110,
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
   Widget _buildTextField(TextEditingController controller) {
    return Container(
      height: 40,
      child: TextField(
        controller: controller,
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

void showBankDetailsDialog() {
  Get.dialog(BankDetailsDialog(), barrierDismissible: true);
}
