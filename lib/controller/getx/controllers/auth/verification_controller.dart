import 'dart:async';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../core/routes/routes_manager.dart';

class VerificationController extends GetxController {
  final firstCodeTextController = TextEditingController();
  final secondCodeTextController = TextEditingController();
  final thirdCodeTextController = TextEditingController();
  final fourthCodeTextController = TextEditingController();
  final fifthCodeTextController = TextEditingController();

  final firstFocusNode = FocusNode();
  final secondFocusNode = FocusNode();
  final thirdFocusNode = FocusNode();
  final fourthFocusNode = FocusNode();
  final fifthFocusNode = FocusNode();

  final isResetting = false.obs;
  final code = ''.obs;

  late Timer timer;
  final counter = 0.obs;

  void updateCode() {
    code.value =
        firstCodeTextController.text +
        secondCodeTextController.text +
        thirdCodeTextController.text +
        fourthCodeTextController.text +
        fifthCodeTextController.text;
  }

  void setTimer() {
    counter(90);
    timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      if (counter.value == 0) {
        timer.cancel();
      } else {
        counter.value--;
      }
    });
  }

  bool get isCodeComplete => code.value.length == 5;

  void submitCode() {
    if (!isCodeComplete) {
      // Get.snackbar(
      //   'error'.tr,
      //   'verification_code_incomplete'.tr,
      // );
      return;
    }
    // Call API
    Get.offNamed(RoutesManager.resetPasswordScreen);
  }

  @override
  void onInit() {
    setTimer();
    super.onInit();
  }
}
