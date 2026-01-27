import 'package:crowdfunding_platform/controller/core/constants/images_manager.dart';
import 'package:crowdfunding_platform/view/widgets/information_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../../../controller/core/routes/routes_manager.dart';
import '../../../widgets/alternative_button.dart';

class DonorVerificationSuccessScreen extends StatelessWidget {
  const DonorVerificationSuccessScreen({super.key});

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
              'information_rec'.tr,
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
            SizedBox(height: 12.h),
            InformationWIdget(
              text: 'review_duration'.tr,
              height: 72.h,
              width: 231.w,
              imgPath: ImagesManager.clockIcon,
            ),

            SizedBox(height: 24.h),
            ElevatedButton(
              onPressed: () {
                Get.offAllNamed(RoutesManager.homeScreen);
              },
              child: Text('go_to_dash'.tr),
            ),
            SizedBox(height: 10.h),
            AlternativeButton(
              onPressed: () {
                Get.offAllNamed(RoutesManager.homeScreen);
              },
              text: 'discover_campains'.tr,
            ),
          ],
        ),
      ),
    );
  }
}
