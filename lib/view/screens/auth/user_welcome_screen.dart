import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import '../../../controller/core/constants/images_manager.dart';
import '../../../controller/core/routes/routes_manager.dart';
import '../../../controller/getx/controllers/auth/user_type_selection_controller.dart';
import '../../../model/sign_up_draft.dart';

class UserWelcomeScreen extends StatelessWidget {
  const UserWelcomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final SignUpDraft draft = Get.arguments as SignUpDraft;
    // final UserType? userType = Get.arguments == null
    //     ? null
    //     : Get.arguments as UserType;
    final UserType? userType = draft?.userType;
    print(userType?.name ?? 'empty');

    final String welcomeTitle = userType == UserType.donor
        ? 'welcome_donator'.tr
        : 'welcome_creator'.tr;

    final String welcomeInfo = userType == UserType.donor
        ? 'welcome_donator_info'.tr
        : 'welcome_creator_info'.tr;

    return Scaffold(
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 24.w),
        child: Column(
          children: [
            SizedBox(height: 161.h),
            Image.asset(ImagesManager.logo),
            SizedBox(height: 31.h),
            Text(
              welcomeTitle,
              style: Theme.of(context).textTheme.bodyLarge,
              textAlign: TextAlign.center,
            ),
            SizedBox(height: 16.h),
            Text(
              welcomeInfo,
              style: Theme.of(
                context,
              ).textTheme.bodyMedium!.copyWith(fontSize: 12.sp),
              textAlign: TextAlign.center,
            ),
            SizedBox(height: 16.h),
            ElevatedButton(
              onPressed: () {
                if (userType == UserType.donor) {
                  Get.offAllNamed(RoutesManager.discoverScreen);
                } else {
                  Get.toNamed(RoutesManager.onboardingShellScreen);
                }
              },
              child: Text(
                userType == UserType.donor
                    ? 'explore_campaigns'.tr
                    : 'start_setting_up'.tr,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
