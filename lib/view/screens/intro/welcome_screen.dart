import 'dart:developer';

import 'package:crowdfunding_platform/controller/core/constants/images_manager.dart';
import 'package:crowdfunding_platform/controller/core/routes/routes_manager.dart';
import 'package:crowdfunding_platform/view/widgets/secondary_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class WelcomeScreen extends StatelessWidget {
  const WelcomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(ImagesManager.logo),
            SizedBox(height: 32.h),
            Text(
              'welcome_title'.tr,
              style: Theme.of(
                context,
              ).textTheme.bodyLarge!.copyWith(fontSize: 32.sp),
            ),
            SizedBox(height: 16.h),
            SizedBox(
              width: 345.w,
              child: Text(
                textAlign: TextAlign.center,
                'welcome_subtitle'.tr,
                style: Theme.of(
                  context,
                ).textTheme.bodyMedium!.copyWith(fontWeight: FontWeight.bold),
              ),
            ),
            SizedBox(height: 32.h),
            SizedBox(
              width: 345.w,
              child: ElevatedButton(
                onPressed: () {
                  log("donate button pressed");
                  Get.toNamed(RoutesManager.mainScreen);
                },
                child: Text('donate_now'.tr),
              ),
            ),
            SizedBox(height: 16.h),
            SizedBox(
              width: 345.w,
              child: SecondaryButton(
                onPressed: () {
                  Get.offAllNamed(RoutesManager.signUpScreen);
                },
                label: 'sign_in_up'.tr,
              ),
            ),
            SizedBox(height: 32.h),
            Text(
              'welcome_extra'.tr,
              style: Theme.of(context).textTheme.bodySmall!.copyWith(
                color: Theme.of(context).colorScheme.onSurface,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
