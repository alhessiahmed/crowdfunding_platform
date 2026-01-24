import 'package:crowdfunding_platform/controller/core/constants/colors_manager.dart';
import 'package:crowdfunding_platform/controller/core/constants/images_manager.dart';
import 'package:crowdfunding_platform/controller/getx/controllers/campaign_create/campaign_step_one_controller.dart';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class CustomStepAppBar extends StatelessWidget implements PreferredSizeWidget {
  static final CampaignStepOneController controller2 =
      CampaignStepOneController();
  final int currentStep;
  final int totalSteps;
  final double progressWidth;
  final String? logoPath;

  const CustomStepAppBar({
    super.key,
    required this.currentStep,
    required this.totalSteps,
    this.progressWidth = 58,
    this.logoPath,
  });

  @override
  Size get preferredSize => Size.fromHeight(80.h); // ارتفاع AppBar

  @override
  Widget build(BuildContext context) {
    // نتحقق إذا كانت اللغة RTL
    final isRtl = Directionality.of(context) == TextDirection.rtl;

    return SafeArea(
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 24.w, vertical: 16.h),
        width: double.infinity,
        color: Colors.transparent,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          textDirection: isRtl ? TextDirection.rtl : TextDirection.ltr,
          children: [
            Row(
              children: [
                SizedBox(
                  width: 44.w,
                  height: 44.w,
                  child: InkWell(
                    borderRadius: BorderRadius.circular(12.r),
                    onTap: () {
                      controller2.goToPreviousStep();
                    },
                    child: Image.asset(ImagesManager.back),
                  ),
                ),
                SizedBox(width: 160.w),
                // Step Text
                Text(
                  'step_of'.trParams({
                    'current': currentStep.toString(),
                    'total': totalSteps.toString(),
                  }),
                  style: Theme.of(
                    context,
                  ).textTheme.bodyMedium!.copyWith(fontSize: 12.sp),
                ),

                // Step Indicator
                Container(
                  margin: EdgeInsets.only(right: 8.w),
                  padding: EdgeInsets.zero,
                  decoration: BoxDecoration(
                    color: Colors.transparent,
                    borderRadius: BorderRadius.circular(16.r),
                  ),
                  child: Stack(
                    alignment: isRtl
                        ? Alignment.centerRight
                        : Alignment.centerLeft, // لضمان البداية الصحيحة
                    children: [
                      // Background Bar (الرمادي)
                      Container(
                        width: progressWidth.w,
                        height: 7.h,
                        decoration: BoxDecoration(
                          color: Get.isDarkMode
                              ? const Color(0xFF333333)
                              : ColorsManager.dividerColorLight,
                          borderRadius: BorderRadius.circular(40.r),
                        ),
                      ),

                      // Progress Indicator (الشريط البرتقالي الممتد)
                      Positioned(
                        // نثبت البداية من اليمين في حالة RTL
                        right: isRtl ? 0 : null,
                        left: isRtl ? null : 0,
                        child: Container(
                          // العرض هنا هو الذي يتغير بناءً على الخطوة الحالية
                          width: (currentStep / totalSteps) * progressWidth.w,
                          height: 7.h,
                          decoration: BoxDecoration(
                            color: ColorsManager.primaryCTA,
                            borderRadius: BorderRadius.circular(40.r),
                            boxShadow: [
                              BoxShadow(
                                color: ColorsManager.shadow,
                                blurRadius: 4.r,
                                offset: Offset(
                                  isRtl ? 2.w : -2.w,
                                  0,
                                ), // عكس اتجاه الظل حسب اللغة
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
