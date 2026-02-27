import 'package:crowdfunding_platform/controller/core/constants/images_manager.dart';
import 'package:crowdfunding_platform/controller/core/constants/colors_manager.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

class ExpectedTimeBox extends StatelessWidget {
   ExpectedTimeBox({super.key , required this.verificationStatus});
String verificationStatus ;
 

  @override
  Widget build(BuildContext context) {
    bool isConfirmd = verificationStatus == 'confirmed';
    bool isPending = verificationStatus == 'pending';
    bool isFailed = verificationStatus == 'failed';
    return Container(
              padding: EdgeInsets.all(8.r),
              width: 345.w,
              height: 56.h,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(16.r),
                color:Get.isDarkMode?ColorsManager.bgGoogle: Colors.white,
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.25),
                    blurRadius: 2,
                  ),
                ],
              ),
              child: Row(
                children: [
                  SvgPicture.asset(
                  isConfirmd
                  ?ImagesManager.calender2
                 : isPending
                   ?ImagesManager.timerIcon
                   :ImagesManager.danger
                   ,
                    height: 24.h,
                    width: 24.w,
                  ),
                  SizedBox(width: 10.w),
                  SizedBox(
                    width: 152.w,
                    child: Text(
                      isConfirmd ? 
                      'verification_time'.tr
                      : isPending 
                      ? 
                      'expected_time'.tr
                      : 'verification_failed_reason'.tr,
                      style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                        fontSize: 12.sp,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                  ),
                  Spacer(),
                  Text(
                    isConfirmd 
                    ? '24 أكتوبر 2025'
                    :isPending 
                    ? 
                    'expected_time_description'.tr 
                     : 'رقم الهاتف غير مؤكّد',
                    style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                      fontSize: 12.sp,
                      color:Get.isDarkMode? Colors.white: ColorsManager.primaryLight,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                ],
              ),
            );
  }
}