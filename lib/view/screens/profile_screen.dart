import 'package:crowdfunding_platform/controller/core/constants/colors_manager.dart';
import 'package:crowdfunding_platform/controller/core/constants/images_manager.dart';
import 'package:crowdfunding_platform/controller/core/routes/routes_manager.dart';
import 'package:crowdfunding_platform/controller/getx/controllers/profile_controller.dart';
import 'package:crowdfunding_platform/controller/shared_pref/shared_pref_controller.dart';
import 'package:crowdfunding_platform/view/widgets/profile_widgets/details_Info_profile.dart';
import 'package:crowdfunding_platform/view/widgets/profile_widgets/header_profile.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

class ProfileScreen extends GetView<ProfileController> {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Center(
          child: SingleChildScrollView(
            child: Column(
              children: [
                HeaderProfile(),
                DetailsInfoCard(),
                            if( SharedPrefController().userType != UserRole.GUEST.name)...{

                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 20.w),
                  child: ElevatedButton(
                    onPressed: () {
                      SharedPrefController().clearUser();
                      Get.offAllNamed(RoutesManager.welcomeScreen);

                    },
                    child: Row(
                      spacing: 10.w,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        SvgPicture.asset(ImagesManager.logout),
                        Text('logout'.tr),
                      ],
                    ),
                  ),
                ),
                SizedBox(height: 10.h),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 20.w),
                  child: ElevatedButton(
                    onPressed: () { 
                     controller.deleteAccount();

                    },
                    child: Text('delete_account'.tr),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: ColorsManager.danger2,
                    ),
                  ),
                ),
                },
                 SizedBox(height: 130.h),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
