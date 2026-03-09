import 'package:accounts/acc.entry/controllers/dialogController/create_ledger_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CreateLedgerDialog extends StatelessWidget {
  CreateLedgerDialog({Key? key}) : super(key: key);

  final CreateLedgerController controller = Get.put(CreateLedgerController());

  @override
  Widget build(BuildContext context) {
    return Dialog(
      shape: RoundedRectangleBorder(borderRadius: .circular(12)),
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
                    'Create Ledger',
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.w700,
                      color: Color(0xFFFF8B3D),
                    ),
                  ),
                ),
              ),
              SizedBox(height: 20),

              //ledger group
            _buildFormField(
                label: 'Ledger Group',
                child: _buildDropdown(controller.selectedLedgerGroup),
              ),

              SizedBox(height: 12),

              // Category
              _buildFormField(
                label: 'Category',
                child: _buildDropdown(controller.selectedCategory),
              ),

              SizedBox(height: 12),

              // Ledger Name
              _buildFormField(
                label: 'Ledger Name',
                child: _buildTextField(controller.ledgerNameController),
              ),

              SizedBox(height: 12),

              // Address
              _buildFormField(
                label: 'Address',
                child: _buildTextField(controller.addressController),
              ),

              SizedBox(height: 12),

              // Mobile1
              _buildFormField(
                label: 'Mobile1',
                child: _buildTextField(controller.mobile1Controller),
              ),

              SizedBox(height: 12),

              // Mobile2
              _buildFormField(
                label: 'Mobile2',
                child: _buildTextField(controller.mobile2Controller),
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

              // Citizenship No
              _buildFormField(
                label: 'Citizenship No',
                child: _buildTextField(controller.citizenshipNoController),
              ),

              SizedBox(height: 12),

              // Father's Name
              _buildFormField(
                label: "Father's Name",
                child: _buildTextField(controller.fathersNameController),
              ),

              SizedBox(height: 12),

              // Citizenship's DOI
              _buildFormField(
                label: "Citizenship's DOI",
                child: _buildTextField(controller.citizenshipDoiController),
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
                    label: 'Close',
                    color: Colors.white,
                    textColor: Color(0xFF2563EB),
                    onPressed: controller.onCloseClicked,
                  ),
                  SizedBox(width: 8),
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

void showCreateLedgerDialog() {
  Get.dialog(CreateLedgerDialog(), barrierDismissible: true);
}
