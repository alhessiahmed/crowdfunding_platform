import 'package:crowdfunding_platform/controller/shared_pref/shared_pref_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import '../../../controller/core/constants/colors_manager.dart';
import '../../../controller/core/constants/images_manager.dart';
import '../../../controller/core/routes/routes_manager.dart';

class OnboardingScreen extends StatefulWidget {
  const OnboardingScreen({super.key});

  @override
  State<OnboardingScreen> createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  late PageController pageController;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    pageController = PageController();
  }

  // Future<void> _finishOnboarding() async {}
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView.builder(
        physics: const BouncingScrollPhysics(),
        controller: pageController,
        itemCount: 3,
        itemBuilder: (context, index) {
          return Stack(
            // fit: StackFit.expand,
            children: [
              Align(
                alignment: AlignmentDirectional.topCenter,
                child: Image.asset(
                  index == 0
                      ? ImagesManager.onBoarding1
                      : index == 1
                      ? ImagesManager.onBoarding2
                      : ImagesManager.onBoarding3,
                  height: Get.height * 0.72,
                  width: Get.width,
                  fit: BoxFit.fill,
                ),
              ),
              Align(
                alignment: AlignmentDirectional.bottomCenter,
                child: Container(
                  height: 303.h,
                  width: Get.width,
                  decoration: BoxDecoration(
                    color: Theme.of(context).colorScheme.surface,
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(64.r),
                      topRight: Radius.circular(64.r),
                    ),
                  ),
                  child: Column(
                    children: [
                      SizedBox(height: 20.h),
                      SizedBox(
                        height: 8.h,
                        child: ListView.separated(
                          shrinkWrap: true,
                          itemCount: 3,
                          scrollDirection: Axis.horizontal,
                          itemBuilder: (context, listViewIndex) {
                            return Container(
                              height: 8.h,
                              width: index == listViewIndex ? 48.w : 8.w,
                              decoration: BoxDecoration(
                                color: index == listViewIndex
                                    ? ColorsManager.primaryCTA
                                    : ColorsManager.grey,
                                borderRadius: BorderRadius.circular(3.r),
                                border: Border.all(
                                  // color: ColorsManager.logo,
                                ),
                              ),
                            );
                          },
                          separatorBuilder: (context, index) {
                            return SizedBox(width: 4.w);
                          },
                        ),
                      ),
                      SizedBox(height: 40.h),
                      Text(
                        index == 0
                            ? 'boarding1_title'.tr
                            : index == 1
                            ? 'boarding2_title'.tr
                            : 'boarding3_title'.tr,
                        textAlign: TextAlign.center,
                        style: Theme.of(context).textTheme.bodyLarge,
                      ),
                      SizedBox(height: 16.h),
                      Text(
                        index == 0
                            ? 'boarding1_info'.tr
                            : index == 1
                            ? 'boarding2_info'.tr
                            : 'boarding3_info'.tr,
                        textAlign: TextAlign.center,
                        style: Theme.of(context).textTheme.bodyMedium,
                      ),
                      SizedBox(height: 32.h),
                      index == 2
                          ? SizedBox(
                              width: 329.w,
                              child: ElevatedButton(
                                onPressed: () {
                                  Get.offNamed(RoutesManager.welcomeScreen);
                                  SharedPrefController.to.setSeenOnboarding();
                                },
                                child: Text('start_now'.tr),
                              ),
                            )
                          : Padding(
                              padding: EdgeInsets.symmetric(horizontal: 32.w),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  InkWell(
                                    onTap: () {
                                      pageController.nextPage(
                                        duration: const Duration(
                                          milliseconds: 400,
                                        ),
                                        curve: Curves.easeIn,
                                      );
                                    },
                                    child: Container(
                                      width: 56.w,
                                      height: 56.h,
                                      decoration: BoxDecoration(
                                        shape: BoxShape.circle,
                                        border: Border.all(
                                          color: Get.isDarkMode
                                              ? ColorsManager.boarder
                                              : ColorsManager.grey,
                                          width: 2,
                                        ),
                                      ),
                                      alignment: Alignment.center,
                                      child: Container(
                                        width: (56 * 0.65).w,
                                        height: (56 * 0.65).h,
                                        decoration: BoxDecoration(
                                          color: ColorsManager.primaryCTA,
                                          shape: BoxShape.circle,
                                        ),
                                        child: Icon(
                                          Icons.arrow_back,
                                          color: Theme.of(
                                            context,
                                          ).scaffoldBackgroundColor,
                                        ),
                                      ),
                                    ),
                                  ),
                                  InkWell(
                                    onTap: () {
                                      pageController.animateToPage(
                                        2,
                                        duration: const Duration(
                                          milliseconds: 1000,
                                        ),
                                        curve: Curves.easeIn,
                                      );
                                      SharedPrefController.to
                                          .setSeenOnboarding();
                                    },
                                    child: Text(
                                      'skip'.tr,
                                      style: TextStyle(
                                        fontSize: 16.sp,
                                        color: Get.isDarkMode
                                            ? ColorsManager.primaryTextDark
                                            : ColorsManager.primaryLight,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                    ],
                  ),
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}
