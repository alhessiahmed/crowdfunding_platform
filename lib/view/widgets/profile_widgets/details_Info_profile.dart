import 'dart:developer';

import 'package:crowdfunding_platform/controller/core/constants/colors_manager.dart';
import 'package:crowdfunding_platform/controller/core/constants/images_manager.dart';
import 'package:crowdfunding_platform/controller/core/routes/routes_manager.dart';
import 'package:crowdfunding_platform/controller/shared_pref/shared_pref_controller.dart';
import 'package:crowdfunding_platform/view/widgets/icon_with_background.dart';
import 'package:crowdfunding_platform/view/widgets/secondary_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class DetailsInfoCard extends StatelessWidget {
  const DetailsInfoCard({super.key});

  @override
  Widget build(BuildContext context) {
    final userType = SharedPrefController().userType;
    log('////////// user type $userType ');
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: Container(
        decoration: BoxDecoration(
          boxShadow: [
            BoxShadow(
              color: Colors.black54,
              offset: Offset(0, 0),
              blurRadius: 1,
            ),
          ],
          color: Get.isDarkMode
              ? ColorsManager.bgSectionDark
              : ColorsManager.bgSectionLight,
          borderRadius: BorderRadius.circular(24.r),
        ),
        padding: EdgeInsets.all(8.w),
        child: Column(
          children: [
            if (userType != UserRole.GUEST.name) ...{
              ListTile(
                onTap: () => Get.toNamed(RoutesManager.donorPersonalInfoScreen),
                leading: IconWithBackground(
                  icon: ImagesManager.profile2,
                  lightColor: ColorsManager.dividerColorLight,
                ),
                title: Text(
                  'details_info'.tr,
                  style: Theme.of(
                    context,
                  ).textTheme.bodyLarge!.copyWith(fontSize: 12.sp),
                ),
                trailing: Icon(Icons.arrow_forward_ios, size: 16),
              ),
              Divider(
                color: Get.isDarkMode
                    ? ColorsManager.dividerColorDark
                    : ColorsManager.dividerColorLight,
              ),
              ListTile(
                onTap: () => Get.toNamed(RoutesManager.securityPrivacyScreen),
                leading: IconWithBackground(
                  icon: ImagesManager.lockIcon,
                  lightColor: ColorsManager.dividerColorLight,
                ),
                title: Text(
                  'security_and_privacy'.tr,
                  style: Theme.of(
                    context,
                  ).textTheme.bodyLarge!.copyWith(fontSize: 12.sp),
                ),
                trailing: Icon(Icons.arrow_forward_ios, size: 16),
              ),
              Divider(
                color: Get.isDarkMode
                    ? ColorsManager.dividerColorDark
                    : ColorsManager.dividerColorLight,
              ),
              ListTile(
                onTap: () =>
                    Get.toNamed(RoutesManager.notificationSettingsScreen),
                leading: IconWithBackground(
                  icon: ImagesManager.notification,
                  lightColor: ColorsManager.dividerColorLight,
                ),
                title: Text(
                  'notification_preferences'.tr,
                  style: Theme.of(
                    context,
                  ).textTheme.bodyLarge!.copyWith(fontSize: 12.sp),
                ),
                trailing: Icon(Icons.arrow_forward_ios, size: 16),
              ),
              Divider(
                color: Get.isDarkMode
                    ? ColorsManager.dividerColorDark
                    : ColorsManager.dividerColorLight,
              ),
              ListTile(
                onTap: () => Get.toNamed(RoutesManager.donationHistoryScreen),

                leading: IconWithBackground(
                  icon: ImagesManager.hisrotyRounded,
                  lightColor: ColorsManager.dividerColorLight,
                ),
                title: Text(
                  'donation_record'.tr,
                  style: Theme.of(
                    context,
                  ).textTheme.bodyLarge!.copyWith(fontSize: 12.sp),
                ),
                trailing: Icon(Icons.arrow_forward_ios, size: 16),
              ),
              Divider(
                color: Get.isDarkMode
                    ? ColorsManager.dividerColorDark
                    : ColorsManager.dividerColorLight,
              ),
              ListTile(
                onTap: () => userType == UserRole.DONOR.name
                    ? Get.toNamed(RoutesManager.donorAccVerificationScreen)
                    : Get.toNamed(RoutesManager.creatorVerificationScreen),
                leading: IconWithBackground(
                  icon: ImagesManager.verified,
                  lightColor: ColorsManager.dividerColorLight,
                ),
                title: Text(
                  'account_verification'.tr,
                  style: Theme.of(
                    context,
                  ).textTheme.bodyLarge!.copyWith(fontSize: 12.sp),
                ),
                trailing: Icon(Icons.arrow_forward_ios, size: 16),
              ),
              Divider(
                color: Get.isDarkMode
                    ? ColorsManager.dividerColorDark
                    : ColorsManager.dividerColorLight,
              ),
              if (userType == UserRole.CAMPAIGN_CREATOR.name) ...{
                ListTile(
                  // onTap: () => Get.toNamed(RoutesManager.accountTypeScreen),
                  leading: IconWithBackground(
                    icon: ImagesManager.moneys,
                    lightColor: ColorsManager.dividerColorLight,
                  ),
                  title: Text(
                    'bank_account_management'.tr,
                    style: Theme.of(
                      context,
                    ).textTheme.bodyLarge!.copyWith(fontSize: 12.sp),
                  ),
                  trailing: Icon(Icons.arrow_forward_ios, size: 16),
                ),
                Divider(
                  color: Get.isDarkMode
                      ? ColorsManager.dividerColorDark
                      : ColorsManager.dividerColorLight,
                ),
              },
              if (userType == UserRole.DONOR.name) ...{
                ListTile(
                  onTap: () =>
                      Get.toNamed(RoutesManager.choosePaymentMethodScreen),
                  leading: IconWithBackground(
                    icon: ImagesManager.moneys,
                    lightColor: ColorsManager.dividerColorLight,
                  ),
                  title: Text(
                    'payment_way'.tr,
                    style: Theme.of(
                      context,
                    ).textTheme.bodyLarge!.copyWith(fontSize: 12.sp),
                  ),
                  trailing: Icon(Icons.arrow_forward_ios, size: 16),
                ),
                Divider(
                  color: Get.isDarkMode
                      ? ColorsManager.dividerColorDark
                      : ColorsManager.dividerColorLight,
                ),
              },
               if (userType == UserRole.CAMPAIGN_CREATOR.name) ...{
              ListTile(
                onTap: () => Get.toNamed(RoutesManager.walletScreen),
                leading: IconWithBackground(
                  icon: ImagesManager.emptyWallet,
                  lightColor: ColorsManager.dividerColorLight,
                ),
                title: Text(
                  'wallet'.tr,
                  style: Theme.of(
                    context,
                  ).textTheme.bodyLarge!.copyWith(fontSize: 12.sp),
                ),
                trailing: Icon(Icons.arrow_forward_ios, size: 16),
              ),
              Divider(
                color: Get.isDarkMode
                    ? ColorsManager.dividerColorDark
                    : ColorsManager.dividerColorLight,
              ),
            },
             },
            ListTile(
              //     onTap: ()=> Get.toNamed(RoutesManager.s),
              leading: IconWithBackground(
                icon: ImagesManager.contactSupport,
                lightColor: ColorsManager.dividerColorLight,
              ),
              title: Text(
                'help _and_support'.tr,
                style: Theme.of(
                  context,
                ).textTheme.bodyLarge!.copyWith(fontSize: 12.sp),
              ),
              trailing: Icon(Icons.arrow_forward_ios, size: 16),
            ),
            if (userType == UserRole.GUEST.name) ...{
              SizedBox(height: 20.h),

              SecondaryButton(
                label: 'Create_an_account_to_track_your_progress'.tr,
                onPressed: () => Get.offAllNamed(RoutesManager.welcomeScreen),
                color: ColorsManager.secondaryThanksColor.withValues(
                  alpha: 0.10,
                ),
              ),
            },
            SizedBox(height: 10.h),
          ],
        ),
      ),
    );
  }
}
