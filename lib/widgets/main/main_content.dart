import 'package:accounts/controllers/state/main_content_controller.dart';
import 'package:accounts/widgets/dialogueBoxWidget/AirLinePassDialog.dart';
import 'package:accounts/widgets/dialogueBoxWidget/AirlineContactsDialog.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class MainContent extends StatelessWidget {
  MainContent({Key? key}) : super(key: key);

  final MainContentController controller = Get.put(MainContentController());

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(24),
      decoration: BoxDecoration(
        color: Color(0xFFE7ECF2),
        borderRadius: BorderRadius.circular(24),
      ),
      child: SingleChildScrollView(
        child: Column(
          children: [
            // Row 1: Airlines Contacts
            _buildFormRow(
              leftButton: _buildOutlinedButton(
                'Add Airlines Contact',
                () => showAirlineContactsDialog(), // Opens dialog on click
              ),
              centerText: 'Airlines Contacts',
              dropdown: _buildDropdown(controller.selectedAirlinesLabel, ['Label1', 'Label2', 'Label3']),
              rightButton: _buildOutlinedButton('Get Airlines Contact', controller.getAirlinesContact),
            ),
            
            SizedBox(height: 16),
            
            // Row 2: Airlines Credentials
            _buildFormRow(
              leftButton: _buildOutlinedButton('Add Airline Credentials', 
              () => showAirlinePassDialog(),
              ),
              centerText: 'Airlines Credentials',
              dropdown: _buildDropdown(controller.selectedCredentialsLabel, ['Label1', 'Label2', 'Label3']),
              rightButton: _buildOutlinedButton('Get Airlines Credentials', controller.getAirlinesCredentials),
            ),
            
            SizedBox(height: 16),
            
            // Row 3: GDS Credentials
            _buildFormRow(
              leftButton: _buildOutlinedButton('Add GDS Credentials', controller.addGDSCredentials),
              centerText: 'GDS Credentials',
              dropdown: _buildDropdown(controller.selectedGDSLabel, ['Label1', 'Label2', 'Label3']),
              rightButton: _buildOutlinedButton('Get GDS Credentials', controller.getGDSCredentials),
            ),
            
            SizedBox(height: 16),
            
            // Row 4: Bank Details
            _buildFormRow(
              leftButton: _buildOutlinedButton('Add Bank Details', controller.addBankDetails),
              centerText: 'Select Bank Info',
              dropdown: _buildDropdown(controller.selectedBankLabel, ['Label1', 'Label2', 'Label3']),
              rightButton: _buildOutlinedButton('Get Bank Details', controller.getBankDetails),
            ),
            
            SizedBox(height: 16),
            
            // Row 5: Routes
            _buildFormRow(
              leftButton: _buildOutlinedButton('Add Routes', controller.addRoutes),
              centerText: 'Select Sector',
              dropdown: _buildDropdown(controller.selectedRouteLabel, ['Label1', 'Label2', 'Label3']),
              rightButton: _buildOutlinedButton('Get Route Details', controller.getRouteDetails),
            ),
            
            SizedBox(height: 16),
            
            // Row 6: Ledger
            _buildFormRow(
              leftButton: _buildOutlinedButton('Create Ledger', controller.createLedger),
              centerText: 'Select Ledger',
              dropdown: _buildDropdown(controller.selectedLedgerLabel, ['Label1', 'Label2', 'Label3']),
              rightButton: _buildOutlinedButton('Get Ledger Info', controller.getLedgerInfo),
            ),
            
            SizedBox(height: 16),
            
            // Row 7: Supplier
            _buildFormRow(
              leftButton: _buildOutlinedButton('Create Supplier', controller.createSupplier),
              centerText: 'Select Supplier',
              dropdown: _buildDropdown(controller.selectedSupplierLabel, ['Label1', 'Label2', 'Label3']),
              rightButton: _buildOutlinedButton('Get Supplier Info', controller.getSupplierInfo),
            ),
            
            SizedBox(height: 16),
            
            // Row 8: Vendor
            _buildFormRow(
              leftButton: null,
              centerText: 'Select Vendor',
              dropdown: _buildDropdown(controller.selectedVendorLabel, ['Label1', 'Label2', 'Label3']),
              rightButton: _buildOutlinedButton('Get Vendor Info', controller.getVendorInfo),
            ),
            
            SizedBox(height: 16),
            
            // Row 9: Airline
            _buildFormRow(
              leftButton: null,
              centerText: 'Select Airline',
              dropdown: _buildDropdown(controller.selectedAirlineLabel, ['Label1', 'Label2', 'Label3']),
              rightButton: _buildOutlinedButton('View Commission', controller.viewCommission),
            ),
            
            SizedBox(height: 16),
            
            // Row 10: Create New Group
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(width: 180),
                Expanded(
                  child: _buildDropdown(controller.selectedGroupLabel, ['Label1', 'Label2', 'Label3']),
                ),
                SizedBox(width: 20),
                SizedBox(
                  width: 180,
                  child: _buildOutlinedButton('Create New Group', controller.createNewGroup),
                ),
                SizedBox(width: 180),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildFormRow({
    Widget? leftButton,
    required String centerText,
    required Widget dropdown,  
    required Widget rightButton,
  }) {
    return Row(
      children: [
        // Left button or spacer
        SizedBox(width: 200, child: leftButton ?? SizedBox.shrink()),
        SizedBox(width: 260),

        // Center text
        SizedBox(
          width: 150,
          child: Text(
            centerText,
            style: TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.w500,
              color: Colors.black87,
            ),
          ),
        ),
        SizedBox(width: 20),

        // Dropdown
        Expanded(child: dropdown),  
        SizedBox(width: 20),  
        
        // Right button
        SizedBox(width: 180, child: rightButton),
      ],
    );
  }

  Widget _buildOutlinedButton(String label, VoidCallback onPressed) {
    return OutlinedButton(
      onPressed: onPressed,
      style: OutlinedButton.styleFrom(
        padding: EdgeInsets.symmetric(horizontal: 16, vertical: 12),
        side: BorderSide(color: Color(0xFF113C7C), width: 0.5),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(6),
        ),
        backgroundColor: Colors.white,
      ),
      child: Text(
        label,
        style: TextStyle(
          fontSize: 13,
          fontWeight: FontWeight.w600,  
          color: Color(0xFF113C7C),
        ),
      ),
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
            icon: Icon(Icons.arrow_drop_down, color: Colors.black54),
            style: TextStyle(
              fontSize: 14,
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
}