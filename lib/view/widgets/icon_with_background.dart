import 'package:crowdfunding_platform/controller/core/constants/colors_manager.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class IconWithBackground extends StatelessWidget {
   IconWithBackground({super.key , required this.icon , this.onTap});
final String icon ;
void Function()? onTap;
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
          color: isDark ? ColorsManager.dividerColorDark : ColorsManager.white,
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
