import 'package:accounts/controllers/dialogController/route_entry_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class RouteEntryDialog extends StatelessWidget {
  RouteEntryDialog({Key? key}) : super(key: key);

  final RouteEntryController controller = Get.put(RouteEntryController());

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
                    'Route Entry Form',
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.w700,
                      color: Color(0xFFFF8B3D),
                    ),
                  ),
                ),
              ),
              SizedBox(height: 20),
              //tie_up
              _buildFormField(label: 'Tie_Up', 
              child: _buildDropdown(controller.selectedTieUp),
              ),
              SizedBox(height: 12),

              //market
              _buildFormField(label: 'Market', 
              child: _buildTextField(controller.marketController),
              ),
              SizedBox(height: 12),

              //destination
              _buildFormField(label: 'Destination', child: _buildDropdown(controller.selectedDestination)),
              SizedBox(height: 12),

              // Air 1
              _buildFormField(
                label: 'Air 1',
                child: _buildDropdown(controller.selectedAir1),
              ),

              SizedBox(height: 12),

              // CX1
              _buildFormField(
                label: 'CX1',
                child: _buildTextField(controller.cx1Controller),
              ),

              SizedBox(height: 12),

              // Air 2
              _buildFormField(
                label: 'Air 2',
                child: _buildDropdown(controller.selectedAir2),
              ),

              SizedBox(height: 12),

              // CX2
              _buildFormField(
                label: 'CX2',
                child: _buildTextField(controller.cx2Controller),
              ),

              SizedBox(height: 12),

              // Air 3
              _buildFormField(
                label: 'Air 3',
                child: _buildDropdown(controller.selectedAir3),
              ),

              SizedBox(height: 12),

              // CX3
              _buildFormField(
                label: 'CX3',
                child: _buildTextField(controller.cx3Controller),
              ),

              SizedBox(height: 12),

              // AirR1
              _buildFormField(
                label: 'AirR1',
                child: _buildDropdown(controller.selectedAirR1),
              ),

              SizedBox(height: 12),

              // CX1-RBD
              _buildFormField(
                label: 'CX1-RBD',
                child: _buildTextField(controller.cx1RbdController),
              ),

              SizedBox(height: 12),

              // AirR2
              _buildFormField(
                label: 'AirR2',
                child: _buildDropdown(controller.selectedAirR2),
              ),

              SizedBox(height: 12),

              // CX2-RBD
              _buildFormField(
                label: 'CX2-RBD',
                child: _buildTextField(controller.cx2RbdController),
              ),

              SizedBox(height: 12),

              // AirR3
              _buildFormField(
                label: 'AirR3',
                child: _buildDropdown(controller.selectedAirR3),
              ),

              SizedBox(height: 12),

              // CX3-RBD
              _buildFormField(
                label: 'CX3-RBD',
                child: _buildTextField(controller.cx3RbdController),
              ),

              SizedBox(height: 12),

              // Remarks
              _buildFormField(
                label: 'Remarks',
                child: _buildTextField(controller.remarksController),
              ),

              SizedBox(height: 24),

              // Save Button
              Align(
                alignment: Alignment.centerRight,
                child: ElevatedButton(
                  onPressed: controller.onSaveClicked,
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Color(0xFF2563EB),
                    foregroundColor: Colors.white,
                    padding: EdgeInsets.symmetric(horizontal: 32, vertical: 12),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(6),
                    ),
                    elevation: 0,
                  ),
                  child: Text(
                    'Save',
                    style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
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
          width: 90,
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
            icon: Icon(Icons.arrow_drop_down, color: Colors.black, size: 20),
            style: TextStyle(
              fontSize: 13,
              fontWeight: .w500,
              color: Colors.black,
            ),
            items: controller.dropdownItems.map((String value) {
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
}


void showRouteEntryDialog() {
  Get.dialog(RouteEntryDialog(), barrierDismissible: true);
}
