import 'package:crowdfunding_platform/controller/core/constants/images_manager.dart';
import 'package:crowdfunding_platform/controller/core/routes/routes_manager.dart';
import 'package:crowdfunding_platform/model/donation_summary.dart';
import 'package:crowdfunding_platform/view/widgets/custom_app_bar.dart';
import 'package:crowdfunding_platform/view/widgets/donation_summary_card.dart';
import 'package:crowdfunding_platform/view/widgets/payment_method_and_info/enter_card_payment_Info_section.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

class CreditCardPaymentScreen extends StatefulWidget {
  const CreditCardPaymentScreen({super.key});

  @override
  State<CreditCardPaymentScreen> createState() =>
      _CreditCardPaymentScreenState();
}

class _CreditCardPaymentScreenState extends State<CreditCardPaymentScreen> {
  final TextEditingController cardNumberController = TextEditingController();
  final TextEditingController expiryDateController = TextEditingController();
  final TextEditingController securityCodeController = TextEditingController();
  final TextEditingController cardholderNameController =
      TextEditingController();

  @override
  void dispose() {
    cardNumberController.dispose();
    expiryDateController.dispose();
    securityCodeController.dispose();
    cardholderNameController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final sectionTitleStyle = Theme.of(context).textTheme.bodyMedium?.copyWith(
      color: Theme.of(context).colorScheme.primary,
      fontWeight: FontWeight.bold,
    );

    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
              child: ListView(
                children: [
                  CustomAppBar(
                    title: 'Card_payment'.tr,
                    onIconTap: () => Get.back(),
                  ),
                  SizedBox(height: 16.h),
                  Text('Donation_Summary'.tr, style: sectionTitleStyle),
                  SizedBox(height: 8.h),
                  DonationSummaryCard(
                    summary: DonationSummary(
                      numberStars: 50,
                      amount: 500,
                      title: 'Donation_Summary'.tr,
                      campaignImage: ImagesManager.placeHolder,
                      currency: 'Shakel'.tr,
                    ),
                  ),
                  SizedBox(height: 16.h),
                  EnterCardPaymentInfoSection(
                    sectionTitleStyle: sectionTitleStyle,
                    cardNumberController: cardNumberController,
                    expiryDateController: expiryDateController,
                    securityCodeController: securityCodeController,
                    cardholderNameController: cardholderNameController,
                    titleSuffix: SvgPicture.asset(
                      ImagesManager.visaCardsIcon,
                      fit: BoxFit.contain,
                    ),
                  ),

                  SizedBox(height: 24.h),
                ],
              ),
            ),
            Column(
              children: [
                ElevatedButton(
                  onPressed: () {
                    Get.toNamed(RoutesManager.confirmPaymentScreen);
                  },
                  child: Text(
                    '${'Confirmation_of_donation_amount'.tr} ',
                    textAlign: TextAlign.center,
                  ),
                ),
                SizedBox(height: 16.h),
                Text(
                  'All_card_data_is_protected_and_encrypted.'.tr,
                  textAlign: TextAlign.center,
                  style: Theme.of(context).textTheme.bodySmall?.copyWith(
                    color: Theme.of(context).colorScheme.primary,
                  ),
                ),
              ],
            ),
            SizedBox(height: 16.h),
          ],
        ).paddingSymmetric(horizontal: 24.w),
      ),
    );
  }
}
