import 'package:crowdfunding_platform/controller/core/constants/colors_manager.dart';
import 'package:crowdfunding_platform/controller/core/constants/images_manager.dart';
import 'package:crowdfunding_platform/model/campagin_models/creator_campagin_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

class CommentSection extends StatelessWidget {
  const CommentSection({
    super.key,
    required this.creator,
  });

  final Creator creator;

  @override
  Widget build(BuildContext context) {
    final creatorName = creator.fullName.trim().isNotEmpty
        ? creator.fullName.trim()
        : 'صاحب الحملة';
    final creatorCountry = creator.country.trim().isNotEmpty
        ? creator.country.trim()
        : 'غير محدد';
    final initial = creatorName.isNotEmpty ? creatorName[0].toUpperCase() : '?';

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
            backgroundColor: ColorsManager.primaryCTA.withOpacity(0.12),
            child: Text(
              initial,
              style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                    color: ColorsManager.primaryCTA,
                    fontWeight: FontWeight.bold,
                  ),
            ),
          ),
          SizedBox(width: 10.w),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  creatorName,
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
                  creatorCountry,
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
          // Container(
          //   padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 6.h),
          //   decoration: BoxDecoration(
          //     color: ColorsManager.primaryCTA,
          //     borderRadius: BorderRadius.circular(20.r),
          //   ),
          //   child: Row(
          //     children: [
          //       Text(
          //         'متابعة',
          //         style: TextStyle(
          //           fontSize: 10.sp,
          //           fontWeight: FontWeight.w700,
          //           color: ColorsManager.white,
          //         ),
          //       ),
          //       SizedBox(width: 4.w),
          //       SvgPicture.asset(
          //         ImagesManager.notificationBing,
          //         colorFilter: const ColorFilter.mode(
          //           Colors.white,
          //           BlendMode.srcIn,
          //         ),
          //       ),
          //     ],
          //   ),
          // ),
        ],
      ),
    );
  }
}
