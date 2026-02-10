import 'dart:developer';

import 'package:crowdfunding_platform/controller/core/constants/images_manager.dart';
import 'package:crowdfunding_platform/view/widgets/information_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import '../../../../controller/core/routes/routes_manager.dart';
import '../../../widgets/information_card.dart';

class DonorAccVerificationScreen extends StatelessWidget {
  const DonorAccVerificationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 24.w, vertical: 40.h),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
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
                SizedBox(width: 10.w),
                SizedBox(
                  width: 237.w,
                  child: Text(
                    'start_verifying'.tr,
                    style: Theme.of(context).textTheme.bodyLarge,
                    textAlign: TextAlign.center,
                  ),
                ),
              ],
            ),
            SizedBox(height: 10.h),
            Text(
              'donor_verifying_letter'.tr,
              style: Theme.of(
                context,
              ).textTheme.bodyMedium!.copyWith(fontSize: 12.sp),
              textAlign: TextAlign.center,
            ),
            SizedBox(height: 24.h),
            InformationWIdget(
              text: 'no_third_parties'.tr,
              height: 56.h,
              width: 279.w,
              imgPath: ImagesManager.lightIcon,
              padding: 8,
            ),
            SizedBox(height: 24.h),
            Text(
              'why_verfiying_important'.tr,
              style: Theme.of(
                context,
              ).textTheme.bodyLarge!.copyWith(fontSize: 12.sp),
            ),
            SizedBox(height: 8.h),
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
            Spacer(),
            ElevatedButton(
              onPressed: () {
                Get.toNamed(RoutesManager.donorVerificationShellScreen);
              },
              child: Text('start_verfication'.tr),
            ),
          ],
        ),
      ),
    );
  }
}
