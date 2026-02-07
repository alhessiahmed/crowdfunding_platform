import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

import '../../controller/core/constants/colors_manager.dart';

class SelectionCard extends StatelessWidget {
  const SelectionCard({
    super.key,
    required this.title,
    required this.subtitle,
    required this.isSelected,
    required this.iconPath,
    required this.onTap,
  });

  final String title;
  final String subtitle;
  final bool isSelected;
  final String iconPath;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    final bool isDark = Get.isDarkMode;

    /// Background color
    final Color backgroundColor = isSelected
        ? (isDark ? ColorsManager.bgSectionDark : ColorsManager.bgSectionLight)
        : (isDark ? ColorsManager.bgGoogle : ColorsManager.white);

    /// Border (only when selected)
    final Border? border = isSelected
        ? Border.all(
            color: isDark
                ? ColorsManager.dividerColorDark
                : ColorsManager.dividerColorLight,
          )
        : null;

    /// Shadow (only when NOT selected)
    final List<BoxShadow>? shadow = !isSelected
        ? [
            BoxShadow(
              color: Colors.black.withOpacity(0.1),
              blurRadius: 1,
              offset: const Offset(0, 1),
            ),
          ]
        : null;

    return InkWell(
      borderRadius: BorderRadius.circular(16.r),
      onTap: onTap,
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 8.w, vertical: 16.h),
        decoration: BoxDecoration(
          color: backgroundColor,
          borderRadius: BorderRadius.circular(16.r),
          border: border,
          boxShadow: shadow,
        ),
        child: Column(
          children: [
            Row(
              children: [
                SizedBox(width: 24.w),
                SvgPicture.asset(iconPath),
                SizedBox(width: 32.w),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      title,
                      style: Theme.of(
                        context,
                      ).textTheme.bodyLarge!.copyWith(fontSize: 16.sp),
                    ),
                    SizedBox(height: 4.h),
                    SizedBox(
                      width: 169.w,
                      child: Text(
                        subtitle,
                        style: Theme.of(
                          context,
                        ).textTheme.bodyMedium!.copyWith(fontSize: 12.sp),
                      ),
                    ),
                  ],
                ),
                Spacer(),
                Icon(
                  isSelected
                      ? Icons.radio_button_checked
                      : Icons.radio_button_off,
                  color: isDark
                      ? ColorsManager.primaryTextDark
                      : Theme.of(context).colorScheme.primary,
                  size: 24.r,
                ),
                SizedBox(width: 24.w),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
