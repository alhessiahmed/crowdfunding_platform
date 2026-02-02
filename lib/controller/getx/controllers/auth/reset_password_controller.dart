import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

import '../../../core/routes/routes_manager.dart';

class ResetPasswordController extends GetxController {
  final newPasswordController = TextEditingController();
  final confirmNewPasswordController = TextEditingController();

  final formKey = GlobalKey<FormState>();
  // final newPasswordVisible = false.obs;
  // final confirmPasswordVisible = false.obs;
  final isChanging = false.obs;
  final password = ''.obs;
  final confirmPassword = ''.obs;

  bool get hasMinLength => password.value.length >= 8;
  bool get hasNumber => RegExp(r'\d').hasMatch(password.value);
  bool get hasSpecialChar =>
      RegExp(r'[!@#$%^&*(),.?":{}|<>]').hasMatch(password.value);
  bool get passwordsMatch =>
      password.value.isNotEmpty && password.value == confirmPassword.value;

  double get strength {
    int score = 0;
    if (hasMinLength) score++;
    if (hasNumber) score++;
    if (hasSpecialChar) score++;
    if (passwordsMatch) score++;
    return score / 4;
  }

  bool get canSubmit =>
      hasMinLength && hasNumber && hasSpecialChar && passwordsMatch;

  void onPasswordChanged(String value) {
    password.value = value;
  }

  void onConfirmPasswordChanged(String value) {
    confirmPassword.value = value;
  }

  void submit() {
    if (!canSubmit) return;

    // TODO: API call
    Get.snackbar(
      'نجاح',
      'تم تحديث كلمة المرور',
      snackPosition: SnackPosition.BOTTOM,
    );
    Get.offNamed(RoutesManager.resetPasswordSuccessScreen);
  }

  @override
  void onClose() {
    newPasswordController.dispose();
    confirmNewPasswordController.dispose();
    super.onClose();
  }
}
