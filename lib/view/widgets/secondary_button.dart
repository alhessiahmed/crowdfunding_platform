import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../controller/core/constants/colors_manager.dart';

class SecondaryButton extends StatelessWidget {
  final String label;
  final VoidCallback? onPressed;
  final double height;
  final double borderRadius;
  final Color? color;
  const SecondaryButton({
    super.key,
    required this.label,
    this.onPressed,
    this.height = 56,
    this.borderRadius = 16,
    this.color,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;
    final isDark = theme.brightness == Brightness.dark;

    return SizedBox(
      height: height.h,
      width: double.infinity,
      child: ElevatedButton(
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
          elevation: 0, // critical: remove shadow
          backgroundColor: color ?? colorScheme.surface, // matches background
          foregroundColor: isDark
              ? ColorsManager.primaryTextDark
              : ColorsManager.primaryLight,
          side: BorderSide(
            color: ColorsManager.primaryLight, // SAME in both themes
            width: 2.r,
          ),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(borderRadius.r),
          ),
        ),
        child: Text(
          label,
          style: theme.textTheme.bodyMedium?.copyWith(
            fontWeight: FontWeight.bold,
            color: Get.isDarkMode
                ? ColorsManager.primaryTextDark
                : ColorsManager.primaryLight,
          ),
        ),
      ),
    );
  }
}
