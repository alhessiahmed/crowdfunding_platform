import 'package:crowdfunding_platform/controller/core/constants/colors_manager.dart';
import 'package:crowdfunding_platform/controller/core/constants/images_manager.dart';
import 'package:crowdfunding_platform/view/widgets/payment_method_and_info/enter_card_payment_Info_section.dart';
import 'package:crowdfunding_platform/view/widgets/update_campaign_widget/appbar_section.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:crowdfunding_platform/controller/getx/controllers/payment/add_payment_method_controller.dart';

class AddPaymentMethodPage extends GetView<AddPaymentMethodController> {
  const AddPaymentMethodPage({super.key});

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
            AppbarSection(
              title: 'Add_a_new_card'.tr,
              subTitle: '',
              onBack: controller.onBack,
            ),
            Expanded(
              child: EnterCardPaymentInfoSection(
                sectionTitleStyle: sectionTitleStyle,
                cardNumberController: controller.cardNumberController,
                expiryDateController: controller.expiryDateController,
                securityCodeController: controller.securityCodeController,
                cardholderNameController: controller.cardholderNameController,
                titlePrefix: SvgPicture.asset(
                  ImagesManager.visaCardsIcon,
                  fit: BoxFit.contain,
                  colorFilter: ColorFilter.mode(
                    ColorsManager.iconDefaultLight,
                    BlendMode.srcIn,
                  ),
                ).paddingOnly(left: 8),
              ),
            ),
            ElevatedButton(onPressed: () {}, child: Text('Save_card'.tr)),
            SizedBox(height: 4.h),

            Text(
              'All_card_data_is_protected_and_encrypted.'.tr,
              style: Theme.of(context).textTheme.bodySmall?.copyWith(
                color: Theme.of(context).colorScheme.primary,
              ),
              textAlign: TextAlign.center,
            ),
            SizedBox(height: 16.h),
          ],
        ).paddingSymmetric(horizontal: 24),
      ),
    );
  }
}
