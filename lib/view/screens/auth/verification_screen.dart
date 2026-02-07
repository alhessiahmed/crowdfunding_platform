import 'package:crowdfunding_platform/view/widgets/transparent_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import '../../../controller/core/constants/images_manager.dart';
import '../../../controller/getx/controllers/auth/verification_controller.dart';
import '../../widgets/loading_widget.dart';
import '../../widgets/verify_field_widget.dart';

class VerificationScreen extends GetView<VerificationController> {
  const VerificationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        physics: const BouncingScrollPhysics(),
        children: [
          Stack(
            children: [
              Padding(
                padding: EdgeInsets.all(24.h),
                child: Column(
                  children: [
                    SizedBox(height: 40.h),
                    Image.asset(ImagesManager.logo),
                    SizedBox(height: 60.h),
                    Text(
                      'enter_verification'.tr,
                      textAlign: TextAlign.center,
                      style: Theme.of(
                        context,
                      ).textTheme.bodyLarge, //!.copyWith(fontSize: 24.sp),
                    ),
                    SizedBox(height: 16.h),
                    Text(
                      'verification_info'.tr,
                      textAlign: TextAlign.center,
                      style: Theme.of(
                        context,
                      ).textTheme.bodyMedium!.copyWith(fontSize: 12.sp),
                    ),
                    SizedBox(height: 16.h),
                    Row(
                      children: [
                        Text(
                          'sent_to'.tr,
                          style: Theme.of(context).textTheme.bodySmall!
                              .copyWith(
                                color: Theme.of(context).colorScheme.onSurface,
                              ),
                        ),
                        Text(
                          'alhessiahmed@gmail.com',
                          style: Theme.of(context).textTheme.bodySmall!
                              .copyWith(
                                color: Theme.of(context).colorScheme.onSurface,
                              ),
                        ),
                      ],
                    ),
                    SizedBox(height: 24.h),
                    Center(
                      child: SizedBox(
                        height: 56.h,
                        child: GetBuilder<VerificationController>(
                          builder: (context) {
                            return ListView(
                              shrinkWrap: true,
                              physics: const NeverScrollableScrollPhysics(),
                              scrollDirection: Axis.horizontal,
                              children: [
                                VerifyFieldWidget(
                                  autofocus: true,
                                  codeController:
                                      controller.firstCodeTextController,
                                  focusNode: controller.firstFocusNode,
                                  onChanged: (value) {
                                    if (value.isNotEmpty) {
                                      controller.secondFocusNode.requestFocus();
                                    }
                                    controller.updateCode();
                                    controller.update();
                                  },
                                ),
                                SizedBox(width: 8.w),
                                VerifyFieldWidget(
                                  codeController:
                                      controller.secondCodeTextController,
                                  focusNode: controller.secondFocusNode,
                                  onChanged: (value) {
                                    if (value.isNotEmpty) {
                                      controller.thirdFocusNode.requestFocus();
                                    } else {
                                      controller.firstFocusNode.requestFocus();
                                    }
                                    controller.updateCode();
                                    controller.update();
                                  },
                                ),
                                SizedBox(width: 8.w),
                                VerifyFieldWidget(
                                  codeController:
                                      controller.thirdCodeTextController,
                                  focusNode: controller.thirdFocusNode,
                                  onChanged: (value) {
                                    if (value.isNotEmpty) {
                                      controller.fourthFocusNode.requestFocus();
                                    } else {
                                      controller.secondFocusNode.requestFocus();
                                    }
                                    controller.updateCode();
                                    controller.update();
                                  },
                                ),
                                SizedBox(width: 8.w),
                                VerifyFieldWidget(
                                  codeController:
                                      controller.fourthCodeTextController,
                                  focusNode: controller.fourthFocusNode,
                                  onChanged: (value) {
                                    if (value.isEmpty) {
                                      controller.thirdFocusNode.requestFocus();
                                    } else {
                                      controller.fifthFocusNode.requestFocus();
                                    }
                                    controller.updateCode();
                                    controller.update();
                                  },
                                ),
                                SizedBox(width: 8.w),
                                VerifyFieldWidget(
                                  codeController:
                                      controller.fifthCodeTextController,
                                  focusNode: controller.fifthFocusNode,
                                  onChanged: (value) {
                                    if (value.isEmpty) {
                                      controller.fourthFocusNode.requestFocus();
                                    }
                                    controller.updateCode();
                                    controller.update();
                                  },
                                ),
                              ],
                            );
                          },
                        ),
                      ),
                    ),
                    SizedBox(height: 16.h),
                    Obx(
                      () => ElevatedButton(
                        onPressed: controller.isCodeComplete
                            ? controller.submitCode
                            : null, // disables button automatically
                        child: Text('confirm_code'.tr),
                      ),
                    ),
                    Obx(
                      () => TransparentButton(
                        text:
                            '${'didnt_recieve_code'.tr} (${'after'.tr} ${controller.counter} ${'second'.tr})',
                        onPressed: controller.counter.value == 0
                            ? () {
                                controller.setTimer();
                              }
                            : () {},
                      ),
                    ),
                    SizedBox(height: 24.h),
                    Text(
                      'code_availability'.tr,
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
        ],
      ),
    );
  }
}
