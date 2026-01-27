import 'package:crowdfunding_platform/controller/core/constants/colors_manager.dart';
import 'package:crowdfunding_platform/controller/core/constants/images_manager.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

class Header extends StatelessWidget {
  const Header({
    super.key,
    required this.title,
    required this.subTitle,
    required this.profileUrl,
  });
  final String title;
  final String subTitle;
  final String profileUrl;
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          width: 60.w,
          height: 60.h,
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage(profileUrl),
              fit: BoxFit.cover,
            ),
            shape: BoxShape.circle,
          ),
        ),
        SizedBox(width: 8.w),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                title,
                style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                  fontWeight: FontWeight.bold,
                  color: Theme.of(context).colorScheme.primary,
                ),
              ),
              FittedBox(
                fit: BoxFit.scaleDown,
                child: Text(
                  subTitle,
                  style: Theme.of(context).textTheme.bodySmall?.copyWith(
                    color: ColorsManager.secondaryLight,
                  ),
                ),
              ),
            ],
          ),
        ),
        SizedBox(width: 28.w),

        SvgPicture.asset(
          ImagesManager.notificationIcon,
          width: 48.w,
          height: 48.h,
        ),
      ],
    );
  }
}
