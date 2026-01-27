import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AppCard extends StatelessWidget {
  const AppCard({
    super.key,
    required this.child,
    this.padding,
    this.backGroundColor,
    this.shadow = false,
  });

  final Widget child;
  final EdgeInsetsGeometry? padding;
  final Color? backGroundColor;
  final bool shadow;
  @override
  Widget build(BuildContext context) {
    final shadows = shadow
        ? [
            BoxShadow(
              color: Colors.black.withValues(alpha: .08),
              blurRadius: 16,
              offset: const Offset(0, 6),
            ),
            BoxShadow(
              color: Colors.black.withValues(alpha: 0.04),
              blurRadius: 4,
              offset: const Offset(0, 1),
            ),
          ]
        : <BoxShadow>[];

    return Container(
      padding: padding ?? EdgeInsets.all(16.r),
      decoration: BoxDecoration(
        color:
            backGroundColor ?? Theme.of(context).colorScheme.onInverseSurface,
        borderRadius: BorderRadius.circular(24.r),
        border: Border.all(
          width: 0.5,
          color: Theme.of(context).colorScheme.outline,
        ),
        boxShadow: shadows,
      ),
      child: child,
    );
  }
}
