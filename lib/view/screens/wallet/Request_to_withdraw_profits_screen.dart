import 'package:crowdfunding_platform/controller/core/constants/images_manager.dart';
import 'package:crowdfunding_platform/controller/core/routes/routes_manager.dart';
import 'package:crowdfunding_platform/controller/getx/controllers/wallet/request_to_withdraw_profits_controller.dart';
import 'package:crowdfunding_platform/view/widgets/card_divider.dart';
import 'package:crowdfunding_platform/view/widgets/text_field_widget.dart';
import 'package:crowdfunding_platform/view/widgets/update_campaign_widget/appbar_section.dart';
import 'package:crowdfunding_platform/view/widgets/wallet_widget/balance_card_widget.dart';
import 'package:crowdfunding_platform/view/widgets/wallet_widget/bank_list_tile_widget.dart';
import 'package:crowdfunding_platform/view/widgets/wallet_widget/donte_row_star.dart';
import 'package:crowdfunding_platform/view/widgets/wallet_widget/withdraw_request_summary_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

class RequestToWithdrawProfitsScreen
    extends GetView<RequestToWithdrawProfitsController> {
  const RequestToWithdrawProfitsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 24.w),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                AppbarSection(title: 'Request_to_withdraw_profits'.tr),
                SizedBox(height: 16.h),
                BalanceCardWidget(
                  totalStares: controller.totalStares,
                  mony: controller.mony,
                  showRequestButton: false,
                ),
                SizedBox(height: 16.h),
                Text(
                  'Number_of_stars_you_want_to_convert'.tr,
                  style: Theme.of(context).textTheme.bodySmall?.copyWith(
                    color: Theme.of(context).colorScheme.primary,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: 8.h),

                DonateStarRow(),
                // SizedBox(height: 8.h),
                TextFieldWidget(
                  controller: controller.customStarsController,
                  hintText: 'Another_number...'.tr,
                  label: '',
                  prefixIcon: SvgPicture.asset(
                    ImagesManager.magicPenIcon,
                    width: 24.w,
                    height: 24.h,
                  ),
                  keyboardType: TextInputType.number,
                ),
                SizedBox(height: 16.h),
                Text(
                  'bank_account'.tr,
                  style: Theme.of(context).textTheme.bodySmall?.copyWith(
                    color: Theme.of(context).colorScheme.primary,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: 8.h),
                BankListTileWidget(bankName: 'البنك التجاري', isSelected: true),
                SizedBox(height: 16.h),
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
                    CardDivider(),
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
                  ],
                ),
                SizedBox(height: 16.h),
                ElevatedButton(
                  onPressed: () {
                    Get.toNamed(RoutesManager.summerOfWithdrawScreen);
                  },
                  child: Text('Confirm_withdrawal_request'.tr),
                ),
                SizedBox(height: 8.h),
                Align(
                  alignment: Alignment.center,
                  child: Text(
                    'All_payments_are_secure_and_encrypted.'.tr,
                    style: Theme.of(context).textTheme.bodySmall?.copyWith(
                      color: Theme.of(context).colorScheme.primary,
                    ),
                  ),
                ),
                SizedBox(height: 16.h),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
