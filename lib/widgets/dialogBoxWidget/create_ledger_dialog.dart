import 'package:accounts/controllers/dialogController/create_ledger_controller.dart';
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

// Widget _build
}

void showCreateLedgerDialog() {
  Get.dialog(CreateLedgerDialog(), barrierDismissible: true);
}
