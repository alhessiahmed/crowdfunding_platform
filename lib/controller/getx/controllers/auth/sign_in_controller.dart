import 'package:crowdfunding_platform/controller/getx/controllers/auth_validation_mixin.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

import '../../../core/routes/routes_manager.dart';

class SignInController extends GetxController with AuthValidationMixin {
  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  final formKey = GlobalKey<FormState>();
  final passwordVisible = false.obs;
  final isLogging = false.obs;

  void submit() {
    if (!formKey.currentState!.validate()) return;
    Get.toNamed(RoutesManager.discoverScreen);
  }
}
