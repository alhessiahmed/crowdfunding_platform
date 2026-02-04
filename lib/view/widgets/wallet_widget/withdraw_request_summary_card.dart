import 'package:crowdfunding_platform/controller/core/constants/colors_manager.dart';
import 'package:crowdfunding_platform/view/widgets/update_campaign_widget/app_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intl/intl.dart' as intl;

class WithdrawRequestSummaryCard extends StatelessWidget {
  const WithdrawRequestSummaryCard({
    super.key,
    required this.listOfSummaryItems,
  });
  final List<Widget> listOfSummaryItems;
  @override
  Widget build(BuildContext context) {
    return AppCard(
      borderRadius: 32.r,
      padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 32.h),
      child: Column(children: listOfSummaryItems),
    );
  }
}

class TextOfTheSummary extends StatelessWidget {
  const TextOfTheSummary({
    super.key,
    required this.title,
    this.value,
    required this.thrillingText,
  });
  final String title;
  final int? value;
  final String thrillingText;
  @override
  Widget build(BuildContext context) {
    final numberFormatter = intl.NumberFormat('#,###');
    final formattedValue = value != null ? numberFormatter.format(value) : '';

    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          title,
          style: Theme.of(
            context,
          ).textTheme.bodySmall?.copyWith(color: ColorsManager.secondaryLight),
        ),
        Row(
          children: [
            Text(
              ' $formattedValue',
              textDirection: TextDirection.ltr,
              style: Theme.of(context).textTheme.bodySmall?.copyWith(
                color: ColorsManager.secondaryLight,
              ),
            ),
            Text(
              thrillingText,
              style: Theme.of(context).textTheme.bodySmall?.copyWith(
                color: ColorsManager.secondaryLight,
              ),
            ),
          ],
        ),
      ],
    );
  }
}
