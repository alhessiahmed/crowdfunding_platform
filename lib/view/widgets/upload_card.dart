import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import '../../controller/core/constants/colors_manager.dart';

class UploadCard extends StatelessWidget {
  const UploadCard({
    super.key,
    required this.title,
    required this.subtitle,
    required this.onTap,
    required this.imgPath,
  });

  final String title;
  final String subtitle;
  final VoidCallback onTap;
  final String imgPath;

  @override
  Widget build(BuildContext context) {
    return DottedBorder(
      borderType: BorderType.RRect,
      radius: Radius.circular(16.r),
      dashPattern: const [8, 8],
      color: ColorsManager.dottodBorderColor,
      strokeWidth: 2,
      child: ClipRRect(
        borderRadius: BorderRadius.all(Radius.circular(16.r)),
        child: InkWell(
          // borderRadius: BorderRadius.circular(16),
          onTap: onTap,
          child: Container(
            height: 170.h,
            color: Get.isDarkMode
                ? ColorsManager.bgGoogle
                : ColorsManager.white,
            width: double.infinity,
            child: Column(
              children: [
                SizedBox(height: 13.h),
                Container(
                  width: 80.w,
                  height: 80.h,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: Get.isDarkMode
                        ? ColorsManager.bgSectionDark
                        : ColorsManager.bgSectionLight,
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
                SizedBox(height: 8.h),
                Text(
                  title,
                  textAlign: TextAlign.center,
                  style: Theme.of(
                    context,
                  ).textTheme.bodyLarge!.copyWith(fontSize: 16.sp),
                ),
                SizedBox(height: 8.h),
                Text(
                  subtitle,
                  textAlign: TextAlign.center,
                  style: Theme.of(
                    context,
                  ).textTheme.bodyMedium!.copyWith(fontSize: 12.sp),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
