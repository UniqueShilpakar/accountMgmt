import 'package:accounts/widgets/dialogBoxWidget/supplier_dilogue.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CreateSupplierDialog extends StatelessWidget {
  CreateSupplierDialog({Key? key}) : super(key: key);

  final CreateSupplierController controller = Get.put(
    CreateSupplierController(),
  );

  @override
  Widget build(BuildContext context) {
    return Dialog(
      shape: RoundedRectangleBorder(
        borderRadius: .circular(12),
      ),
      
    );
  }
}
