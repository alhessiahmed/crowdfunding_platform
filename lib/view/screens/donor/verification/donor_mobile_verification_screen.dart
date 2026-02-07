import 'package:crowdfunding_platform/view/widgets/alternative_button.dart';
import 'package:crowdfunding_platform/view/widgets/text_field_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import '../../../../controller/core/constants/colors_manager.dart';
import '../../../../controller/getx/controllers/donor/donor_verification_controller.dart';
import '../../../widgets/transparent_button.dart';
import '../../../widgets/verify_field_widget.dart';

class DonorMobileVerificationScreen
    extends GetView<DonorVerificationController> {
  const DonorMobileVerificationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(height: 10.h),
        Text('confirm_mobile'.tr, style: Theme.of(context).textTheme.bodyLarge),
        SizedBox(height: 16.h),
        Text(
          'how_phone_is_used'.tr,
          style: Theme.of(
            context,
          ).textTheme.bodyMedium!.copyWith(fontSize: 12.sp),
        ),
        SizedBox(height: 24.h),
        TextFieldWidget(
          controller: controller.phoneController,
          hintText: '',
          label: 'phone'.tr,
          maxLength: 9,
          suffixIcon: InkWell(
            onTap: controller.pickCountry,
            borderRadius: BorderRadius.circular(24.r),
            child: Container(
              height: 48.h,
              width: 48.w,
              alignment: Alignment.center,
              decoration: BoxDecoration(
                color: Get.isDarkMode
                    ? ColorsManager.bgSectionDark
                    : ColorsManager.bgSectionLight,
                borderRadius: BorderRadius.circular(16.r),
              ),
              child: Obx(
                () => Text(
                  controller.selectedCountry.value.flagEmoji,
                  style: TextStyle(fontSize: 20.sp),
                ),
              ),
            ),
          ),
        ),
        SizedBox(height: 24.h),
        Obx(
          () => controller.codeSent.value
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
                          codeController:
                              controller.mobileFirstCodeTextController,
                          focusNode: controller.mobileFirstFocusNode,
                          onChanged: (value) {
                            if (value.isNotEmpty) {
                              controller.mobileSecondFocusNode.requestFocus();
                            }
                            controller.updateMobileCode();
                            controller.update();
                          },
                        ),
                        SizedBox(width: 8.w),
                        VerifyFieldWidget(
                          codeController:
                              controller.mobileSecondCodeTextController,
                          focusNode: controller.mobileSecondFocusNode,
                          onChanged: (value) {
                            if (value.isNotEmpty) {
                              controller.mobileThirdFocusNode.requestFocus();
                            } else {
                              controller.mobileFirstFocusNode.requestFocus();
                            }
                            controller.updateMobileCode();
                            controller.update();
                          },
                        ),
                        SizedBox(width: 8.w),
                        VerifyFieldWidget(
                          codeController:
                              controller.mobileThirdCodeTextController,
                          focusNode: controller.mobileThirdFocusNode,
                          onChanged: (value) {
                            if (value.isNotEmpty) {
                              controller.mobileFourthFocusNode.requestFocus();
                            } else {
                              controller.mobileSecondFocusNode.requestFocus();
                            }
                            controller.updateMobileCode();
                            controller.update();
                          },
                        ),
                        SizedBox(width: 8.w),
                        VerifyFieldWidget(
                          codeController:
                              controller.mobileFourthCodeTextController,
                          focusNode: controller.mobileFourthFocusNode,
                          onChanged: (value) {
                            if (value.isEmpty) {
                              controller.mobileThirdFocusNode.requestFocus();
                            } else {
                              controller.mobileFifthFocusNode.requestFocus();
                            }
                            controller.updateMobileCode();
                            controller.update();
                          },
                        ),
                        SizedBox(width: 8.w),
                        VerifyFieldWidget(
                          codeController:
                              controller.mobileFifthCodeTextController,
                          focusNode: controller.mobileFifthFocusNode,
                          onChanged: (value) {
                            if (value.isEmpty) {
                              controller.mobileFourthFocusNode.requestFocus();
                            }
                            controller.updateMobileCode();
                            controller.update();
                          },
                        ),
                      ],
                    ),
                  ),
                )
              : Column(
                  children: [
                    AlternativeButton(
                      onPressed: controller.sendMobileVerification,
                      text: 'send_sms'.tr,
                    ),
                    SizedBox(height: 12.h),
                    AlternativeButton(
                      onPressed: controller.sendMobileVerification,
                      text: 'send_whatsapp'.tr,
                    ),
                  ],
                ),
        ),
        SizedBox(height: 8.h),
        Obx(
          () => controller.codeSent.value
              ? TransparentButton(
                  text:
                      '${'didnt_recieve_code'.tr} (${'after'.tr} ${controller.mobileCounter} ${'second'.tr})',
                  onPressed: controller.mobileCounter.value == 0
                      ? () {
                          controller.setMobileTimer();
                        }
                      : () {},
                )
              : Container(),
        ),
      ],
    );
  }
}
