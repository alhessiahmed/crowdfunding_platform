import 'package:crowdfunding_platform/controller/core/constants/images_manager.dart';
import 'package:crowdfunding_platform/view/widgets/information_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../../controller/core/constants/colors_manager.dart';
import '../../../controller/core/routes/routes_manager.dart';

class CreatorVerificationSuccessScreen extends StatelessWidget {
  const CreatorVerificationSuccessScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 40.w),
        child: Column(
          children: [
            Image.asset(
              Get.isDarkMode
                  ? ImagesManager.clockDark
                  : ImagesManager.clockLight,
            ),
            Text(
              'confirmation_recieved'.tr,
              style: Theme.of(context).textTheme.bodyLarge,
            ),
            SizedBox(height: 32.h),
            Text(
              'information_will_be_reviewed'.tr,
              style: Theme.of(
                context,
              ).textTheme.bodyMedium!.copyWith(fontSize: 12.sp),
            ),
            SizedBox(height: 24.h),
            InformationWIdget(
              text: 'review_extra'.tr,
              height: 80.h,
              width: 231.w,
              imgPath: ImagesManager.shieldIcon,
            ),
            SizedBox(height: 16.h),
            InformationWIdget(
              text: 'review_duration'.tr,
              height: 72.h,
              width: 231.w,
              imgPath: ImagesManager.clockIcon,
            ),
            SizedBox(height: 16.h),
            InformationWIdget(
              text: 'msg_will_be_rec'.tr,
              height: 72.h,
              width: 231.w,
              imgPath: ImagesManager.lightIcon,
            ),
            SizedBox(height: 24.h),
            ElevatedButton(
              onPressed: () {
                Get.offAllNamed(RoutesManager.homeScreen);
              },
              child: Text('discover_campains'.tr),
            ),
            SizedBox(height: 10.h),
            ElevatedButton(
              onPressed: () {
                Get.offAllNamed(RoutesManager.homeScreen);
              },
              style: ElevatedButton.styleFrom(
                elevation: 0,
                backgroundColor: Theme.of(context).brightness == Brightness.dark
                    ? ColorsManager.bgSectionDark
                    : ColorsManager.bgSectionLight,
                foregroundColor: Theme.of(context).textTheme.bodyLarge!.color,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(16),
                  side: const BorderSide(color: Color(0xFF2358B3), width: 2),
                ),
              ),
              child: Text('contact_support'.tr),
            ),
          ],
        ),
      ),
    );
  }
}
