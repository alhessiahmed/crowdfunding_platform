import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

import '../../controller/core/constants/colors_manager.dart';
import '../../controller/core/constants/images_manager.dart';

class PasswordRule extends StatelessWidget {
  final String text;
  final bool isValid;

  const PasswordRule({super.key, required this.text, required this.isValid});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        SvgPicture.asset(
          ImagesManager.checkIconDark,
          colorFilter: ColorFilter.mode(
            isValid
                ? ColorsManager.primaryCTA
                : Get.isDarkMode
                ? ColorsManager.iconDefaultDark
                : ColorsManager.iconDefaultLight,
            BlendMode.srcIn,
          ),
        ),
        SizedBox(width: 4.w),
        Text(
          text,
          style: Theme.of(context).textTheme.bodySmall!.copyWith(
            color: Theme.of(context).colorScheme.onSurfaceVariant,
          ),
        ),
      ],
    );
  }
}
