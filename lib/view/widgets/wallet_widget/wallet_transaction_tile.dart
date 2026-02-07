import 'package:crowdfunding_platform/controller/core/constants/colors_manager.dart';
import 'package:crowdfunding_platform/controller/core/constants/images_manager.dart';
import 'package:crowdfunding_platform/view/widgets/update_campaign_widget/app_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get_utils/src/extensions/internacionalization.dart';
import 'package:intl/intl.dart' as intl;

enum WalletTransactionType { withdraw, donation }

class WalletTransactionTile extends StatelessWidget {
  const WalletTransactionTile({
    super.key,
    required this.title,
    required this.dateText,
    required this.amount,
    required this.type,
  });

  final String title;
  final String dateText;
  final int amount;
  final WalletTransactionType type;

  @override
  Widget build(BuildContext context) {
    final isWithdraw = type == WalletTransactionType.withdraw;
    final numberFormatter = intl.NumberFormat('#,###');
    final amountText = numberFormatter.format(amount);
    final amountColor = isWithdraw
        ? ColorsManager.danger
        : ColorsManager.primaryCTA;
    final iconAsset = isWithdraw
        ? ImagesManager.withdrawIcon
        : ImagesManager.depositIcon;

    return AppCard(
      padding: EdgeInsets.symmetric(vertical: 16.h, horizontal: 8.w),
      child: Directionality(
        textDirection: TextDirection.rtl,
        child: ListTile(
          contentPadding: EdgeInsets.zero,
          leading: SvgPicture.asset(iconAsset, width: 40.w, height: 40.h),
          trailing: _AmountSection(
            amountText: amountText,
            amountColor: amountColor,
            showStar: !isWithdraw,
            showCurrency: isWithdraw,
            isWithdraw: isWithdraw,
          ),
          title: Text(
            title,
            style: Theme.of(context).textTheme.bodySmall?.copyWith(
              fontWeight: FontWeight.bold,
              color: Theme.of(context).colorScheme.primary,
            ),
          ),
          subtitle: Padding(
            padding: EdgeInsets.only(top: 8.h),
            child: Text(
              dateText,
              style: Theme.of(context).textTheme.bodySmall?.copyWith(
                color: ColorsManager.secondaryLight,
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class _AmountSection extends StatelessWidget {
  const _AmountSection({
    required this.amountText,
    required this.amountColor,
    required this.showStar,
    required this.showCurrency,
    required this.isWithdraw,
  });

  final String amountText;
  final Color amountColor;
  final bool showStar;
  final bool showCurrency;
  final bool isWithdraw;

  @override
  Widget build(BuildContext context) {
    return FittedBox(
      fit: BoxFit.scaleDown,
      alignment: Alignment.centerLeft,
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            amountText,
            textDirection: TextDirection.ltr,
            style:
                (isWithdraw
                        ? Theme.of(context).textTheme.bodySmall
                        : Theme.of(context).textTheme.bodyMedium)
                    ?.copyWith(fontWeight: FontWeight.bold, color: amountColor),
          ),
          if (showStar) ...[
            SizedBox(width: 6.w),
            SvgPicture.asset(ImagesManager.star, width: 16.w, height: 16.h),
          ],
          if (showCurrency) ...[
            SizedBox(width: 1.w),
            Text(
              'Shakel'.tr,
              style: Theme.of(context).textTheme.bodySmall?.copyWith(
                fontWeight: FontWeight.bold,
                color: amountColor,
              ),
            ),
          ],
          if (isWithdraw) ...[
            SizedBox(width: 4.w),
            Text(
              '-',
              style: Theme.of(context).textTheme.bodySmall?.copyWith(
                fontWeight: FontWeight.bold,
                color: amountColor,
              ),
            ),
          ],
        ],
      ),
    );
  }
}
