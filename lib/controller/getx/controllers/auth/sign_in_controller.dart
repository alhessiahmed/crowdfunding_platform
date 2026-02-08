import 'package:crowdfunding_platform/controller/getx/controllers/auth_validation_mixin.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:get/state_manager.dart';

import '../../../api/api_controllers/auth_api_controller.dart';
import '../../../core/routes/routes_manager.dart';
import '../../../shared_pref/shared_pref_controller.dart';

class SignInController extends GetxController with AuthValidationMixin {
  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  final formKey = GlobalKey<FormState>();
  final passwordVisible = false.obs;
  final isLogging = false.obs;

  void submit() async {
    if (!formKey.currentState!.validate()) return;
    isLogging(true);

    final response = await AuthApiController().login(
      email: emailController.text.trim(),
      password: passwordController.text,
    );
    isLogging(false);
    if (response.success && response.object != null) {
      await SharedPrefController().saveToken(response.object!.token);
      await SharedPrefController().saveUser(response.object!.user.toJson());
      await SharedPrefController().saveUserType(response.object!.user.role);
      Get.offAllNamed(RoutesManager.mainScreen);
    } else {
      Get.snackbar('Error', response.message);
    }
  }
}
