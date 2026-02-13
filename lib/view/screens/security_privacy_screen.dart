import 'package:crowdfunding_platform/controller/core/constants/colors_manager.dart';
import 'package:crowdfunding_platform/controller/core/constants/images_manager.dart';
import 'package:crowdfunding_platform/controller/core/routes/index.dart';
import 'package:crowdfunding_platform/view/widgets/icon_with_background.dart';
import 'package:crowdfunding_platform/view/widgets/idea_box_app.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

class SecurityPrivacy extends StatelessWidget {
  const SecurityPrivacy({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 24.w, vertical: 40.h),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                InkWell(
                  onTap: () {
                    Get.back();
                  },
                  child: SvgPicture.asset(
                    ImagesManager.backIcon,
                    width: 44.w,
                    height: 44.h,
                  ),
                ),
                SizedBox(width: 30.w),
                Text(
                  'security_and_privacy'.tr,
                  style: Theme.of(context).textTheme.bodyLarge!,
                ),
              ],
            ),
            SizedBox(height: 20.h),
            Text(
              'security_privacy_settings'.tr,
              style: Theme.of(context).textTheme.bodySmall,
            ),
            SizedBox(height: 24.h),
            Text(
              'account_security'.tr,
              style: Theme.of(context).textTheme.bodySmall!.copyWith(
                color: Colors.black,
                fontWeight: FontWeight.w700,
              ),
            ),
            SizedBox(height: 12.h),
            Container(
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
                  ListTile(
                    onTap: () => Get.toNamed(RoutesManager.changePasswordScreen),

                    leading: IconWithBackground(
                      icon: ImagesManager.profile2,
                      lightColor: ColorsManager.dividerColorLight,
                    ),
                    title: Text(
                      'change_password'.tr,
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
                    onTap: () => Get.toNamed(RoutesManager.loginActivityScreen),
                    leading: IconWithBackground(
                      icon: ImagesManager.lockIcon,
                      lightColor: ColorsManager.dividerColorLight,
                    ),
                    title: Text(
                      'login_activity'.tr,
                      style: Theme.of(
                        context,
                      ).textTheme.bodyLarge!.copyWith(fontSize: 12.sp),
                    ),
                    trailing: Icon(Icons.arrow_forward_ios, size: 16),
                  ),
                ],
              ),
            ),
            SizedBox(height: 24.h),
            Text(
              'two_factor_authentication'.tr,
              style: Theme.of(context).textTheme.bodySmall!.copyWith(
                color: Colors.black,
                fontWeight: FontWeight.w700,
              ),
            ),

            SizedBox(height: 12.h),
            Container(
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
              padding: EdgeInsets.symmetric(vertical: 8.h),
              child: ListTile(
              //  onTap: ()=> Get.toNamed(RoutesManager.twoS),
                leading: IconWithBackground(
                  icon: ImagesManager.lockIcon,
                  lightColor: ColorsManager.dividerColorLight,
                ),
                title: Text(
                  'two_factor_authentication'.tr.tr,
                  style: Theme.of(
                    context,
                  ).textTheme.bodyLarge!.copyWith(fontSize: 12.sp),
                ),
                subtitle: Text(
                  'two_factor_authentication_description'.tr,
                  style: TextStyle(fontSize: 12.sp),
                ),
                trailing: Switch.adaptive(
                  value: true,
                  onChanged: (val) {},
                  activeColor: Colors.white, 
  activeTrackColor: ColorsManager.primaryCTA, 
                  padding: EdgeInsets.zero,
                  
                ),
                //  Icon(Icons.arrow_forward_ios, size: 16),
              ),
            ),
            Spacer(), 
                        IdeaBoxApp(text: 'update_password_description'.tr,),
            SizedBox(height: 24.h),
          ],
        ),
      ),
    );
  }
}
