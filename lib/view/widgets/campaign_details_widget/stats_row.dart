

import 'package:crowdfunding_platform/controller/core/constants/colors_manager.dart';
import 'package:crowdfunding_platform/controller/core/constants/images_manager.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
class StatsRow extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: const [
        _StatItem(
          value: '21',
          label: 'أيام الحملة',
          icon: ImagesManager.calender2,
        ),
        _StatItem(
          value: '400',
          label: 'عدد الداعمين',
          icon: ImagesManager.profile2user,
        ),
        _StatItem(value: '10k', label: 'أثر المبادرة', icon: ImagesManager.cup),
      ],
    );
  }
}

class _StatItem extends StatelessWidget {
  const _StatItem({
    required this.value,
    required this.label,
    required this.icon,
  });

  final String value;
  final String label;
  final String icon;

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;
    final cardColor = isDark ? ColorsManager.bgGoogle : ColorsManager.white;
    return Container(
      width: 105.w,
      height: 127.h,
      padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 16.h),

      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(32.r),
        color: cardColor,
        boxShadow: [
          BoxShadow(
            color: Colors.black12,
            blurRadius: 12,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Column(
        children: [
          Container(
            width: 44.w,
            height: 44.w,
            decoration: BoxDecoration(
              color: Get.isDarkMode
                  ? ColorsManager.dividerColorDark
                  : ColorsManager.dividerColorLight,
              //borderRadius: BorderRadius.circular(14.r),
              shape: BoxShape.circle,
            ),
            child: SvgPicture.asset(
              icon,
              color: Get.isDarkMode
                  ? ColorsManager.iconDefaultDark
                  : ColorsManager.iconDefaultLight,
              fit: BoxFit.scaleDown,
            ),
          ),
          SizedBox(height: 6.h),
          Text(
            value,
            style: TextStyle(
              fontWeight: FontWeight.w700,
              fontSize: 14.sp,
              color: ColorsManager.primaryCTA,
            ),
          ),
          SizedBox(height: 2.h),
          Text(
            label,
            style: TextStyle(
              fontSize: 11.sp,
              color: Get.isDarkMode
                  ? ColorsManager.secondaryDark
                  : ColorsManager.secondaryLight,
            ),
          ),
        ],
      ),
    );
  }
}
