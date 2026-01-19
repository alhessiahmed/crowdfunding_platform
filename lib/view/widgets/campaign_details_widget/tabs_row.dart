

import 'package:crowdfunding_platform/controller/core/constants/colors_manager.dart';
import 'package:crowdfunding_platform/controller/core/constants/images_manager.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
class TabsRow extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final cardColor = Get.isDarkMode
        ? ColorsManager.bgSectionDark
        : ColorsManager.bgSectionLight;
    return Container(
      padding: EdgeInsets.all(8.w),
      decoration: BoxDecoration(
        color: cardColor,
        borderRadius: BorderRadius.circular(30.r),
      ),
      child: Row(
        children: [
          _TabChip(text: 'التعليقات', isSelected: false),
          _TabChip(text: 'القصة', isSelected: false),
          _TabChip(text: 'نظرة عامة', isSelected: true),
        ],
      ),
    );
  }
}

class _TabChip extends StatelessWidget {
  const _TabChip({required this.text, required this.isSelected});

  final String text;
  final bool isSelected;

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;
    return Expanded(
      child: Container(
        padding: EdgeInsets.symmetric(vertical: 10.h),
        margin: EdgeInsets.symmetric(horizontal: 4.w),
        decoration: BoxDecoration(
          color: isSelected
              ? Get.isDarkMode
                    ? ColorsManager.bgGoogle
                    : ColorsManager.white
              : Colors.transparent,
          borderRadius: BorderRadius.circular(22.r),
        ),
        child: Text(
          text,
          textAlign: TextAlign.center,
          style: TextStyle(
            color: isSelected
                ? isDark
                      ? ColorsManager.primaryTextLight
                      : ColorsManager.primaryLight
                : isDark
                ? ColorsManager.white
                : ColorsManager.primaryLight,
            fontWeight: isSelected ? FontWeight.w700 : FontWeight.w500,
            fontSize: 16.sp,
          ),
        ),
      ),
    );
  }
}
