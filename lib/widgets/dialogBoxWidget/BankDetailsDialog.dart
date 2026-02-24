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
        child: Column(mainAxisSize: .min,
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
        ],
        ),
        
      ),
    );
  }
}
 void showBankDetailsDialog() {
    Get.dialog(
      BankDetailsDialog(), barrierDismissible: true,
    );
  }
