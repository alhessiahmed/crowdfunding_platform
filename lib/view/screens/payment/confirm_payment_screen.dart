import 'package:crowdfunding_platform/controller/core/constants/colors_manager.dart';
import 'package:crowdfunding_platform/controller/core/constants/images_manager.dart';
import 'package:crowdfunding_platform/controller/core/routes/routes_manager.dart';
import 'package:crowdfunding_platform/controller/getx/controllers/payment/confirm_payment_controller.dart';
import 'package:crowdfunding_platform/model/donation_summary.dart';
import 'package:crowdfunding_platform/view/widgets/custom_app_bar.dart';
import 'package:crowdfunding_platform/view/widgets/details_card.dart';
import 'package:crowdfunding_platform/view/widgets/donation_summary_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class ConfirmPaymentScreen extends GetView<ConfirmPaymentController> {
  const ConfirmPaymentScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final sectionTitleStyle = Theme.of(context).textTheme.bodyMedium?.copyWith(
      color: Theme.of(context).colorScheme.primary,
      fontWeight: FontWeight.bold,
    );
    final labelStyle = Theme.of(context).textTheme.bodySmall?.copyWith(
      color: Theme.of(context).colorScheme.primary,
      fontWeight: FontWeight.w600,
    );
    final valueStyle = Theme.of(context).textTheme.bodySmall?.copyWith(
      color: ColorsManager.primaryCTA,
      fontWeight: FontWeight.w600,
    );
    final totalStyle = Theme.of(context).textTheme.bodySmall?.copyWith(
      color: ColorsManager.primaryCTA,
      fontWeight: FontWeight.bold,
    );

    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
              child: ListView(
                padding: EdgeInsets.symmetric(horizontal: 24.w, vertical: 16.h),
                children: [
                  CustomAppBar(
                    title: 'Confirmation_of_donation'.tr,
                    onIconTap: () => Get.back(),
                  ),
                  SizedBox(height: 16.h),
                  Text('Donation_Summary'.tr, style: sectionTitleStyle),
                  SizedBox(height: 8.h),
                  DonationSummaryCard(
                    summary: DonationSummary(
                      numberStars: controller.numberStars,
                      amount: controller.donationAmount,
                      title: 'Donation_Summary'.tr,
                      campaignImage: ImagesManager.placeHolder,
                      currency: 'Shakel'.tr,
                    ),
                  ),
                  SizedBox(height: 16.h),
                  Text('Donation_details'.tr, style: sectionTitleStyle),
                  SizedBox(height: 8.h),
                  DetailsCard(
                    labelStyle: labelStyle,
                    valueStyle: valueStyle,
                    totalStyle: totalStyle,
                    numberStars: controller.numberStars,
                    maskedCardNumber: controller.maskedCardNumber,
                    donationAmount: controller.donationAmount,
                    serviceFees: controller.serviceFees,
                    totalAmount: controller.totalAmount,
                  ),
                  SizedBox(height: 24.h),
                ],
              ),
            ),
            Padding(
              padding: EdgeInsets.fromLTRB(24.w, 0, 24.w, 16.h),
              child: Column(
                children: [
                  ElevatedButton(
                    onPressed: () {
                      Get.toNamed(RoutesManager.thanksForPaymentScreen);
                    },
                    child: Text(
                      '${'Confirmation_of_donation_amount'.tr} ',
                      textAlign: TextAlign.center,
                    ),
                  ),
                  SizedBox(height: 16.h),
                  Text(
                    'The_payment_process_is_secure_and_fully encrypted.'.tr,
                    textAlign: TextAlign.center,
                    style: Theme.of(context).textTheme.bodySmall?.copyWith(
                      color: Theme.of(context).colorScheme.primary,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
