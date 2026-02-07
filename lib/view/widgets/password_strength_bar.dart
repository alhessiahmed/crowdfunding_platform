import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../controller/core/constants/colors_manager.dart';

class PasswordStrengthBar extends StatelessWidget {
  final double strength;

  const PasswordStrengthBar({super.key, required this.strength});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: List.generate(4, (index) {
        final active = strength > (index + 0) / 4;
        return Expanded(
          child: Container(
            height: 5.h,
            margin: EdgeInsets.symmetric(horizontal: 4.w),
            decoration: BoxDecoration(
              color: active
                  ? ColorsManager.primaryCTA
                  : Get.isDarkMode
                  ? ColorsManager.iconDefaultDark
                  : ColorsManager.iconDefaultLight,
              borderRadius: BorderRadius.circular(100.r),
            ),
          ),
        );
      }),
    );
  }
}
