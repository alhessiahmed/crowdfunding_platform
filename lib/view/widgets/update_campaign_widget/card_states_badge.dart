import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CardStatesBadge extends StatelessWidget {
  const CardStatesBadge({
    super.key,
    required this.statusText,
    this.statusColor,
    this.radius,
    this.icon,
  });
  final String statusText;
  final Color? statusColor;
  final double? radius;
  final Widget? icon;
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.surfaceVariant,
        borderRadius: BorderRadius.circular(radius ?? 8.r),
      ),
      padding: EdgeInsets.symmetric(horizontal: 8.w, vertical: 4.h),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          icon ??
              Container(
                height: 8.h,
                width: 8.w,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: statusColor,
                ),
              ),
          SizedBox(width: 6.w),
          Text(
            statusText,
            style: Theme.of(context).textTheme.bodySmall?.copyWith(
              color: Theme.of(context).colorScheme.onSurface,
              fontWeight: FontWeight.bold,
              height: 1,
            ),
            textHeightBehavior: const TextHeightBehavior(
              applyHeightToFirstAscent: false,
              applyHeightToLastDescent: false,
            ),
           ),
        ],
      ),
    );
  }
}
