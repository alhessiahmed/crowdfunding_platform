import 'package:crowdfunding_platform/controller/core/constants/images_manager.dart';
import 'package:crowdfunding_platform/controller/getx/controllers/payment/payment_controller.dart';
import 'package:crowdfunding_platform/controller/core/routes/routes_manager.dart';
import 'package:crowdfunding_platform/model/donation_summary.dart';
import 'package:crowdfunding_platform/model/payment_method.dart';
import 'package:crowdfunding_platform/view/widgets/custom_app_bar.dart';
import 'package:crowdfunding_platform/view/widgets/donation_summary_card.dart';
import 'package:crowdfunding_platform/view/widgets/payment_method_tile.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class PaymentMethodScreens extends GetView<PaymentController> {
  const PaymentMethodScreens({super.key});
  @override
  Widget build(BuildContext context) {
    final int starNo = (Get.arguments is int) ? Get.arguments as int : 50;
    final paymentMethods = [
      PaymentMethod(
        type: PaymentType.visa,
        title: 'bank_card'.tr,
        assetIcon: ImagesManager.visaPaymentIcon,
      ),
      PaymentMethod(
        type: PaymentType.applePay,
        title: 'Apple pay',
        assetIcon: ImagesManager.applePayIcon,
      ),
      PaymentMethod(
        type: PaymentType.paypal,
        title: 'Paypal',
        assetIcon: ImagesManager.paypalPaymentIcon,
      ),
    ];

    return Scaffold(
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CustomAppBar(title: 'payment_method'.tr),
            SizedBox(height: 16.h),
            Text(
              'Donation_Summary'.tr,
              style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                color: Theme.of(context).colorScheme.primary,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 8.h),
            DonationSummaryCard(
              summary: DonationSummary(
                numberStars: starNo,
                amount: starNo *100,
                title: 'قطرة حياة : مياه نظيفة لأطفال غزة',
                campaignImage: ImagesManager.placeHolder,
                currency: 'Shakel'.tr,
              ),
            ),
            SizedBox(height: 16.h),
            Text(
              'payment_method'.tr,
              style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                color: Theme.of(context).colorScheme.primary,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 8.h),
            Obx(() {
              final selectedType = controller.selectedPaymentType.value;
              return Expanded(
                flex: 3,
                child: ListView.builder(
                  itemCount: paymentMethods.length,
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  itemBuilder: (context, index) {
                    final method = paymentMethods[index];
                    final isSelected = method.type == selectedType;

                    return PaymentMethodTile(
                      title: method.title,
                      isSelected: isSelected,
                      iconAsset: method.assetIcon,
                      onTap: () => controller.selectPaymentMethod(method.type),
                    ).paddingOnly(bottom: 8.h);
                  },
                ),
              );
            }),
            Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  ElevatedButton(
                    onPressed: () {
                      if (controller.selectedPaymentType.value ==
                          PaymentType.visa) {
                        Get.toNamed(RoutesManager.creditCardPaymentScreen);
                      }
                    },
                    child: Text(
                      'Payment_tracking'.tr,
                      textAlign: TextAlign.center,
                    ),
                  ),
                  SizedBox(height: 24.h),
                  Text(
                    'All_payments_are_secure_and_encrypted.'.tr,
                    textAlign: TextAlign.center,
                    style: Theme.of(context).textTheme.bodySmall?.copyWith(
                      color: Theme.of(context).colorScheme.primary,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ).paddingSymmetric(horizontal: 24.w),
      ),
    );
  }
}
