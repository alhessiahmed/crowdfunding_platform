import 'package:crowdfunding_platform/controller/getx/controllers/creator/creator_verification_controller.dart';
import 'package:crowdfunding_platform/view/screens/creator/creator_account_verification_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import '../../../controller/core/constants/images_manager.dart';
import '../../widgets/step_indicator.dart';
import 'creator_bank_information_screen.dart';
import 'creator_id_information_screen.dart';

class CreatorVerficationScreen extends GetView<CreatorVerificationController> {
  const CreatorVerficationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Obx(() {
          return Padding(
            padding: EdgeInsets.symmetric(horizontal: 24.w, vertical: 40.h),
            child: Column(
              children: [
                Row(
                  children: [
                    InkWell(
                      onTap: () => controller.previous(),
                      child: SvgPicture.asset(ImagesManager.backIcon),
                    ),
                    Spacer(),
                    Text(
                      '${'step'.tr} ${controller.currentPage.value + 1} ${'of'.tr} 3',
                      style: Theme.of(
                        context,
                      ).textTheme.bodyMedium!.copyWith(fontSize: 12.sp),
                    ),
                    SizedBox(width: 8.w),
                    SizedBox(
                      height: 8.h,
                      width: 58.w,
                      child: StepIndicator(progress: controller.progress),
                    ),
                  ],
                ),
                Expanded(
                  child: PageView(
                    controller: controller.pageController,
                    physics: const NeverScrollableScrollPhysics(),
                    onPageChanged: controller.onPageChanged,
                    children: const [
                      CreatorAccountVerificationScreen(),
                      CreatorIdInformationScreen(),
                      CreatorBankInformationScreen(),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(24),
                  child: SizedBox(
                    width: double.infinity,
                    height: 56,
                    child: ElevatedButton(
                      onPressed: controller.currentPage.value == 2
                          ? controller.finish
                          // : controller.canProceed
                          : controller.next,
                      // : null,
                      child: Text(
                        controller.currentPage.value == 2
                            ? 'send_to_verify'.tr
                            : 'next'.tr,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          );
        }),
      ),
    );
  }
}
