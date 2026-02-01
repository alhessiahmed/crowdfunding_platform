import 'package:crowdfunding_platform/controller/getx/controllers/auth_validation_mixin.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

import '../../../core/routes/routes_manager.dart';

class ForgotPasswordController extends GetxController with AuthValidationMixin {
  final emailController = TextEditingController();
  final formKey = GlobalKey<FormState>();
  final isResetting = false.obs;
  void submit() {
    if (!formKey.currentState!.validate()) return;
    Get.offNamed(RoutesManager.verificationScreen);
  }
}
