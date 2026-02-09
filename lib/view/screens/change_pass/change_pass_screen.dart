import 'package:crowdfunding_platform/controller/getx/controllers/auth/reset_password_controller.dart';
import 'package:crowdfunding_platform/controller/getx/controllers/change_pass_controller.dart';
import 'package:crowdfunding_platform/view/widgets/custom_app_bar.dart';
import 'package:crowdfunding_platform/view/widgets/password_rule.dart';
import 'package:crowdfunding_platform/view/widgets/password_strength_bar.dart';
import 'package:crowdfunding_platform/view/widgets/text_field_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';
import 'package:get/get_state_manager/src/simple/get_view.dart';
import 'package:get/get_utils/src/extensions/internacionalization.dart';

class ChangePassScreen extends GetView<ChangePassController> {
  const ChangePassScreen({super.key});

  @override
  Widget build(BuildContext context) {
     return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          padding: EdgeInsets.symmetric(horizontal: 24.w),
          child: Column(
            children: [
              SizedBox(height: 41.h),
              CustomAppBar(title: 'change_password'.tr),
              SizedBox(height: 14.h),

              
              Text(
                'update_password_description'.tr,
                textAlign: TextAlign.center,
                style: Theme.of(
                  context,
                ).textTheme.bodyMedium!.copyWith(fontSize: 12.sp),
              ),
                 SizedBox(height: 24.h),

              /// old password
              TextFieldWidget(
                label: 'current_pass'.tr,
                hintText: '••••••••••',
                controller: controller.oldPasswordController,
                obscureText: false,
                onChange: controller.onPasswordChanged,
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
                    child: Text('send_code'.tr),
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