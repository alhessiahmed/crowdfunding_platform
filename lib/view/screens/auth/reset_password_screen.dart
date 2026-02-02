import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../../controller/core/constants/images_manager.dart';
import '../../../controller/getx/controllers/auth/reset_password_controller.dart';
import '../../widgets/password_rule.dart';
import '../../widgets/password_strength_bar.dart';
import '../../widgets/text_field_widget.dart';

class ResetPasswordScreen extends GetView<ResetPasswordController> {
  const ResetPasswordScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          padding: EdgeInsets.symmetric(horizontal: 24.w),
          child: Column(
            children: [
              SizedBox(height: 41.h),
              Image.asset(ImagesManager.logo),
              SizedBox(height: 14.h),

              Text(
                'assign_new_pass'.tr,
                textAlign: TextAlign.center,
                style: Theme.of(context).textTheme.bodyLarge,
              ),
              SizedBox(height: 16.h),
              Text(
                'assign_new_pass_info'.tr,
                textAlign: TextAlign.center,
                style: Theme.of(
                  context,
                ).textTheme.bodyMedium!.copyWith(fontSize: 12.sp),
              ),
              SizedBox(height: 24.h),

              /// New password
              TextFieldWidget(
                label: 'new_password'.tr,
                hintText: '••••••••••',
                controller: controller.newPasswordController,
                obscureText: false,
                onChange: controller.onPasswordChanged,
              ),

              SizedBox(height: 12.h),

              /// Strength bar
              Obx(() => PasswordStrengthBar(strength: controller.strength)),

              SizedBox(height: 12.h),

              /// Rules
              Obx(
                () => PasswordRule(
                  text: 'first_rule'.tr,
                  isValid: controller.hasMinLength,
                ),
              ),
              Obx(
                () => PasswordRule(
                  text: 'second_rule'.tr,
                  isValid: controller.hasNumber,
                ),
              ),
              Obx(
                () => PasswordRule(
                  text: 'third_rule'.tr,
                  isValid: controller.hasSpecialChar,
                ),
              ),
              Obx(
                () => PasswordRule(
                  text: 'fourth_rule'.tr,
                  isValid: controller.passwordsMatch,
                ),
              ),

              SizedBox(height: 16.h),

              /// Confirm password
              TextFieldWidget(
                label: 'confirm_new_password'.tr,
                hintText: '••••••••••',
                controller: controller.confirmNewPasswordController,
                obscureText: false,
                onChange: controller.onConfirmPasswordChanged,
              ),

              SizedBox(height: 16.h),

              /// Submit
              Obx(
                () => SizedBox(
                  width: double.infinity,
                  height: 56.h,
                  child: ElevatedButton(
                    onPressed: controller.canSubmit ? controller.submit : null,
                    child: Text('update_password'.tr),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
