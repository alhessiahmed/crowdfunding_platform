import 'package:crowdfunding_platform/controller/core/constants/colors_manager.dart';
import 'package:crowdfunding_platform/controller/core/constants/images_manager.dart';
import 'package:crowdfunding_platform/controller/getx/controllers/campaign_create/campaign_step_two_controller.dart';
import 'package:crowdfunding_platform/view/widgets/campaign_info_widgets/Info_row_widget.dart';

import 'package:crowdfunding_platform/view/widgets/campaign_info_widgets/custom_step_appBar_widget.dart';
import 'package:crowdfunding_platform/view/widgets/secondary_button.dart';
import 'package:crowdfunding_platform/view/widgets/text_field_widget.dart';
import 'package:dotted_border/dotted_border.dart';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CampaignStepTwoScreen extends GetView<CampaignStepTwoController> {
  const CampaignStepTwoScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: PreferredSize(
          preferredSize: Size.fromHeight(80.h),
          child: Obx(
            () => CustomStepAppBar(
              currentStep: controller.currentStep.value == 2 ? 2 : 2,
              totalSteps: 4,
              logoPath: ImagesManager.logo,
              progressWidth: 58,
            ),
          ),
        ),
        body: Stack(
          children: [
            Form(
              key: controller.formKey,
              child: ListView(
                padding: EdgeInsets.symmetric(horizontal: 24.w),
                children: [
                  Text(
                    'campaign_photo'.tr,
                    style: Theme.of(context).textTheme.bodyLarge,
                  ),
                  SizedBox(height: 16.h),

                  DottedBorder(
                    borderType: BorderType.RRect,
                    radius: Radius.circular(16.r),
                    dashPattern: const [6, 4],
                    color: Get.isDarkMode
                        ? const Color(0xFF2F5A8C)
                        : ColorsManager.iconDefaultLight,
                    strokeWidth: 2,
                    child: InkWell(
                      borderRadius: BorderRadius.circular(16.r),
                      onTap: controller.pickCampaignImage, // اربطيها بالكنترولر
                      child: Container(
                        width: double.infinity,
                        padding: EdgeInsets.symmetric(vertical: 24.h),
                        decoration: BoxDecoration(
                          color: Get.isDarkMode
                              ? Color(0xFF1E1E1E)
                              : ColorsManager.white,
                          borderRadius: BorderRadius.circular(16.r),
                        ),
                        child: Column(
                          children: [
                            /// Image preview or placeholder
                            Container(
                              height: 80,
                              width: 80,
                              decoration: BoxDecoration(
                                color: Get.isDarkMode
                                    ? Color(0xFF252525)
                                    : Color(0xFFE2E8F0),
                                borderRadius: BorderRadius.all(
                                  Radius.circular(40),
                                ),
                              ),

                              child: Image.asset(
                                Get.isDarkMode
                                    ? ImagesManager.frameDark
                                    : ImagesManager.frameLight,
                              ),
                            ),
                            SizedBox(height: 8),

                            /// Title
                            Text(
                              'add_campaign_image'.tr,
                              style: Theme.of(context).textTheme.bodyMedium!
                                  .copyWith(fontWeight: FontWeight.bold),
                            ),

                            SizedBox(height: 4.h),

                            /// Subtitle
                            Text(
                              'campaign_image_hint'.tr,
                              textAlign: TextAlign.center,
                              style: Theme.of(context).textTheme.bodySmall!
                                  .copyWith(
                                    color: Theme.of(
                                      context,
                                    ).colorScheme.onSurfaceVariant,
                                  ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),

                  SizedBox(height: 8.h),

                  /// Helper note
                  Center(
                    child: Container(
                      width: 129.w,
                      height: 24.h,
                      alignment: Alignment.center,
                      decoration: BoxDecoration(
                        color: Get.isDarkMode
                            ? ColorsManager.bgGoogle
                            : const Color(0xFFE2E8F0),
                        borderRadius: BorderRadius.circular(8.r),
                      ),
                      child: Text(
                        'image_optional'.tr,
                        textAlign: TextAlign.center,
                        style: Theme.of(
                          context,
                        ).textTheme.bodySmall!.copyWith(fontSize: 10.sp),
                      ),
                    ),
                  ),
                  SizedBox(height: 16.h),
                  Container(
                    child: TextFieldWidget(
                      label: 'description'.tr,
                      hintText: 'description_hint'.tr,
                      controller: controller.descriptionController,
                      maxLines: 3,
                    ),
                  ),
                  InfoRowWidget(
                    text:
                        'This description is shown to donors and helps them make\n a decision.'
                            .tr,
                  ),
                  SizedBox(height: 140.h),
                  ElevatedButton(
                    onPressed: controller.goToNextStep,
                    child: Text('next'.tr),
                  ),

                  SizedBox(height: 12.h),

                  /// Back / Cancel
                  SecondaryButton(label: 'cancel'.tr, onPressed: Get.back),

                  SizedBox(height: 40.h),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
