import 'package:crowdfunding_platform/controller/core/routes/routes_manager.dart';
import 'package:crowdfunding_platform/view/widgets/google_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../../controller/core/constants/colors_manager.dart';
import '../../../controller/core/constants/images_manager.dart';
import '../../../controller/getx/controllers/auth/sign_in_controller.dart';
import '../../widgets/loading_widget.dart';
import '../../widgets/text_field_widget.dart';
import '../../widgets/transparent_button.dart';

class SignInScreen extends GetView<SignInController> {
  const SignInScreen({super.key});

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
                SizedBox(height: 10.h),
                Text(
                  'welcome_back'.tr,
                  textAlign: TextAlign.center,
                  style: Theme.of(
                    context,
                  ).textTheme.bodyLarge, //!.copyWith(fontSize: 24.sp),
                ),
                SizedBox(height: 16.h),
                Text(
                  'sign_in_info'.tr,
                  textAlign: TextAlign.center,
                  style: Theme.of(context).textTheme.bodySmall!.copyWith(
                    color: Theme.of(context).colorScheme.onSurfaceVariant,
                  ),
                ),
                SizedBox(height: 24.h),
                TextFieldWidget(
                  controller: controller.emailController,
                  hintText: 'email'.tr,
                  label: 'email'.tr,
                ),
                SizedBox(height: 16.h),
                Obx(
                  () => TextFieldWidget(
                    label: 'password'.tr,
                    hintText: 'password'.tr,
                    suffixIcon: Obx(
                      () => IconButton(
                        onPressed: () {
                          controller.passwordVisible(
                            !controller.passwordVisible.value,
                          );
                        },
                        icon: controller.passwordVisible.value
                            ? Icon(
                                Icons.visibility_outlined,
                                color: ColorsManager.subtitleColor,
                                size: 24.h,
                              )
                            : Icon(
                                Icons.visibility_off_outlined,
                                color: ColorsManager.subtitleColor,
                                size: 24.h,
                              ),
                      ),
                    ),
                    obscureText: !controller.passwordVisible.value,
                    controller: controller.passwordController,
                    isPassword: true,
                  ),
                ),
                Align(
                  alignment: AlignmentDirectional.topEnd,
                  child: TextButton(
                    onPressed: () {
                      Get.offNamed(RoutesManager.forgotPasswordScreen);
                    },
                    child: Text(
                      'forgot_password'.tr,
                      style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                        fontSize: 10.sp,
                        // color: Theme.of(context).colorScheme.onSurface,
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 16.h),
                ElevatedButton(onPressed: () {}, child: Text('login'.tr)),
                TransparentButton(
                  text: 'dont_have_acc'.tr,
                  onPressed: () {
                    Get.offNamed(RoutesManager.signUpScreen);
                  },
                ),
                SizedBox(height: 24.h),
                Row(
                  children: [
                    Expanded(
                      child: Divider(endIndent: 8.w, height: 2.h),
                    ),
                    Text('or'.tr),
                    Expanded(
                      child: Divider(indent: 8.w, height: 2.h),
                    ),
                  ],
                ),
                SizedBox(height: 24.h),
                GoogleButton(onPressed: () {}),
                SizedBox(height: 12.h),
                GoogleButton(onPressed: () {}, isGoogle: false),
                SizedBox(height: 40.h),
              ],
            ),
          ),
          Obx(
            () => Visibility(
              visible: controller.isLogging.value,
              child: const LoadingWidget(),
            ),
          ),
        ],
      ),
    );
  }

  Future<void> _performSignUp() async {}
}
