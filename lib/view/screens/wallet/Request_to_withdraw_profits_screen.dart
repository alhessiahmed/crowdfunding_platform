import 'package:crowdfunding_platform/controller/getx/controllers/wallet/request_to_withdraw_profits_controller.dart';
import 'package:crowdfunding_platform/view/widgets/update_campaign_widget/appbar_section.dart';
import 'package:crowdfunding_platform/view/widgets/wallet_widget/balance_card_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class RequestToWithdrawProfitsScreen
    extends GetView<RequestToWithdrawProfitsController> {
  const RequestToWithdrawProfitsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
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
          ],
        ).paddingSymmetric(horizontal: 24.w),
      ),
    );
  }
}
