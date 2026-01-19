

import 'package:crowdfunding_platform/controller/core/constants/colors_manager.dart';
import 'package:crowdfunding_platform/controller/core/constants/images_manager.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
class WhyDonateSection extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final cardColor = Theme.of(context).brightness == Brightness.dark
        ? ColorsManager.bgGoogle
        : ColorsManager.white;
    final checkIcon = Get.isDarkMode
        ? ImagesManager.checkIconDark
        : ImagesManager.checkIconLight;
    return Container(
      padding: EdgeInsets.all(16.w),
      decoration: BoxDecoration(borderRadius: BorderRadius.circular(20.r)),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'لماذا نحتاج دعمك ؟',
            style: Theme.of(context).textTheme.bodyMedium?.copyWith(
              fontWeight: FontWeight.w700,
              color: Get.isDarkMode
                  ? ColorsManager.secondaryDark
                  : ColorsManager.primaryLight,
            ),
          ),
          SizedBox(height: 15.h),
          _BulletItem(
            icon: checkIcon,
            text: 'نوفر مياه نظيفة تدعم النمو الصحي للأطفال',
          ),
          _BulletItem(
            icon: checkIcon,
            text: 'نقلل مخاطر الأمراض المرتبطة بتلوث المياه',
          ),
          _BulletItem(
            icon: checkIcon,
            text: 'نعيد الأمل ونحسن الصحة العامة للأسر',
          ),
          _BulletItem(
            icon: checkIcon,
            text: 'نساعد المدارس والمراكز الطبية والمخيمات',
          ),
        ],
      ),
    );
  }
}

class _BulletItem extends StatelessWidget {
  const _BulletItem({required this.icon, required this.text});

  final String icon;
  final String text;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(bottom: 10.h),
      child: Row(
        children: [
          SvgPicture.asset(
            icon,
            width: 18.w,
            color: Get.isDarkMode
                ? ColorsManager.lightBg
                : ColorsManager.primaryLight,
          ),
          SizedBox(width: 8.w),
          Expanded(
            child: Text(
              text,
              textAlign: TextAlign.right,
              style: TextStyle(
                fontSize: 12.sp,
                color: Get.isDarkMode
                    ? ColorsManager.secondaryDark
                    : ColorsManager.secondaryLight,
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
