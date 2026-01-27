import 'package:crowdfunding_platform/controller/core/constants/colors_manager.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class InfoCard extends StatelessWidget {
  final String iconPath;
  final String title;

  const InfoCard({super.key, required this.iconPath, required this.title});

  @override
  Widget build(BuildContext context) {
    final bool isDark = Get.isDarkMode;

    return Container(
      padding: EdgeInsets.symmetric(horizontal: 8.w, vertical: 16.h),
      decoration: BoxDecoration(
        color: isDark ? ColorsManager.bgGoogle : ColorsManager.white,
        borderRadius: BorderRadius.circular(16.r),
        border: Border.all(
          color: isDark
              ? ColorsManager.dividerColorDark
              : ColorsManager.dividerColorLight,
        ),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.1),
            blurRadius: 1,
            offset: const Offset(0, 1),
          ),
        ],
      ),
      child: Row(
        children: [
          SizedBox(width: 10.w),
          Image.asset(iconPath),
          SizedBox(width: 10.w),
          Expanded(
            child: Text(
              title,
              style: Theme.of(
                context,
              ).textTheme.bodySmall!.copyWith(fontSize: 12.sp),
            ),
          ),
        ],
      ),
    );
  }
}
