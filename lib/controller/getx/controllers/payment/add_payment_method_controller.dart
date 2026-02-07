import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AddPaymentMethodController extends GetxController {
  final TextEditingController cardNumberController = TextEditingController();
  final TextEditingController expiryDateController = TextEditingController();
  final TextEditingController securityCodeController = TextEditingController();
  final TextEditingController cardholderNameController =
      TextEditingController();

  void onBack() {
    Get.back();
  }

  @override
  void onClose() {
    cardNumberController.dispose();
    expiryDateController.dispose();
    securityCodeController.dispose();
    cardholderNameController.dispose();
    super.onClose();
  }
}
