import 'package:crowdfunding_platform/controller/core/constants/images_manager.dart';
import 'package:crowdfunding_platform/view/widgets/update_campaign_widget/app_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get_utils/src/extensions/internacionalization.dart';
import 'package:intl/intl.dart';

class InProcessingWithdrawalProcessingListTile extends StatelessWidget {
  const InProcessingWithdrawalProcessingListTile({
    super.key,
    required this.amount,
  });
  final int amount;
  @override
  Widget build(BuildContext context) {
    final numberFormatter = NumberFormat('#,###');
    return AppCard(
      padding: EdgeInsets.symmetric(vertical: 16.h, horizontal: 8.w),
      child: ListTile(
        contentPadding: EdgeInsets.zero,
        leading: SvgPicture.asset(
          ImagesManager.onprogressIcon,
          height: 44.h,
          width: 44.w,
        ),
        title: Text(
          'Withdrawal pending processing'.trParams({
            'amount': numberFormatter.format(amount),
          }),
          style: Theme.of(context).textTheme.bodyMedium?.copyWith(
            color: Theme.of(context).colorScheme.primary,
            fontWeight: FontWeight.bold,
            fontSize: 12.sp,
          ),
        ),

        trailing: SvgPicture.asset(
          ImagesManager.arrowLeftIcon,
          height: 16.h,
          width: 16.w,
        ),
      ),
    );
  }
}
