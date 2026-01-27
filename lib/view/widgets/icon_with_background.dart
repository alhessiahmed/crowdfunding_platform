import 'package:crowdfunding_platform/controller/core/constants/colors_manager.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

// ignore: must_be_immutable
class IconWithBackground extends StatelessWidget {
  IconWithBackground({
    super.key,
    required this.icon,
    this.onTap,
    this.darkColor,
    this.lightColor,
    this.withShadow = false,
  });
  final String icon;
  void Function()? onTap;
  final Color? darkColor;
  final Color? lightColor;
  final bool withShadow;

  @override
  Widget build(BuildContext context) {
    bool isDark = Theme.of(context).brightness == Brightness.dark;

    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: 44,
        height: 44,
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          color: isDark
              ? (darkColor ?? ColorsManager.dividerColorDark)
              : (lightColor ?? ColorsManager.white),
          boxShadow: [
            BoxShadow(
              color: Colors.black26,
              blurRadius: withShadow ? 4 : 0,
              offset: Offset(0, 0),
            ),
          ],
        ),
        child: SvgPicture.asset(
          fit: BoxFit.scaleDown,
          icon,
          color: isDark
              ? ColorsManager.iconDefaultDark
              : ColorsManager.iconDefaultLight,
        ),
      ),
    );
  }
}
