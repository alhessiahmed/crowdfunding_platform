import 'package:crowdfunding_platform/controller/core/constants/colors_manager.dart';
import 'package:crowdfunding_platform/controller/core/constants/images_manager.dart';
import 'package:crowdfunding_platform/controller/shared_pref/shared_pref_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:get/get_utils/src/extensions/internacionalization.dart';

class HeaderProfile extends StatelessWidget {
  const HeaderProfile({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(height: 20.h),
        Text(
          'account_settings'.tr,
          style: Theme.of(context).textTheme.bodyLarge,
        ),
        if (SharedPrefController().userType != UserRole.GUEST.name)
          Text(
            'manage_your_account_here'.tr,
            style: Theme.of(context).textTheme.bodySmall,
          ),
        SizedBox(height: 20.h),
        if (SharedPrefController().userType != UserRole.GUEST.name) ...{
          CircleAvatar(
            radius: 35.r,
            backgroundImage: AssetImage(ImagesManager.logo),
          ),
          SizedBox(height: 10.h),

          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'جمعية الامل ',
                style: Theme.of(context).textTheme.bodyLarge,
              ),
              SvgPicture.asset(ImagesManager.verified),
            ],
          ),
                          if(SharedPrefController().userType == UserRole.CAMPAIGN_CREATOR.name)...{

          SizedBox(height: 10.h),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 6.h),
                decoration: BoxDecoration(
                  color: Get.isDarkMode
                      ? ColorsManager.bgSectionDark
                      : ColorsManager.bgSectionLight,
                  borderRadius: BorderRadius.circular(20.r),
                ),
                child: Text(
                  '12 حملة',
                  style: Theme.of(context).textTheme.bodySmall,
                ),
              ),
              SizedBox(width: 10.h),

              Container(
                padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 6.h),
                decoration: BoxDecoration(
                  color: Get.isDarkMode
                      ? ColorsManager.bgSectionDark
                      : ColorsManager.bgSectionLight,
                  borderRadius: BorderRadius.circular(20.r),
                ),
                child: Text(
                  '1.2 الف متابع',
                  style: Theme.of(context).textTheme.bodySmall,
                ),
              ),
            ],
          ),}
        },
      ],
    );
  }
}
