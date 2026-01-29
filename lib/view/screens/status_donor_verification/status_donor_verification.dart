import 'package:crowdfunding_platform/controller/core/constants/colors_manager.dart';
import 'package:crowdfunding_platform/controller/core/constants/images_manager.dart';
import 'package:crowdfunding_platform/view/widgets/alternative_button.dart';
import 'package:crowdfunding_platform/view/widgets/icon_with_background.dart';
import 'package:crowdfunding_platform/view/widgets/information_card.dart';
import 'package:crowdfunding_platform/view/widgets/status_donor_verification/expected_time_box.dart';
import 'package:crowdfunding_platform/view/widgets/status_donor_verification/status_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:get/get_navigation/get_navigation.dart';
import 'package:get/state_manager.dart';

class StatusDonorVerificationScreen extends StatelessWidget {
  const StatusDonorVerificationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // backgroundColor: Get.isDarkMode
      //     ? ColorsManager.scaffoldBgDark
      //     : ColorsManager.scaffoldBgLight,
      body: SingleChildScrollView(
        padding: EdgeInsets.symmetric(horizontal: 24.w, vertical: 40.h),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                InkWell(
                  onTap: () {
                    Get.back();
                  },
                  child: SvgPicture.asset(
                    ImagesManager.backIcon,
                    width: 44.w,
                    height: 44.h,
                  ),
                ),
                SizedBox(width: 30.w),
                Text(
                  'verification_account'.tr,
                  style: Theme.of(context).textTheme.bodyLarge!,
                ),
              ],
            ),
            SizedBox(height: 20.h),
            Text(
              'verification_account_description'.tr,
              style: Theme.of(context).textTheme.bodySmall,
            ),
            SizedBox(height: 24.h),
            StatusCard(
              title: 'account_verified'.tr,
              icon: ImagesManager.verified,
              description: 'account_under_review'.tr,
            ),
            SizedBox(height: 16.h),
            ExpectedTimeBox(),
            SizedBox(height: 16.h),
            Text(
              'verified_account_benefits'.tr,
              style: Theme.of(
                context,
              ).textTheme.bodyLarge!.copyWith(fontSize: 14.sp),
            ),
            SizedBox(height: 12.h),
            InformationCard(
              title: 'blue_icon'.tr,
              subTitle: 'special_icon'.tr,
              imgPath: ImagesManager.verifiedIcon,
            ),
            SizedBox(height: 16.h),
            InformationCard(
              title: 'extra_protection'.tr,
              subTitle: 'layers_of_protection'.tr,
              imgPath: ImagesManager.secureIcon,
            ),
            SizedBox(height: 16.h),
            InformationCard(
              title: 'support_priority'.tr,
              subTitle: 'special_support'.tr,
              imgPath: ImagesManager.supportIcon,
            ),
            SizedBox(height: 24.h),
            Container(
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
                      'notification_when_verified'.tr,
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
            ),
            SizedBox(height: 24.h),

            //faild verified buttons
            ElevatedButton(
              onPressed: () {},
              child: Text('retry_verification'.tr),
            ),
            SizedBox(height: 8.h),
            AlternativeButton(text: 'contact_wit_support'.tr, onPressed: () {}),
          ],
        ),
      ),
    );
  }
}
