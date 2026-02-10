import 'dart:developer';

import 'package:crowdfunding_platform/controller/core/constants/images_manager.dart';
import 'package:crowdfunding_platform/controller/core/routes/routes_manager.dart';
import 'package:crowdfunding_platform/controller/getx/controllers/auth/user_type_selection_controller.dart';
import 'package:crowdfunding_platform/controller/getx/controllers/home_controller.dart';
import 'package:crowdfunding_platform/controller/shared_pref/shared_pref_controller.dart';
import 'package:crowdfunding_platform/view/widgets/icon_with_background.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:crowdfunding_platform/controller/core/constants/colors_manager.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class HomeScreen extends GetView<HomeController> {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Get.isDarkMode
          ? ColorsManager.scaffoldBgDark
          : ColorsManager.scaffoldBgLight,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 18.0, vertical: 30),
          child: Column(
            children: [
              HomeHeader(
                userName: 'مرحباً محمد 👋',
                subtitle:
                    'لإنشاء حملات وجمع التبرعات، نحتاج أولًا إلى توثيق حسابك.',
                avatar: ImagesManager.test,
                onNotificationTap: () {
                  // navigate to notifications
                },
              ),
              SizedBox(height: 80.h),
              Stack(
                children: [
                  Container(
                    height: 224.h,
                    width: 345.w,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(16.r),
                      boxShadow: const [
                        BoxShadow(
                          color: Colors.black26,
                          blurRadius: 2,
                          offset: Offset(0, 0),
                        ),
                      ],
                    ),
                    clipBehavior: Clip.antiAlias,
                    child: Stack(
                      children: [
                        Positioned.fill(
                          child: Image.asset(
                            ImagesManager.bgAccountNotVerified,
                            fit: BoxFit.cover,
                          ),
                        ),

                        Positioned.fill(
                          child: Container(
                            decoration: BoxDecoration(
                              gradient: RadialGradient(
                                center: Alignment.topLeft,
                                radius: 1.3,
                                colors: [
                                  ColorsManager.iconDefaultLight.withOpacity(
                                    0.7,
                                  ),
                                  Color(0xFF8A97A8).withOpacity(.9),
                                ],
                                stops: const [1.0, 1.0],
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),

                  Positioned(
                    left: 0,
                    right: 0,
                    top: 80,
                    child: Column(
                      children: [
                        Container(
                          height: 59.h,
                          width: 59.w,
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color: Colors.white.withOpacity(.6),
                          ),
                          child: SvgPicture.asset(
                            ImagesManager.closeIcone,
                            fit: BoxFit.scaleDown,
                          ),
                        ),

                        SizedBox(height: 14.h),
                        Container(
                          padding: EdgeInsets.symmetric(
                            horizontal: 12.w,
                            vertical: 6.h,
                          ),
                          decoration: BoxDecoration(
                            color: Get.isDarkMode
                                ? ColorsManager.bgSectionDark
                                : ColorsManager.bgSectionLight,
                            borderRadius: BorderRadius.circular(20.r),
                          ),
                          child: Text(
                            'حسابك غير موثق',
                            style: TextStyle(
                              color: Get.isDarkMode
                                  ? ColorsManager.primaryTextDark
                                  : ColorsManager.primaryLight,
                              fontWeight: FontWeight.w700,
                              fontSize: 12.sp,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              SizedBox(height: 14.h),

              Text(
                'لا يمكنك إنشاء حملة بعد',
                style: Theme.of(context).textTheme.bodyLarge,
              ),
              SizedBox(height: 12.h),

              Text(
                textAlign: TextAlign.center,
                'يتطلّب إنشاء الحملات حسابًا موثّقًا لضمان الموثوقية وحماية المتبرعين.',
                style: Theme.of(
                  context,
                ).textTheme.bodyMedium!.copyWith(fontSize: 11.sp),
              ),
              SizedBox(height: 16.h),

              ElevatedButton(
                onPressed: () {
                
                   Get.toNamed(
                  SharedPrefController().userType == UserRole.DONOR.name 
                 ? RoutesManager.donorAccVerificationScreen
                 : RoutesManager.creatorVerificationScreen
                 );},
                child: Text(
                  'ابدأ توثيق الحساب',
                  style: TextStyle(color: Colors.white),
                ),
              ),
              SizedBox(height: 14.h),

              Container(
                height: 80.h,
                width: 345.w,
                constraints: BoxConstraints(maxWidth: 345),
                decoration: BoxDecoration(
                  color: Get.isDarkMode ? ColorsManager.bgGoogle : Colors.white,
                  borderRadius: BorderRadius.all(Radius.circular(16.r)),
                  border: Border.all(
                    color: ColorsManager.grey2.withOpacity(
                      Get.isDarkMode ? 0 : .2,
                    ),
                  ),
                ),
                child: Row(
                  children: [
                    SizedBox(width: 6.w),
                    IconWithBackground(
                      icon: ImagesManager.lampOn,
                      lightColor: ColorsManager.dividerColorLight,
                    ),
                    SizedBox(width: 7.w),
                    Expanded(
                      child: Text(
                        maxLines: 2,
                        'لضمان الثقة , يرجى توثيق هويتك لتتمكن من إنشاء الحملات وسحب التبرعات',
                        style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                          fontSize: 12.sp,
                          fontWeight: FontWeight.w700,
                          color: Get.isDarkMode
                              ? ColorsManager.white
                              : ColorsManager.secondaryLight,
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
    );
  }
}

class HomeHeader extends StatelessWidget {
  const HomeHeader({
    super.key,
    required this.userName,
    required this.subtitle,
    required this.avatar,
    this.onNotificationTap,
  });

  final String userName;
  final String subtitle;
  final String avatar;
  final VoidCallback? onNotificationTap;

  @override
  Widget build(BuildContext context) {
    return Container(
      // padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 14.h),
      // decoration: BoxDecoration(
      //   color: Get.isDarkMode
      //       ? ColorsManager.bgSectionDark
      //       : ColorsManager.bgSectionLight,
      //   borderRadius: BorderRadius.circular(20.r),
      // ),
      child: Row(
        children: [
          ///  User avatar
          ClipRRect(
            borderRadius: BorderRadius.circular(30.r),
            child: Image.asset(
              avatar,
              height: 60.h,
              width: 60.h,
              fit: BoxFit.cover,
            ),
          ),

          SizedBox(width: 12.w),

          ///  Greeting text
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  userName,
                  style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                    color: Get.isDarkMode
                        ? ColorsManager.primaryTextDark
                        : ColorsManager.primaryLight,
                    fontWeight: FontWeight.w700,
                  ),
                ),
                SizedBox(height: 4.h),
                Text(
                  subtitle,
                  style: Theme.of(context).textTheme.bodySmall!.copyWith(
                    color: Get.isDarkMode
                        ? ColorsManager.secondaryDark
                        : ColorsManager.secondaryLight,
                    fontSize: 10.sp,
                  ),
                ),
              ],
            ),
          ),

          SizedBox(width: 12.w),

          ///  Notification button
          IconWithBackground(
            icon: ImagesManager.notification,
            lightColor: ColorsManager.dividerColorLight,
            darkColor: ColorsManager.dividerColorDark,
            withShadow: true,
          ),
        ],
      ),
    );
  }
}
