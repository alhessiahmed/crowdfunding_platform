import 'package:crowdfunding_platform/controller/core/constants/colors_manager.dart';
import 'package:crowdfunding_platform/controller/core/constants/images_manager.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

class CommentSection extends StatelessWidget {
  const CommentSection({super.key});

  @override
  Widget build(BuildContext context) {
    final cardColor = Theme.of(context).brightness == Brightness.dark
        ? ColorsManager.bgGoogle
        : ColorsManager.white;
    return Container(
      padding: EdgeInsets.all(12.w),
      decoration: BoxDecoration(
        color: cardColor,
        borderRadius: BorderRadius.circular(32.r),
        boxShadow: [
          BoxShadow(
            color: Colors.black12,
            blurRadius: 10,
            offset: const Offset(0, 3),
          ),
        ],
      ),
      child: Row(
        children: [
          CircleAvatar(
            radius: 20.r,
            backgroundImage: AssetImage(ImagesManager.test),
          ),
          SizedBox(width: 10.w),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'user name',
                  style: TextStyle(
                    fontSize: 12.sp,
                    fontWeight: FontWeight.w700,
                    color: Get.isDarkMode
                        ? ColorsManager.white
                        : ColorsManager.primaryLight,
                  ),
                ),
                SizedBox(height: 4.h),
                Text(
                  'location',
                  textAlign: TextAlign.right,
                  style: TextStyle(
                    fontSize: 11.sp,
                    color: Get.isDarkMode
                        ? ColorsManager.secondaryDark
                        : ColorsManager.secondaryLight,
                  ),
                ),
              ],
            ),
          ),
          Container(
            padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 6.h),
            decoration: BoxDecoration(
              color: ColorsManager.primaryCTA,
              borderRadius: BorderRadius.circular(20.r),
            ),
            child: Row(
              children: [
                Text(
                  'متابعة',
                  style: TextStyle(
                    fontSize: 10.sp,
                    fontWeight: FontWeight.w700,
                    color: ColorsManager.white,
                  ),
                ),
                SizedBox(width: 4.w),
                SvgPicture.asset(
                  ImagesManager.notificationBing,
                  color: Colors.white,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
