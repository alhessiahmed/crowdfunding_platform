import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../controller/core/constants/colors_manager.dart';

class StepIndicator extends StatelessWidget {
  const StepIndicator({
    super.key,
    required this.progress,
    // required this.currentStep,
    // this.totalSteps = 4,
  });

  // final int currentStep;
  // final int totalSteps;
  final double progress;

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        // final progress = (currentStep / totalSteps).clamp(0.0, 1.0);

        return Container(
          height: 8.h,
          decoration: BoxDecoration(
            color: Get.isDarkMode
                ? ColorsManager.dividerColorDark
                : ColorsManager.dividerColorLight,
            borderRadius: BorderRadius.circular(12.r),
          ),
          child: Stack(
            children: [
              Container(
                height: 8.h,
                decoration: BoxDecoration(
                  color: Get.isDarkMode
                      ? ColorsManager.dividerColorDark
                      : ColorsManager.dividerColorLight,
                  borderRadius: BorderRadius.circular(12.r),
                ),
              ),
              AnimatedContainer(
                duration: const Duration(milliseconds: 600),
                curve: Curves.easeInOut,
                width: constraints.maxWidth * progress,
                decoration: BoxDecoration(
                  color: ColorsManager.primaryCTA,
                  borderRadius: BorderRadius.circular(12.r),
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
