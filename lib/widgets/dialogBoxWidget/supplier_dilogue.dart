
import 'package:accounts/controllers/dialogController/supplier_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CreateSupplierDialog extends StatelessWidget {
  CreateSupplierDialog({Key? key}) : super(key: key);

  final CreateSupplierController controller = Get.put(CreateSupplierController());

  @override
  Widget build(BuildContext context) {
    return Dialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
      ),
      child: Container(
        width: 450,
        padding: EdgeInsets.all(24),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(12),
          border: Border(
            left: BorderSide(color: Color(0xFFF7A032), width: 2.5),
            bottom: BorderSide(color: Color(0xFFF7A032), width: 2.5),
          ),
        ),
        child: SingleChildScrollView(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              // Header
              Container(
                width: double.infinity,
                padding: EdgeInsets.symmetric(vertical: 12),
                decoration: BoxDecoration(
                  color: Color(0xFF1E3A5F),
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Center(
                  child: Text(
                    'Create Supplier',
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.w700,
                      color: Color(0xFFFF8B3D),
                    ),
                  ),
                ),
              ),

              SizedBox(height: 20),

              // Supplier Group
              _buildFormField(
                label: 'Supplier Group',
                child: _buildDropdown(controller.selectedSupplierGroup),
              ),

              SizedBox(height: 12),

              // Supplier Name
              _buildFormField(
                label: 'Supplier Name',
                child: _buildTextField(controller.supplierNameController),
              ),

              SizedBox(height: 12),

              // Category
              _buildFormField(
                label: 'Category',
                child: _buildDropdown(controller.selectedCategory),
              ),

              SizedBox(height: 12),

              // Address
              _buildFormField(
                label: 'Address',
                child: _buildTextField(controller.addressController),
              ),

              SizedBox(height: 12),

              // Mobile
              _buildFormField(
                label: 'Mobile',
                child: _buildTextField(controller.mobileController),
              ),

              SizedBox(height: 12),

              // Email Address
              _buildFormField(
                label: 'Email Address',
                child: _buildTextField(controller.emailController),
              ),

              SizedBox(height: 12),

              // VAT/PAN No
              _buildFormField(
                label: 'VAT/PAN No',
                child: _buildTextField(controller.vatPanController),
              ),

              SizedBox(height: 12),

              // Contact Person Name
              _buildFormField(
                label: 'Contact Person Name',
                child: _buildTextField(controller.contactPersonController),
              ),

              SizedBox(height: 12),

              // District
              _buildFormField(
                label: 'District',
                child: _buildDropdown(controller.selectedDistrict),
              ),

              SizedBox(height: 12),

              // Ledger ID
              _buildFormField(
                label: 'Ledger ID',
                child: _buildTextField(controller.ledgerIdController, hint: '(New)'),
              ),

              SizedBox(height: 24),

              // Action Buttons
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  _buildActionButton(
                    label: 'Close',
                    color: Colors.white,
                    textColor: Color(0xFF2563EB),
                    onPressed: controller.onCloseClicked,
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
      ),
    );
  }

  Widget _buildFormField({required String label, required Widget child}) {
    return Row(
      children: [
        SizedBox(
          width: 145,
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

  Widget _buildDropdown(RxString selectedValue) {
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
            items: controller.dropdownItems.map((String value) {
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

  Widget _buildTextField(TextEditingController controller, {String hint = ''}) {
    return Container(
      height: 40,
      child: TextField(
        controller: controller,
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

// Function to show the dialog
void showCreateSupplierDialog() {
  Get.dialog(
    CreateSupplierDialog(),
    barrierDismissible: true,
  );
}