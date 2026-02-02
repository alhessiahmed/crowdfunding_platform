import 'package:crowdfunding_platform/controller/core/constants/colors_manager.dart';
import 'package:crowdfunding_platform/controller/core/constants/images_manager.dart';
import 'package:crowdfunding_platform/controller/getx/controllers/payment/thanks_for_payment_controller.dart';
import 'package:crowdfunding_platform/view/widgets/donation_summary_card.dart';
import 'package:crowdfunding_platform/view/widgets/secondary_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

class ThanksForPaymentScreen extends GetView<ThanksForPaymentController> {
  const ThanksForPaymentScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final primaryTextColor = theme.colorScheme.primary;
    final titleStyle = theme.textTheme.bodyLarge?.copyWith(
      color: primaryTextColor,
      fontWeight: FontWeight.bold,
    );
    final subtitleStyle = theme.textTheme.bodySmall?.copyWith(
      color: primaryTextColor,
    );
    final highlightStyle = theme.textTheme.bodySmall?.copyWith(
      color: ColorsManager.primaryCTA,
      fontWeight: FontWeight.bold,
    );

    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
              child: ListView(
                children: [
                  //    SizedBox(height: 24.h),
                  Center(
                    child: Image.asset(
                      controller.thanksStarImage,
                      width: 180.w,
                      height: 180.w,
                      fit: BoxFit.contain,
                    ),
                  ),
                  SizedBox(height: 16.h),
                  Text(
                    'Thank_you!'.tr,
                    textAlign: TextAlign.center,
                    style: titleStyle,
                  ),
                  SizedBox(height: 8.h),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text('Your_donation'.tr, style: subtitleStyle),
                      SizedBox(width: 6.w),
                      SvgPicture.asset(
                        ImagesManager.starIcon,
                        height: 14.h,
                        width: 14.w,
                      ),
                      SizedBox(width: 4.w),
                      Text('${controller.numberStars}', style: highlightStyle),
                    ],
                  ),
                  SizedBox(height: 6.h),
                  Text(
                    'Donation_impact_description'.tr,
                    textAlign: TextAlign.center,
                    style: subtitleStyle,
                  ),
                  SizedBox(height: 12.h),
                  DonationSummaryCard(summary: controller.summary),
                ],
              ),
            ),
            Column(
              children: [
                ElevatedButton(
                  onPressed: controller.onExploreCampaigns,
                  child: Text(
                    'Explore_other_campaigns'.tr,
                    textAlign: TextAlign.center,
                  ),
                ),
                SizedBox(height: 12.h),
                SecondaryButton(
                  label: 'Create_an_account_to_track_your_progress'.tr,
                  onPressed: controller.onCreateAccount,
                  color: ColorsManager.secondaryThanksColor.withValues(
                    alpha: 0.10,
                  ),
                ),
              ],
            ),
          ],
        ).paddingSymmetric(horizontal: 24.w, vertical: 16.h),
      ),
    );
  }
}
