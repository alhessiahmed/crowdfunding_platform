import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../../controller/core/constants/images_manager.dart';
import '../../../controller/core/routes/routes_manager.dart';

class LaunchScreen extends StatefulWidget {
  const LaunchScreen({super.key});

  @override
  State<LaunchScreen> createState() => _LaunchScreenState();
}

class _LaunchScreenState extends State<LaunchScreen> {
  @override
  void initState() {
    super.initState();
    _initAndNavigate();
  }

  Future<void> _initAndNavigate() async {
    await Future.delayed(const Duration(seconds: 3));

    Get.offAllNamed(RoutesManager.onboardingScreen);
    // final hasSeenOnboarding = SharedPrefController.to.hasSeenOnboarding;

    // if (hasSeenOnboarding) {
    //   Get.offAllNamed(RoutesManager.mainScreen);
    // } else {
    //   Get.offAllNamed(RoutesManager.onboardingScreen);
    // }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset(
            ImagesManager.logo,
            fit: BoxFit.cover,
            // height: 577.h,
            width: Get.width,
          ),
          SizedBox(height: 10.h),
          Text(
            "logo".tr,
            textAlign: TextAlign.center,
            style: TextStyle(
              color: Theme.of(context).colorScheme.onSurface,
              fontSize: 64.sp,
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
    );
  }
}
