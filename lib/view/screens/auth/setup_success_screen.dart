import 'package:crowdfunding_platform/controller/core/routes/routes_manager.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../../controller/core/constants/colors_manager.dart';
import '../../../controller/core/constants/images_manager.dart';

class SetupSuccessScreen extends StatelessWidget {
  const SetupSuccessScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 40.w),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              Get.isDarkMode ? ImagesManager.likeDark : ImagesManager.likeLight,
            ),
            Text(
              'setup_success'.tr,
              style: Theme.of(context).textTheme.bodyLarge,
            ),
            SizedBox(height: 32.h),
            Text(
              'ready_to_go'.tr,
              textAlign: TextAlign.center,
              style: Theme.of(
                context,
              ).textTheme.bodyMedium!.copyWith(fontSize: 12.sp),
            ),
            SizedBox(height: 24.h),
            ElevatedButton(
              onPressed: () {
                Get.offNamed(RoutesManager.homeScreen);
              },
              child: Text('create_first_campaign'.tr),
            ),
            SizedBox(height: 12.h),
            ElevatedButton(
              onPressed: () {
                Get.offNamed(RoutesManager.homeScreen);
              },
              style: ElevatedButton.styleFrom(
                // textStyle: Theme.of(
                //   context,
                // ).textTheme.bodyLarge!.copyWith(fontSize: 16.sp),
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
              child: Text('discover_dashboard'.tr),
            ),
          ],
        ),
      ),
    );
  }
}
