import 'package:crowdfunding_platform/controller/core/constants/colors_manager.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

class InformationCard extends StatelessWidget {
  const InformationCard({
    super.key,
    required this.title,
    required this.subTitle,
    required this.imgPath,
  });

  final String title;
  final String subTitle;
  final String imgPath;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 76.h,
      padding: EdgeInsets.all(16.r),
      decoration: BoxDecoration(
        color: Get.isDarkMode ? ColorsManager.bgGoogle : ColorsManager.white,
        borderRadius: BorderRadius.circular(16.r),
        boxShadow: [
          BoxShadow(color: Colors.black.withOpacity(0.25), blurRadius: 2),
        ],
      ),
      child: Row(
        children: [
          Container(
            width: 40.w,
            height: 40.h,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: Get.isDarkMode
                  ? ColorsManager.dividerColorDark
                  : ColorsManager.dividerColorLight,
            ),
            child: SvgPicture.asset(
              imgPath,
              height: 24.h,
              width: 24.w,
              fit: BoxFit.scaleDown,
              colorFilter: ColorFilter.mode(
                Get.isDarkMode
                    ? ColorsManager.iconDefaultDark
                    : ColorsManager.iconDefaultLight,
                BlendMode.srcIn,
              ),
            ),
          ),
          SizedBox(width: 10.w),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                title,
                style: Theme.of(
                  context,
                ).textTheme.bodyLarge!.copyWith(fontSize: 12.sp),
              ),
              SizedBox(height: 4.h),
              Text(
                subTitle,
                style: Theme.of(
                  context,
                ).textTheme.bodyMedium!.copyWith(fontSize: 10.sp),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
