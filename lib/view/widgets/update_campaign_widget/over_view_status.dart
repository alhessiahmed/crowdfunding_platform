import 'package:crowdfunding_platform/controller/core/constants/colors_manager.dart';
import 'package:crowdfunding_platform/controller/core/constants/images_manager.dart';
import 'package:crowdfunding_platform/view/widgets/update_campaign_widget/app_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

class OverViewStatus extends StatelessWidget {
  const OverViewStatus({
    super.key,
    required this.totalStars,
    required this.supporters,
    required this.daysRemaining,
  });

  final int totalStars;
  final int supporters;
  final int daysRemaining;

  @override
  Widget build(BuildContext context) {
    final numberFormatter = NumberFormat('#,###');

    final colorScheme = Theme.of(context).colorScheme;
    final labelStyle = Theme.of(context).textTheme.bodySmall?.copyWith(
      color: Theme.of(context).colorScheme.onSurfaceVariant,
    );
    final valueStyle = Theme.of(context).textTheme.headlineSmall?.copyWith(
      color: colorScheme.primary,
      fontWeight: FontWeight.bold,
    );

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,

      children: [
        AppCard(
          padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 14.h),
          child: Row(
            children: [
              SizedBox(width: 40.w),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('Total_stars_collected'.tr, style: labelStyle),
                  SizedBox(height: 4.h),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Text(
                        numberFormatter.format(totalStars),
                        style: Theme.of(context).textTheme.headlineSmall
                            ?.copyWith(
                              color: ColorsManager.primaryCTA,
                              fontWeight: FontWeight.bold,
                            ),
                      ),
                      SizedBox(width: 4.w),
                      SvgPicture.asset(
                        ImagesManager.star,
                        width: 16.w,
                        height: 16.h,
                        fit: BoxFit.contain,
                      ),
                    ],
                  ),
                ],
              ),
            ],
          ),
        ),
        SizedBox(height: 12.h),
        Row(
          children: [
            Expanded(
              child: _MiniStatCard(
                iconPath: ImagesManager.profile2user,
                label: 'Supporters'.tr,
                value: numberFormatter.format(supporters),
                labelStyle: labelStyle,
                valueStyle: valueStyle,
              ),
            ),

            SizedBox(width: 12.w),
            Expanded(
              child: _MiniStatCard(
                iconPath: ImagesManager.remainingDaysIcon,
                label: 'Days_remaining'.tr,
                value: numberFormatter.format(daysRemaining),
                labelStyle: labelStyle,
                valueStyle: valueStyle,
              ),
            ),
          ],
        ),
      ],
    );
  }
}

class _MiniStatCard extends StatelessWidget {
  const _MiniStatCard({
    required this.iconPath,
    required this.label,
    required this.value,
    required this.labelStyle,
    required this.valueStyle,
  });

  final String iconPath;
  final String label;
  final String value;
  final TextStyle? labelStyle;
  final TextStyle? valueStyle;

  @override
  Widget build(BuildContext context) {
    return AppCard(
      padding: EdgeInsets.symmetric(vertical: 14.h, horizontal: 8.w),
      child: Row(
        children: [
          SizedBox(width: 40.w),

          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  SvgPicture.asset(
                    iconPath,
                    width: 16.w,
                    height: 16.h,
                  ),
                  SizedBox(width: 6.w),
                  Flexible(
                    child: Text(
                      label,
                      style: labelStyle,
                      textAlign: TextAlign.center,
                    ),
                  ),
                ],
              ),
              SizedBox(height: 8.h),
              Text(value, style: valueStyle),
            ],
          ),
        ],
      ),
    );
  }
}
