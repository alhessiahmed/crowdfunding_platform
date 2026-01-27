import 'package:crowdfunding_platform/controller/core/constants/colors_manager.dart';
import 'package:crowdfunding_platform/controller/core/constants/images_manager.dart';
import 'package:crowdfunding_platform/controller/getx/controllers/campaign_create/campaign_step_five_controller.dart';
import 'package:crowdfunding_platform/view/widgets/campaign_info_widgets/info_card_widget.dart';
import 'package:crowdfunding_platform/view/widgets/secondary_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class CampaignStepFiveScreen extends GetView<CampaignStepFiveController> {
  const CampaignStepFiveScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
              child: ListView(
                children: [
                  SizedBox(height: 24.h),
                  Stack(
                    alignment: Alignment.center,
                    children: [
                      Image.asset(
                        controller.reviewImage,
                        width: 320.w,
                        height: 320.w,
                        fit: BoxFit.contain,
                      ),
                      Positioned(
                        bottom: 1.h,
                        child: Text(
                          'under_review'.tr,
                          textAlign: TextAlign.center,
                          style: Theme.of(context).textTheme.bodyLarge!
                              .copyWith(fontWeight: FontWeight.bold),
                        ),
                      ),
                    ],
                  ),

                  SizedBox(height: 10.h),
                  Text(
                    'thank_you_for_your_submission'.tr,
                    textAlign: TextAlign.center,
                    style: Theme.of(
                      context,
                    ).textTheme.bodyMedium!.copyWith(fontSize: 12.sp),
                  ),
                  SizedBox(height: 32.h),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      InfoCard(
                        iconPath: Get.isDarkMode
                            ? ImagesManager.secureDark
                            : ImagesManager.secureLight,
                        title: 'review_info1'.tr,
                      ),
                      SizedBox(height: 10.h),
                      InfoCard(
                        iconPath: Get.isDarkMode
                            ? ImagesManager.clokDark
                            : ImagesManager.clokLight,
                        title: 'review_info2'.tr,
                      ),
                    ],
                  ),
                ],
              ),
            ),
            Column(
              children: [
                ElevatedButton(
                  onPressed: controller.onGoToDashboard,
                  child: Text(
                    'go_to_dashboard'.tr,
                    textAlign: TextAlign.center,
                  ),
                ),
                SizedBox(height: 12.h),
                SecondaryButton(
                  label: 'display_campaign_details'.tr,
                  onPressed: controller.onViewCampaignDetails,
                  color: ColorsManager.secondaryThanksColor.withValues(
                    alpha: 0.10,
                  ),
                ),
              ],
            ),
          ],
        ).paddingSymmetric(horizontal: 24.w, vertical: 32.h),
      ),
    );
  }
}
