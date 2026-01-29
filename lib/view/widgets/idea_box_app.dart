import 'package:crowdfunding_platform/controller/core/constants/colors_manager.dart';
import 'package:crowdfunding_platform/controller/core/constants/images_manager.dart';
import 'package:crowdfunding_platform/view/widgets/icon_with_background.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

class IdeaBoxApp extends StatelessWidget {
  const IdeaBoxApp({super.key , required this.text});
final String text;
  @override
  Widget build(BuildContext context) {
    return   Container(
              height: 80.h,
              width: 345.w,
              padding: EdgeInsets.all(16.r),
              // constraints: BoxConstraints(maxWidth: 345),
              decoration: BoxDecoration(
                color: Get.isDarkMode ? ColorsManager.bgGoogle : Colors.white,
                borderRadius: BorderRadius.all(Radius.circular(16.r)),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.25),
                    blurRadius: 2,
                  ),
                ],
              ),
              child: Row(
                children: [
                  SizedBox(width: 6.w),
                  IconWithBackground(
                    icon: ImagesManager.lampOn,
                    lightColor: ColorsManager.lightBg,
                  ),
                  SizedBox(width: 7.w),
                  Expanded(
                    child: Text(
                      maxLines: 2,
                      text,
                      style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                        fontSize: 12.sp,
                        fontWeight: FontWeight.w700,
                        color: Get.isDarkMode
                            ? ColorsManager.secondaryDark
                            : ColorsManager.secondaryLight,
                      ),
                    ),
                  ),
                ],
              ),
            );
  }
}