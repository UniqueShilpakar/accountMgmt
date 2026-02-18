import 'package:accounts/controllers/dialogueController/Aairlinepasscontroller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AirLinePassDialog extends StatelessWidget {
  AirLinePassDialog({Key? key}) : super(key: key);

  final AirlinePassController controller = Get.put(AirlinePassController());

  @override
  Widget build(BuildContext context) {
    return Dialog(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      child: Container(width: 420, padding: EdgeInsets.all(24),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        border: Border(
          left: BorderSide(color: Color(0xFFF7A032), width: 2.5),
          bottom: BorderSide(color: Color(0xFFF7A032), width: 2.5),
        ),
      ),
      ),
    );
  }
}

void showAirlinePassDialog() {
  Get.dialog(AirLinePassDialog(), barrierDismissible: true);
}
