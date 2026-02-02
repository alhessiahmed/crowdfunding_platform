

import 'package:crowdfunding_platform/controller/core/constants/colors_manager.dart';
import 'package:crowdfunding_platform/controller/core/constants/images_manager.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
class TopCampaignCard extends StatelessWidget {
  const TopCampaignCard({super.key});

  @override
  Widget build(BuildContext context) {
    final cardColor = Get.isDarkMode
        ? ColorsManager.bgGoogle
        : ColorsManager.white;
    return Column(
      children: [
        Container(
          padding: EdgeInsets.all(30.w),
          decoration: BoxDecoration(
            color: cardColor,
            borderRadius: BorderRadius.circular(32.r),
            boxShadow: [
              BoxShadow(
                color: Colors.black12,
                blurRadius: 14,
                offset: const Offset(0, 6),
              ),
            ],
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  SvgPicture.asset(ImagesManager.star, width: 16.w),
                  SizedBox(width: 6.w),
                  Text(
                    '5,000',
                    style: TextStyle(
                      color: ColorsManager.primaryCTA,
                      fontWeight: FontWeight.bold,
                      fontSize: 16.sp,
                    ),
                  ),
                  Spacer(),
                  Text(
                    'الهدف: 10,000 نجمة',
                    style: TextStyle(
                      color: Get.isDarkMode
                          ? ColorsManager.secondaryDark
                          : ColorsManager.primaryLight,
                      fontSize: 12.sp,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ],
              ),
              SizedBox(height: 12.h),
              LayoutBuilder(
                builder: (context, constraints) {
                  return Container(
                    height: 10.h,
                    decoration: BoxDecoration(
                      color: ColorsManager.white,
                      borderRadius: BorderRadius.circular(12.r),
                    ),
                    child: Stack(
                      children: [
                        Container(
                          height: 8.h,
                          decoration: BoxDecoration(
                            boxShadow: [
                              BoxShadow(
                                color: Colors.black12,
                                blurRadius: 12,
                                offset: const Offset(0, 4),
                              ),
                            ],
                            color: ColorsManager.white,
                            borderRadius: BorderRadius.circular(12.r),
                          ),
                        ),
                        AnimatedContainer(
                          duration: const Duration(milliseconds: 900),
                          curve: Curves.easeInOut,
                          width: constraints.maxWidth * .5,
                          decoration: BoxDecoration(
                            color: ColorsManager.primaryCTA,
                            borderRadius: BorderRadius.circular(12.r),
                          ),
                        ),
                      ],
                    ),
                  );
                },
              ),

              SizedBox(height: 16.h),
              Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  SvgPicture.asset(
                    ImagesManager.trendUp,

                    color: Get.isDarkMode
                        ? ColorsManager.white
                        : ColorsManager.secondaryLight,
                  ),
                  SizedBox(width: 6.w),
                  Text(
                    '135 داعمًا حتى الآن (هذا الأسبوع)',
                    style: TextStyle(
                      fontSize: 11.sp,
                      color: Get.isDarkMode
                          ? ColorsManager.secondaryDark
                          : ColorsManager.primaryLight,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ],
    );
  }
}