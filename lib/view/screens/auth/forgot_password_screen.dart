import 'package:crowdfunding_platform/controller/core/constants/images_manager.dart';
import 'package:crowdfunding_platform/controller/getx/controllers/auth/forgot_password_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import '../../widgets/loading_widget.dart';
import '../../widgets/text_field_widget.dart';

class ForgotPasswordScreen extends GetView<ForgotPasswordController> {
  const ForgotPasswordScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Form(
            key: controller.formKey,
            child: ListView(
              padding: EdgeInsets.symmetric(horizontal: 24.w),
              children: [
                SizedBox(height: 40.h),
                Image.asset(ImagesManager.logo),
                SizedBox(height: 60.h),
                Text(
                  'frgt_pswd_title'.tr,
                  textAlign: TextAlign.center,
                  style: Theme.of(
                    context,
                  ).textTheme.bodyLarge, //!.copyWith(fontSize: 24.sp),
                ),
                SizedBox(height: 16.h),
                Text(
                  'frgt_pswd_info'.tr,
                  textAlign: TextAlign.center,
                  style: Theme.of(
                    context,
                  ).textTheme.bodyMedium!.copyWith(fontSize: 12.sp),
                ),
                SizedBox(height: 24.h),
                TextFieldWidget(
                  controller: controller.emailController,
                  hintText: 'email'.tr,
                  label: 'email'.tr,
                  keyboardType: TextInputType.emailAddress,
                  validator: controller.email,
                ),
                SizedBox(height: 16.h),
                ElevatedButton(
                  onPressed: controller.submit,
                  child: Text('reset_password'.tr),
                ),
                SizedBox(height: 24.h),
                Text(
                  'by_continue'.tr,
                  textAlign: TextAlign.center,
                  style: Theme.of(context).textTheme.bodySmall!.copyWith(
                    color: Theme.of(context).colorScheme.onSurface,
                  ),
                ),
              ],
            ),
          ),
          Obx(
            () => Visibility(
              visible: controller.isResetting.value,
              child: const LoadingWidget(),
            ),
          ),
        ],
      ),
    );
  }
}
