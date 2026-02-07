import 'package:crowdfunding_platform/controller/getx/controllers/auth_validation_mixin.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import '../../../core/routes/routes_manager.dart';

class SignUpController extends GetxController with AuthValidationMixin {
  final firstNameController = TextEditingController();
  final lastNameController = TextEditingController();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final formKey = GlobalKey<FormState>();
  final passwordVisible = false.obs;
  final isRegistering = false.obs;

  void submit() {
    if (!formKey.currentState!.validate()) return;
    Get.toNamed(RoutesManager.userTypeSelectionScreen);
  }

  @override
  void onClose() {
    firstNameController.dispose();
    lastNameController.dispose();
    emailController.dispose();
    passwordController.dispose();
    super.onClose();
  }
}
