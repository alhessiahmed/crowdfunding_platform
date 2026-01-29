import 'dart:math' as math;

import 'package:crowdfunding_platform/controller/core/constants/colors_manager.dart';
import 'package:crowdfunding_platform/controller/core/constants/images_manager.dart';
import 'package:crowdfunding_platform/controller/getx/controllers/login_activity/login_activity_controller.dart';
import 'package:crowdfunding_platform/view/widgets/login_activity_screen_widgets.dart/connected_device_section.dart';
import 'package:crowdfunding_platform/view/widgets/login_activity_screen_widgets.dart/note_card.dart';
import 'package:crowdfunding_platform/view/widgets/update_campaign_widget/appbar_section.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

class LoginActivityScreen extends GetView<LoginActivityController> {
  const LoginActivityScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              AppbarSection(
                title: 'Login_activity'.tr,
                subTitle:
                    'Here_you_can_see_the_latest_logins_to_your_account.'.tr,
              ),
              SizedBox(height: 24.h),
              NoteCard(),
              SizedBox(height: 24.h),
              ConnectedDeviceSection(),
              SizedBox(height: 24.h),
              SizedBox(
                width: double.infinity,
                height: 56.h,
                child: ElevatedButton(
                  onPressed: () {},
                  style: ElevatedButton.styleFrom(
                    elevation: 0,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(16.r),
                    ),
                  ),
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Transform.rotate(
                        angle: math.pi,
                        child: SvgPicture.asset(
                          ImagesManager.logoutIcon,
                          width: 24.w,
                          height: 24.h,
                        ),
                      ),
                      SizedBox(width: 10.w),

                      Text(
                        'Logout_form_All_Devices'.tr,
                        style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                          color: ColorsManager.white,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ).paddingSymmetric(horizontal: 24.w, vertical: 40.h),
        ),
      ),
    );
  }
}
