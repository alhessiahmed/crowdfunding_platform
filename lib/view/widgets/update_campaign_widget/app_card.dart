import 'package:crowdfunding_platform/controller/core/constants/colors_manager.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AppCard extends StatelessWidget {
  const AppCard({
    super.key,
    required this.child,
    this.padding,
    this.backGroundColor,
  });

  final Widget child;
  final EdgeInsetsGeometry? padding;
  final Color? backGroundColor;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: padding ?? EdgeInsets.all(16.r),
      decoration: BoxDecoration(
        color:
            backGroundColor ?? Theme.of(context).colorScheme.onInverseSurface,
        borderRadius: BorderRadius.circular(24.r),
        border: Border.all(width: 0.5, color: ColorsManager.disabled),
        boxShadow: const [
          //  BoxShadow(color: Colors.black12, offset: Offset(0, 1)),
        ],
      ),
      child: child,
    );
  }
}
