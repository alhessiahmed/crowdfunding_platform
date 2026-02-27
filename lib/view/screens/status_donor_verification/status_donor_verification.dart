import 'package:crowdfunding_platform/controller/core/constants/images_manager.dart';
import 'package:crowdfunding_platform/controller/core/routes/routes_manager.dart';
import 'package:crowdfunding_platform/controller/shared_pref/shared_pref_controller.dart';
import 'package:crowdfunding_platform/view/widgets/alternative_button.dart';
import 'package:crowdfunding_platform/view/widgets/idea_box_app.dart';
import 'package:crowdfunding_platform/view/widgets/information_card.dart';
import 'package:crowdfunding_platform/view/widgets/status_donor_verification/expected_time_box.dart';
import 'package:crowdfunding_platform/view/widgets/status_donor_verification/status_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

class StatusDonorVerificationScreen extends StatelessWidget {
  const StatusDonorVerificationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final user = SharedPrefController().user;
   String  verificationStatus = user!['verificationStatus'];
      // String  verificationStatus = 'failed';

    bool isConfirmd = verificationStatus == 'confirmed';
    bool isPending = verificationStatus == 'pending';
    bool isFailed = verificationStatus == 'failed';

    return Scaffold(
      // backgroundColor: Get.isDarkMode
      //     ? ColorsManager.scaffoldBgDark
      //     : ColorsManager.scaffoldBgLight,
      body: SingleChildScrollView(
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
                  'verification_account'.tr,
                  style: Theme.of(context).textTheme.bodyLarge!,
                ),
              ],
            ),
            SizedBox(height: 20.h),
            Text(
              'verification_account_description'.tr,
              style: Theme.of(context).textTheme.bodySmall,
            ),
            SizedBox(height: 24.h),
            if(isFailed)
            StatusCard(
              title: 'verification_failed'.tr,
              icon: ImagesManager.danger,
              description: 'verification_failed_description'.tr,
            ),

            if(isConfirmd)
            StatusCard(
              title: 'account_verified'.tr,
              icon: ImagesManager.verified,
              description: 'account_verified_descriton'.tr,
            ),

            if(isPending)
            StatusCard(
              title: 'verification_pending'.tr,
              icon: ImagesManager.clockIcon,
              description: 'account_under_review'.tr,
            ),
            SizedBox(height: 16.h),
            ExpectedTimeBox(verificationStatus: verificationStatus,),
            SizedBox(height: 16.h),
            Text(
              'verified_account_benefits'.tr,
              style: Theme.of(
                context,
              ).textTheme.bodyLarge!.copyWith(fontSize: 14.sp),
            ),
            SizedBox(height: 12.h),
            InformationCard(
              title: 'blue_icon'.tr,
              subTitle: 'special_icon'.tr,
              imgPath: ImagesManager.verifiedIcon,
            ),
            SizedBox(height: 16.h),
            InformationCard(
              title: 'extra_protection'.tr,
              subTitle: 'layers_of_protection'.tr,
              imgPath: ImagesManager.secureIcon,
            ),
            SizedBox(height: 16.h),
            InformationCard(
              title: 'support_priority'.tr,
              subTitle: 'special_support'.tr,
              imgPath: ImagesManager.supportIcon,
            ),
            if(!isConfirmd)...{ 
 SizedBox(height: 24.h),
            IdeaBoxApp(text: 
            isPending
            ?
            'notification_when_verified'.tr
            : 'ability_reverification'.tr
            ,),
            },
           
            SizedBox(height: 24.h),

            //faild verified buttons
            if(isFailed)...{ 
 ElevatedButton(
              onPressed: () {
                Get.toNamed(RoutesManager.donorAccVerificationScreen);
              },
              child: Text('retry_verification'.tr),
            ),
            SizedBox(height: 8.h),
            AlternativeButton(text: 'contact_wit_support'.tr, onPressed: () {}),
            }
           
          ],
        ),
      ),
    );
  }
}
