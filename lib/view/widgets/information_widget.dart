import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

import '../../controller/core/constants/colors_manager.dart';

class InformationWIdget extends StatelessWidget {
  const InformationWIdget({
    required this.text,
    required this.height,
    required this.width,
    required this.imgPath,
    super.key,
  });
  final String text;
  final double height;
  final double width;
  final String imgPath;
  @override
  Widget build(BuildContext context) {
    return Container(
      height: height,
      padding: EdgeInsets.all(16.r),
      decoration: BoxDecoration(
        color: Get.isDarkMode ? ColorsManager.bgGoogle : ColorsManager.white,
        borderRadius: BorderRadius.circular(16.r),
        boxShadow: [
          BoxShadow(color: Colors.black.withOpacity(0.25), blurRadius: 1),
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
          SizedBox(
            width: width,
            // height: 72.h,
            child: Text(
              text,
              style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                fontSize: 12.sp,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
