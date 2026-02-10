import 'package:crowdfunding_platform/controller/core/constants/colors_manager.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

class StatusCard extends StatelessWidget {
  const StatusCard({super.key , required this.title , required this.icon , required this.description});
final String title ; 
final String icon ;
final String description ;
  @override
  Widget build(BuildContext context) {
    return  Center(
              child: Container(
              //  height: 176.h,
                width: 345.w,
                padding: EdgeInsets.all(16.r),
                decoration: BoxDecoration(
                  color: Get.isDarkMode
                      ? ColorsManager.bgSectionDark
                      : ColorsManager.white,
                  borderRadius: BorderRadius.circular(16.r),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.25),
                      blurRadius: 2,
                    ),
                  ],
                  border: Border.all(
                    color: Get.isDarkMode
                        ? ColorsManager.dividerColorDark
                        : ColorsManager.dividerColorLight,
                  ),
                ),
                child: Column(
                
                  children: [
                      Stack(
          alignment: Alignment.center,
          children: [
            Container(
              width: 80.w,
              height: 80.h,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: Get.isDarkMode
                    ? ColorsManager.bgSectionDark
                    : ColorsManager.white,
                boxShadow: [
                  BoxShadow(
                    color: Get.isDarkMode
                        ? ColorsManager.primaryCTA.withOpacity(.5)
                        : ColorsManager.primaryCTA.withOpacity(.5),
                    blurRadius: 50,
                    spreadRadius: 0,
                  ),
                ],
              ),
            ),
            SvgPicture.asset(
              icon ,
             color:Get.isDarkMode?ColorsManager.iconDefaultDark: ColorsManager.iconDefaultLight,
             width: 49.w,
              height: 46.h,
            ),
          ],
        ),
        SizedBox(height: 8.h),
                 
                    Container(
                      padding: EdgeInsets.symmetric(
                        horizontal: 8.w,
                        vertical: 4.h,
                      ),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(100.r),
                        color: Get.isDarkMode ? ColorsManager.dividerColorDark : ColorsManager.dividerColorLight,
                      ),
                      child: Text(
                        title,
                        style: Theme.of(context).textTheme.bodySmall!.copyWith(
                          color: Get.isDarkMode ? ColorsManager.white : ColorsManager.primaryLight,
                          fontWeight: FontWeight.w700
                        ),
                      ),
                    ),
                    SizedBox(height: 8.h),
                    Text(
                      textAlign: TextAlign.center,
                      description,
                      style: Theme.of(
                        context,
                      ).textTheme.bodyMedium!.copyWith(fontSize: 12.sp),
                    ),
                  ],
                ),
              ),
            );
  }
}