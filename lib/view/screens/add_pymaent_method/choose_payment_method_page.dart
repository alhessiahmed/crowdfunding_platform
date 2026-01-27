import 'package:crowdfunding_platform/controller/core/constants/images_manager.dart';
import 'package:crowdfunding_platform/controller/core/routes/routes_manager.dart';
import 'package:crowdfunding_platform/controller/getx/controllers/payment/choose_payment_method_controller.dart';
import 'package:crowdfunding_platform/view/widgets/add_update_to_campagin_screen.dart/bank_account_card.dart';
import 'package:crowdfunding_platform/view/widgets/add_update_to_campagin_screen.dart/fast_payment_option_section.dart';
import 'package:crowdfunding_platform/view/widgets/add_update_to_campagin_screen.dart/payment_card_listTile.dart';
import 'package:crowdfunding_platform/view/widgets/update_campaign_widget/appbar_section.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

class ChoosePaymentMethodPage extends GetView<ChoosePaymentMethodController> {
  const ChoosePaymentMethodPage({super.key});

  @override
  Widget build(BuildContext context) {
    const endDate = '12/25';
    const endDate2 = '12/26';

    return Scaffold(
      body: SafeArea(
        child: CustomScrollView(
          slivers: [
            SliverPadding(
              padding: EdgeInsets.symmetric(horizontal: 24.w),
              sliver: SliverToBoxAdapter(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    AppbarSection(
                      title: 'Payment_methods'.tr,
                      subTitle:
                          'Choose_the_most_convenient_way_to_buy_stars_and_donate_easily.'
                              .tr,
                    ),
                    SizedBox(height: 24.h),
                    Text(
                      'Saved_cards'.tr,
                      style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                        color: Theme.of(context).colorScheme.primary,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(height: 8.h),
                    PaymentCardListTile(
                      endDate: endDate,
                      visaNumber: 'visa **** 4242',
                      isDefault: true,
                    ),
                    SizedBox(height: 8.h),
                    PaymentCardListTile(
                      endDate: endDate2,
                      visaNumber: 'visa **** 4256',
                      isDefault: false,
                    ),
                    SizedBox(height: 16.h),
                    ElevatedButton(
                      onPressed: () {
                        Get.toNamed(RoutesManager.addPaymentMethodScreen);
                      },
                      child: Text('Add_a_new_card'.tr),
                    ),
                    SizedBox(height: 24.h),
                    Text(
                      'Fast_payment'.tr,
                      style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                        color: Theme.of(context).colorScheme.primary,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(height: 8.h),
                    FastPaymentOptionSection(),
                    SizedBox(height: 24.h),
                    Text(
                      'bank_accounts'.tr,
                      style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                        color: Theme.of(context).colorScheme.primary,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    BankAccountCard(
                      title: 'بنك فلسطين',
                      statusText: 'Verified'.tr,
                      subtitle: 'pal8 **** **** **** 0002',
                      statusIcon: SvgPicture.asset(ImagesManager.verifiedIcon),
                    ),
                  ],
                ),
              ),
            ),
            const SliverFillRemaining(
              hasScrollBody: false,
              child: SizedBox.shrink(),
            ),
            SliverPadding(
              padding: EdgeInsets.fromLTRB(24.w, 0, 24.w, 16.h),
              sliver: SliverToBoxAdapter(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SvgPicture.asset(
                      ImagesManager.infoIcon,
                      width: 18.w,
                      height: 18.h,
                    ),
                    SizedBox(width: 8.w),

                    Flexible(
                      child: Text(
                        'All_card_data_is_protected_and_encrypted.'.tr,
                        textAlign: TextAlign.center,
                        style: Theme.of(context).textTheme.bodySmall?.copyWith(
                          color: Theme.of(context).colorScheme.primary,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
