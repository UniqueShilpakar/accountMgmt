import 'package:accounts/tickets/controllers/ticketsale_dilogue_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class TicketSaleDilogue extends StatelessWidget {
  TicketSaleDilogue({Key? key}) : super(key: key);

  final TicketSaleDialogController controller = Get.put(
    TicketSaleDialogController(),
  );

  @override
  Widget build(BuildContext context) {
    return Dialog(
      shape: RoundedRectangleBorder(borderRadius: .circular(16)),
      child: Container(
        width: 650,
        padding: EdgeInsets.all(24),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: .circular(16),
        ),
        child: SingleChildScrollView(
          child: Column(
            mainAxisSize: .min,
            crossAxisAlignment: .start,
            children: [
              //header
              Container(
                padding: EdgeInsets.all(16),
                decoration: BoxDecoration(
                  color: Color(0xFF1E3A5F),
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Column(
                  crossAxisAlignment: .stretch,
                  children: [
                    Text(
                      'New Sale',
                      style: TextStyle(fontSize: 14, color: Colors.white),
                    ),
                    SizedBox(height: 4),
                    Text(
                      'Ticket Sale',
                      style: TextStyle(
                        fontSize: 28,
                        fontWeight: .w700,
                        color: Colors.white,
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 24),

              //forrm fields in 2 columns
              Row(
                crossAxisAlignment: .start,
                children: [
                  //leftcolumn
                  Expanded(
                    child: Column(
                      children: [
                        _buildFormField(
                          label: 'Transaction Date',
                          child: _buildDropdown(
                            controller.selectedTransactionDate,
                            controller.transactionDates,
                          ),
                        ),
                        SizedBox(height: 16),

                        _buildFormField(
                          label: 'PNR',
                          child: _buildTextField(
                            controller.pnrController,
                            '2109029',
                          ),
                        ),
                        SizedBox(height: 16),
                        _buildFormField(
                          label: 'Sales Fare',
                          child: _buildTextField(
                            controller.salesFareController,
                            '250000',
                          ),
                        ),
                        SizedBox(height: 16),
                        _buildFormField(
                          label: 'Discount',
                          child: _buildTextField(
                            controller.discountController,
                            '2500',
                          ),
                        ),
                        SizedBox(height: 16),
                        _buildFormField(
                          label: 'Ticket Status',
                          child: _buildDropdown(
                            controller.selectedTicketStatus,
                            controller.ticketStatuses,
                          ),
                        ),
                      ],
                    ),
                  ),

                  SizedBox(width: 24),

                  // right Column
                  Expanded(
                    child: Column(
                      children: [
                        _buildFormField(
                          label: 'Gender',
                          child: _buildDropdown(
                            controller.selectedGender,
                            controller.genders,
                          ),
                        ),
                        SizedBox(height: 16),
                        _buildFormField(
                          label: 'Net Fare',
                          child: _buildTextField(
                            controller.netFareController,
                            '200000',
                          ),
                        ),
                        SizedBox(height: 16),
                        _buildFormField(
                          label: 'Ticket Number',
                          child: _buildTextField(
                            controller.ticketNumberController,
                            'T1234678',
                          ),
                        ),
                        SizedBox(height: 16),
                        _buildFormField(
                          label: 'Billing',
                          child: _buildDropdown(
                            controller.selectedBilling,
                            controller.billingOptions,
                          ),
                        ),
                        SizedBox(height: 16),
                        _buildFormField(
                          label: 'Payament Status',
                          child: Row(
                            children: [
                              Expanded(
                                child: _buildDropdown(
                                  controller.selectedPayamentStatus,
                                  controller.payamentStatuses,
                                ),
                              ),
                              SizedBox(width: 8),
                              Container(
                                width: 48,
                                height: 48,
                                decoration: BoxDecoration(
                                  color: Colors.white,
                                  border: Border.all(color: Color(0xFFE5E7EB), width: 1.5),
                                  borderRadius: BorderRadius.circular(8),
                                ),
                                child: IconButton(
                                  onPressed: () {},
                                  icon: Icon(
                                    Icons.add,
                                    color: Color(0xFF374151),
                                    size: 20,
                                  ),
                                  padding: EdgeInsets.zero,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),

              SizedBox(height: 16),

              // remarks (Full Width)
              _buildFormField(
                label: 'Remarks',
                child: _buildTextField(
                  controller.remarksController,
                  'TEST REMARKS',
                ),
              ),

              SizedBox(height: 24),

              // action Buttons
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  OutlinedButton(
                    onPressed: controller.onCloseClicked,
                    style: OutlinedButton.styleFrom(
                      padding: EdgeInsets.symmetric(
                        horizontal: 32,
                        vertical: 16,
                      ),
                      side: BorderSide(color: Color(0xFF1E3A5F), width: 1.5),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8),
                      ),
                    ),
                    child: Text(
                      'Close',
                      style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w600,
                        color: Color(0xFF1E3A5F),
                      ),
                    ),
                  ),
                  SizedBox(width: 12),
                  ElevatedButton(
                    onPressed: controller.onSaveClicked,
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Color(0xFF1E3A5F),
                      foregroundColor: Colors.white,
                      padding: EdgeInsets.symmetric(
                        horizontal: 32,
                        vertical: 16,
                      ),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8),
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
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildFormField({required String label, required Widget child}) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: TextStyle(
            fontSize: 14,
            fontWeight: FontWeight.w600,
            color: Color(0xFF374151),
          ),
        ),
        SizedBox(height: 8),
        child,
      ],
    );
  }

  Widget _buildDropdown(RxString selectedValue, List<String> items) {
    return Obx(
      () => Container(
        height: 48,
        padding: EdgeInsets.symmetric(horizontal: 12),
        decoration: BoxDecoration(
          color: Color(0xFFF9FAFB),
          border: Border.all(color: Color(0xFFE5E7EB)),
          borderRadius: BorderRadius.circular(8),
        ),
        child: DropdownButtonHideUnderline(
          child: DropdownButton<String>(
            value: selectedValue.value,
            isExpanded: true,
            icon: Icon(Icons.keyboard_arrow_down, color: Color(0xFF6B7280)),
            style: TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.w500,
              color: Color(0xFF374151),
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

  Widget _buildTextField(TextEditingController controller, String hint) {
    return Container(
      height: 48,
      child: TextField(
        controller: controller,
        style: TextStyle(fontSize: 14, color: Color(0xFF374151)),
        decoration: InputDecoration(
          hintText: hint,
          hintStyle: TextStyle(color: Color(0xFF9CA3AF), fontSize: 14),
          filled: true,
          fillColor: Color(0xFFF9FAFB),
          contentPadding: EdgeInsets.symmetric(horizontal: 12, vertical: 14),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(8),
            borderSide: BorderSide(color: Color(0xFFE5E7EB)),
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(8),
            borderSide: BorderSide(color: Color(0xFFE5E7EB)),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(8),
            borderSide: BorderSide(color: Color(0xFF1E3A5F), width: 1.5),
          ),
        ),
      ),
    );
  }
}

// Function to show the dialog
void showTicketSaleDialog() {
  Get.dialog(TicketSaleDilogue(), barrierDismissible: false);
}
