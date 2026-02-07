import 'package:crowdfunding_platform/controller/core/constants/colors_manager.dart';
import 'package:crowdfunding_platform/controller/core/constants/images_manager.dart';
import 'package:crowdfunding_platform/view/widgets/donar_home_screen_widget/donar_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get_utils/src/extensions/internacionalization.dart';

class PreviewInfoSection extends StatelessWidget {
  const PreviewInfoSection({
    super.key,
    required this.numberOfStars,
    required this.lifeAffected,
    required this.sponsoredCampaigns,
  });
  final int numberOfStars;
  final int lifeAffected;
  final int sponsoredCampaigns;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        DonarCard(numberOfStars: numberOfStars),
        SizedBox(height: 16.h),
        Row(
          children: [
            Expanded(
              child: _StatCard(
                icon: ImagesManager.sponsoredCampaignsIcon,
                value: sponsoredCampaigns,
                label: 'Sponsored_campaigns'.tr,
              ),
            ),
            SizedBox(width: 16.w),

            Expanded(
              child: _StatCard(
                icon: ImagesManager.lifeAffectedIcon,
                value: lifeAffected,
                label: 'Life_affected'.tr,
              ),
            ),
          ],
        ),
      ],
    );
  }
}

class _StatCard extends StatelessWidget {
  const _StatCard({
    required this.icon,
    required this.value,
    required this.label,
  });

  final String icon;
  final int value;
  final String label;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 18.h),
      decoration: BoxDecoration(
        color: ColorsManager.bgSectionLight,
        borderRadius: BorderRadius.circular(24.r),
        border: Border.all(color: ColorsManager.dividerColorLight),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Center(
            child: SvgPicture.asset(icon, width: 44.w, height: 44.h),
          ),
          SizedBox(height: 4.h),
          Text(
            '$value',
            style: Theme.of(context).textTheme.headlineLarge?.copyWith(
              color: ColorsManager.primaryLight,
              fontWeight: FontWeight.bold,
            ),
          ),
          SizedBox(height: 4.h),
          Text(
            label,
            style: Theme.of(context).textTheme.bodySmall?.copyWith(
              color: ColorsManager.secondaryLight,
              fontSize: 10.sp,
            ),
          ),
        ],
      ),
    );
  }
}
