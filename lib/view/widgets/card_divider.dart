import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CardDivider extends StatelessWidget {
  const CardDivider({super.key, this.padding, this.height, this.color});
  final double? padding;
  final double? height;
  final Color? color;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: padding ?? 16.h),
      child: Divider(
        height: height ?? 1.h,
        color: color ?? Theme.of(context).dividerColor,
      ),
    );
  }
}
