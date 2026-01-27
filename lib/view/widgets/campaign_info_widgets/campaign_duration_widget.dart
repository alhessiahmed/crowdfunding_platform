import 'package:crowdfunding_platform/controller/core/constants/colors_manager.dart';
import 'package:crowdfunding_platform/controller/getx/controllers/campaign_create/campaign_step_three_controlller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class CampaignDurationSelector extends StatelessWidget {
  const CampaignDurationSelector({super.key});

  @override
  Widget build(BuildContext context) {
    final CampaignStepThreeController controller = Get.find();
    final bool isDark = Get.isDarkMode;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(height: 10.h),
        Obx(() {
          return Wrap(
            spacing: 8.w,
            runSpacing: 8.h,
            children: controller.durations.map((option) {
              final isSelected = controller.selectedDuration.value == option;

              return GestureDetector(
                onTap: () => controller.selectDuration(option),
                child: Container(
                  width: (MediaQuery.of(context).size.width - 56.w) / 2,
                  padding: EdgeInsets.symmetric(
                    vertical: 14.h,
                    horizontal: 8.w,
                  ),
                  decoration: BoxDecoration(
                    color: isSelected
                        ? (isDark
                              ? ColorsManager.primaryCTA
                              : ColorsManager.bgSectionLight)
                        : (isDark
                              ? ColorsManager.bgGoogle
                              : ColorsManager.white),
                    borderRadius: BorderRadius.circular(16.r),
                  ),
                  child: option is int
                      ? Column(
                          children: [
                            Text(
                              '$option',
                              style: Theme.of(context).textTheme.titleMedium
                                  ?.copyWith(
                                    color: isSelected
                                        ? (isDark
                                              ? Colors.white
                                              : ColorsManager.secondaryLight)
                                        : (isDark
                                              ? Colors.white
                                              : ColorsManager
                                                    .secondaryThanksColor),
                                  ),
                            ),
                            Text(
                              'يوم',
                              style: Theme.of(context).textTheme.bodySmall
                                  ?.copyWith(
                                    color: isSelected
                                        ? (isDark
                                              ? Colors.white
                                              : ColorsManager.secondaryLight)
                                        : (isDark
                                              ? Colors.white
                                              : ColorsManager
                                                    .secondaryThanksColor),
                                  ),
                            ),
                          ],
                        )
                      : Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Image.asset(
                              controller.calendarImage,
                              height: 24.h,
                              width: 24.w,
                            ),
                            SizedBox(height: 4.h),

                            Center(
                              child: Text(
                                option,
                                textAlign: TextAlign.center,
                                style: Theme.of(context).textTheme.titleMedium
                                    ?.copyWith(
                                      fontSize: 12,
                                      color: isSelected
                                          ? (isDark
                                                ? Colors.white
                                                : ColorsManager.secondaryLight)
                                          : (isDark
                                                ? Colors.white
                                                : ColorsManager
                                                      .secondaryThanksColor),
                                    ),
                              ),
                            ),
                          ],
                        ),
                ),
              );
            }).toList(),
          );
        }),
        SizedBox(height: 6.h),
        Obx(() {
          if (controller.selectedDuration.value ==
                  'تحديد تاريخ انتهاء الحملة' &&
              controller.endDate.isNotEmpty) {
            return Text(
              'تاريخ الانتهاء: ${controller.endDate.value}',
              style: Theme.of(context).textTheme.bodySmall,
            );
          }
          return const SizedBox.shrink();
        }),
      ],
    );
  }
}
