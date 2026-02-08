import 'package:crowdfunding_platform/controller/core/constants/colors_manager.dart';
import 'package:crowdfunding_platform/controller/core/constants/images_manager.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get_utils/src/extensions/internacionalization.dart';
import 'package:intl/intl.dart';

class CampaignStarsInfo extends StatelessWidget {
  const CampaignStarsInfo({
    super.key,
    required this.currentStars,
    required this.totalStars,
  });
  final int currentStars;
  final int totalStars;

  @override
  Widget build(BuildContext context) {
    final percentage = ((currentStars / totalStars) * 100).toInt();
    final numberFormatter = NumberFormat('#,###');

    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Row(
          children: [
            SvgPicture.asset(ImagesManager.star),
            SizedBox(width: 4.h),
            Text(
              numberFormatter.format(currentStars),
              style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                color: Theme.of(context).colorScheme.primary,
              ),
            ),
            SizedBox(width: 4.h),
            Text(
              '/ ${numberFormatter.format(totalStars)} ${'star'.tr}',
              style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                color: Theme.of(context).colorScheme.primary,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
        Container(
          padding: EdgeInsets.symmetric(horizontal: 8.w, vertical: 4.h),
          decoration: BoxDecoration(
            color: ColorsManager.primaryCTA,
            borderRadius: BorderRadius.circular(4.r),
          ),
          child: Text(
            ' % $percentage ',
            style: Theme.of(context).textTheme.bodyMedium?.copyWith(
              color: Theme.of(context).colorScheme.onPrimary,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ],
    );
  }
}
