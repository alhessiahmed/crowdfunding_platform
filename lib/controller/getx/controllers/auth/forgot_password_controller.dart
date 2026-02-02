import 'package:flutter/cupertino.dart';
import 'package:get/state_manager.dart';

class ForgotPasswordController extends GetxController {
  final emailController = TextEditingController();
  final formKey = GlobalKey<FormState>();
  final isResetting = false.obs;
}
