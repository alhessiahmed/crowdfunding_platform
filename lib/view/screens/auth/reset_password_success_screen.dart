import 'package:crowdfunding_platform/controller/core/routes/routes_manager.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../../controller/core/constants/images_manager.dart';

class ResetPasswordSuccessScreen extends StatelessWidget {
  const ResetPasswordSuccessScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // backgroundColor: Theme.of(context).primaryColor,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset(
            Get.isDarkMode ? ImagesManager.likeDark : ImagesManager.likeLight,
          ),
          Text(
            'password_changed'.tr,
            style: Theme.of(context).textTheme.bodyLarge,
          ),
          SizedBox(height: 32.h),
          Text(
            'login_safely'.tr,
            style: Theme.of(
              context,
            ).textTheme.bodyMedium!.copyWith(fontSize: 12.sp),
          ),
          SizedBox(height: 24.h),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 40.w),
            child: ElevatedButton(
              onPressed: () {
                Get.offNamed(RoutesManager.signInScreen);
              },
              child: Text('go_to_login'.tr),
            ),
          ),
        ],
      ),
    );
  }
}
