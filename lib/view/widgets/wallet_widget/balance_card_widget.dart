import 'package:crowdfunding_platform/controller/core/constants/colors_manager.dart';
import 'package:crowdfunding_platform/controller/core/constants/images_manager.dart';
import 'package:crowdfunding_platform/view/widgets/update_campaign_widget/app_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get_utils/src/extensions/internacionalization.dart';
import 'package:intl/intl.dart';

class BalanceCardWidget extends StatelessWidget {
  const BalanceCardWidget({
    super.key,
    required this.totalStares,
    required this.mony,
     this.onRequestWithdraw,
    this.showRequestButton = false,
  });
  final int totalStares;
  final int mony;
  final VoidCallback? onRequestWithdraw;
  final bool showRequestButton;
  @override
  Widget build(BuildContext context) {
    final numberFormatter = NumberFormat('#,###');
    return AppCard(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Available_balance'.tr,
            style: Theme.of(context).textTheme.bodySmall?.copyWith(
              color: ColorsManager.secondaryLight,
            ),
          ),
          SizedBox(height: 8.h),
          Row(
            children: [
              Text(
                numberFormatter.format(totalStares),
                style: Theme.of(context).textTheme.headlineLarge?.copyWith(
                  color: Theme.of(context).colorScheme.primary,
                ),
              ),
              SizedBox(width: 4.w),
              SvgPicture.asset(ImagesManager.star, width: 40.w, height: 40.h),
            ],
          ),
          Row(
            children: [
              Text(
                numberFormatter.format(mony),
                style: Theme.of(context).textTheme.bodySmall?.copyWith(
                  color: ColorsManager.secondaryLight,
                ),
              ),
              SizedBox(width: 1.w),
              Text(
                'Shakel'.tr,
                style: Theme.of(context).textTheme.bodySmall?.copyWith(
                  color: ColorsManager.secondaryLight,
                ),
              ),
            ],
          ),
          if (showRequestButton) ...[
            SizedBox(height: 8.h),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(28.r),
                ),
              ),
              onPressed: onRequestWithdraw,
              child: Text('Request_to_withdraw_profits'.tr),
            ),
          ],
        ],
      ),
    );
  }
}
