import 'package:crowdfunding_platform/view/widgets/alternative_button.dart';
import 'package:crowdfunding_platform/view/widgets/text_field_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import '../../../../controller/getx/controllers/donor/donor_verification_controller.dart';
import '../../../widgets/transparent_button.dart';
import '../../../widgets/verify_field_widget.dart';

class DonorEmailVerificationScreen
    extends GetView<DonorVerificationController> {
  const DonorEmailVerificationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(height: 10.h),
        Text('confirm_email'.tr, style: Theme.of(context).textTheme.bodyLarge),
        SizedBox(height: 16.h),
        Text(
          'how_email_is_used'.tr,
          style: Theme.of(
            context,
          ).textTheme.bodyMedium!.copyWith(fontSize: 12.sp),
        ),
        SizedBox(height: 24.h),
        TextFieldWidget(
          controller: controller.emailController,
          hintText: '',
          label: 'email'.tr,
        ),
        SizedBox(height: 24.h),
        Obx(
          () => controller.verificationSent.value
              ? Center(
                  child: SizedBox(
                    height: 56.h,
                    child: ListView(
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      scrollDirection: Axis.horizontal,
                      children: [
                        VerifyFieldWidget(
                          autofocus: true,
                          codeController: controller.firstCodeTextController,
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
                          codeController: controller.secondCodeTextController,
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
                          codeController: controller.thirdCodeTextController,
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
                          codeController: controller.fourthCodeTextController,
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
                          codeController: controller.fifthCodeTextController,
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
                    ),
                  ),
                )
              : AlternativeButton(
                  onPressed: controller.sendVerification,
                  text: 'send_code'.tr,
                ),
        ),
        SizedBox(height: 8.h),
        Obx(
          () => controller.verificationSent.value
              ? TransparentButton(
                  text:
                      '${'didnt_recieve_code'.tr} (${'after'.tr} ${controller.counter} ${'second'.tr})',
                  onPressed: controller.counter.value == 0
                      ? () {
                          controller.setTimer();
                        }
                      : () {},
                )
              : Container(),
        ),
      ],
    );
  }
}
