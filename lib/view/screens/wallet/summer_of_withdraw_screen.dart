import 'package:crowdfunding_platform/controller/core/constants/colors_manager.dart';
import 'package:crowdfunding_platform/controller/core/constants/images_manager.dart';
import 'package:crowdfunding_platform/controller/core/routes/routes_manager.dart';
import 'package:crowdfunding_platform/view/widgets/card_divider.dart';
import 'package:crowdfunding_platform/view/widgets/update_campaign_widget/app_card.dart';
import 'package:crowdfunding_platform/view/widgets/update_campaign_widget/appbar_section.dart';
import 'package:crowdfunding_platform/view/widgets/wallet_widget/withdraw_request_summary_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

import 'package:crowdfunding_platform/controller/getx/controllers/wallet/summer_of_withdraw_controller.dart';

class SummerOfWithdrawScreen extends GetView<SummerOfWithdrawController> {
  const SummerOfWithdrawScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              AppbarSection(title: 'Confirmation_of_profit_withdrawal'.tr),
              SizedBox(height: 16.h),
              Center(child: Image.asset(ImagesManager.clockImage)),
              SizedBox(height: 24.h),
              Text(
                'Your_withdrawal_request_has_been_received_successfully!'.tr,
                style: Theme.of(context).textTheme.headlineMedium,
                textAlign: TextAlign.center,
              ),

              SizedBox(height: 32.h),
              Text(
                'Your_request_will_be_reviewed_and_the_payment_will_be_sent_to_your_bank_Saccount.'
                    .tr,
                style: Theme.of(context).textTheme.bodySmall?.copyWith(
                  color: ColorsManager.secondaryLight,
                ),
                textAlign: TextAlign.center,
              ),
              SizedBox(height: 24.h),
              WithdrawRequestSummaryCard(
                listOfSummaryItems: [
                  TextOfTheSummary(
                    title: 'Number_of_stars_you_want_to_convert'.tr,
                    value: 500,
                    thrillingText: 'star'.tr,
                  ),
                  SizedBox(height: 10.h),
                  TextOfTheSummary(
                    title: 'Platform_fees'.tr,
                    value: 10,
                    thrillingText: 'star'.tr,
                  ),
                  SizedBox(height: 10.h),
                  TextOfTheSummary(
                    title: 'Star_value'.tr,
                    value: 10,
                    thrillingText: 'Shakel'.tr,
                  ),
                  CardDivider(height: 2.h),
                  TextOfTheSummary(
                    title: 'Net_number_of_stars'.tr,
                    value: 450,
                    thrillingText: 'star'.tr,
                  ),
                  SizedBox(height: 10.h),
                  TextOfTheSummary(
                    title: 'net_amount'.tr,
                    value: 4500,
                    thrillingText: 'Shakel'.tr,
                  ),
                  CardDivider(height: 2.h),

                  TextOfTheSummary(
                    title: 'bank_account'.tr,
                    thrillingText: 'بنك فلسطين',
                  ),
                  SizedBox(height: 4.h),
                  TextOfTheSummary(title: '', thrillingText: '2242 ****'),
                  SizedBox(height: 10.h),
                  TextOfTheSummary(
                    title: 'Expected_arrival_time'.tr,
                    thrillingText: 'بعد يومين',
                  ),
                ],
              ),
              SizedBox(height: 24.h),
              AppCard(
                child: Row(
                  children: [
                    SvgPicture.asset(
                      ImagesManager.estimatedITimeToWithdrawIcon,
                      height: 40,
                      width: 40,
                    ),
                    SizedBox(width: 10.w),
                    Text(
                      'The_review_usually_takes_24_to_48_hours.'.tr,
                      style: Theme.of(context).textTheme.bodySmall?.copyWith(
                        color: ColorsManager.secondaryLight,
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 24.h),
              ElevatedButton(
                onPressed: () {},
                child: Text('Go_to_the_control_panel'.tr),
              ),
              SizedBox(height: 10.h),
              ElevatedButton(
                onPressed: () {
                  Get.toNamed(RoutesManager.walletScreen);
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: ColorsManager.secondaryThanksColor,
                ),
                child: Text('Return_to_wallet'.tr),
              ),
              SizedBox(height: 30.h),
            ],
          ).paddingSymmetric(horizontal: 24.w),
        ),
      ),
    );
  }
}
