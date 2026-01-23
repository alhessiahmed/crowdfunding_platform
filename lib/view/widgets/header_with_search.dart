import 'package:crowdfunding_platform/controller/core/constants/colors_manager.dart';
import 'package:crowdfunding_platform/controller/core/constants/images_manager.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

class HeaderWithSearch extends StatelessWidget {
  const HeaderWithSearch({super.key ,required this.title , this.subTitle});
final String title;
final String? subTitle;

  @override
  Widget build(BuildContext context) {
     return Padding(
      padding: EdgeInsets.symmetric(vertical: 16.h, horizontal: 24.w),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  textAlign: TextAlign.right,
                  style: Theme.of(context).textTheme.bodyLarge,
                ),
                subTitle != null ?
                 Text(
                  subTitle!,
                  textAlign: TextAlign.right,
                  style: Theme.of(context).textTheme.bodySmall!.copyWith(color: ColorsManager.secondaryLight),
                ): SizedBox.shrink()
              ],
            ),
          ),
          GestureDetector(
            onTap: () {
              // handle search tap
            },
            child: CircleAvatar(
              backgroundColor: Theme.of(context).colorScheme.onSurface,
              radius: 22.r,
              child: SvgPicture.asset(
                ImagesManager.search,
                fit: BoxFit.scaleDown,
                color: 
                 Get.isDarkMode
                    ? ColorsManager.primaryLight
                    : ColorsManager.primaryDark,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
