import 'package:crowdfunding_platform/controller/core/constants/colors_manager.dart';
import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class DottedButton extends StatelessWidget {
  const DottedButton({
    super.key,
    required this.label,
    required this.actionText,
    required this.formatsText,
    this.onTap,
    this.icon,
  });
  final String label;
  final String actionText;
  final String formatsText;
  final VoidCallback? onTap;
  final Widget? icon;
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: Theme.of(context).textTheme.labelLarge?.copyWith(
            color: Theme.of(context).colorScheme.primary,
            fontWeight: FontWeight.bold,
          ),
        ),
        SizedBox(height: 12.h),
        DottedBorder(
          color: Theme.of(context).colorScheme.primary,
          strokeWidth: 2,
          dashPattern: const [6, 4],
          borderType: BorderType.RRect,
          radius: Radius.circular(16.r),
          child: InkWell(
            onTap: onTap,
            borderRadius: BorderRadius.circular(16.r),
            child: Container(
              width: double.infinity,
              padding: EdgeInsets.symmetric(vertical: 24.h, horizontal: 16.w),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: Theme.of(context).colorScheme.onInverseSurface,
                    ),
                    child: Center(
                      child:
                          icon ??
                          Icon(Icons.add_photo_alternate_outlined, size: 28.sp),
                    ),
                  ),
                  SizedBox(height: 12.h),
                  Text(
                    actionText,
                    style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                      color: Theme.of(context).colorScheme.primary,
                      fontWeight: FontWeight.bold,
                    ),
                    textAlign: TextAlign.center,
                  ),
                  SizedBox(height: 6.h),
                  Text(
                    formatsText,
                    style: Theme.of(context).textTheme.bodySmall?.copyWith(
                      color: ColorsManager.secondaryLight,
                      fontWeight: FontWeight.bold,
                    ),
                    textAlign: TextAlign.center,
                  ),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }
}
