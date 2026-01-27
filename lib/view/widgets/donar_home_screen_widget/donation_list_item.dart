import 'package:crowdfunding_platform/controller/core/constants/colors_manager.dart';
import 'package:crowdfunding_platform/controller/core/constants/images_manager.dart';
import 'package:crowdfunding_platform/view/widgets/update_campaign_widget/app_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get_connect/http/src/utils/utils.dart';
import 'package:get/get_utils/src/extensions/internacionalization.dart';

class DonationListItem extends StatelessWidget {
  const DonationListItem({
    super.key,
    required this.title,
    required this.stars,
    required this.timeAgo,
    required this.imagePath,
    this.onTap,
  });

  final String title;
  final int stars;
  final String timeAgo;
  final String imagePath;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    return AppCard(
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(16.r),
            child: Image.asset(
              imagePath,
              fit: BoxFit.cover,
              width: 91.w,
              height: 67.h,
            ),
          ),
          SizedBox(width: 10.w),
          Expanded(
            child: Column(
              children: [
                Row(
                  children: [
                    Flexible(
                      child: Text(
                        title,
                        style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                          color: Theme.of(context).colorScheme.primary,
                          fontWeight: FontWeight.bold,
                          fontSize: 12.sp,
                        ),
                      ),
                    ),
                    SizedBox(width: 4.w),
                    Text(
                      stars.toString(),
                      style: Theme.of(context).textTheme.headlineSmall
                          ?.copyWith(
                            fontWeight: FontWeight.bold,
                            color: Theme.of(context).colorScheme.primary,
                          ),
                    ),
                    SizedBox(width: 4.w),
                    SvgPicture.asset(
                      ImagesManager.starIcon,
                      width: 16.w,
                      height: 16.h,
                      colorFilter: ColorFilter.mode(
                        ColorsManager.primaryLight,
                        BlendMode.srcIn,
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 10.h),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Expanded(
                      child: Text(
                        timeAgo,
                        style: Theme.of(context).textTheme.bodySmall?.copyWith(
                          color: ColorsManager.secondaryLight,
                          fontWeight: FontWeight.normal,
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 24.h,
                      width: 97.w,
                      child: ElevatedButton.icon(
                        onPressed: onTap,
                        style: ElevatedButton.styleFrom(
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8.r),
                          ),
                          padding: EdgeInsets.symmetric(
                            horizontal: 8.w,
                            vertical: 4.h,
                          ),
                        ),
                        label: FittedBox(
                          fit: BoxFit.scaleDown,
                          child: Row(
                            children: [
                              Text(
                                'Campaign_Offer'.tr,
                                style: Theme.of(context).textTheme.bodySmall
                                    ?.copyWith(color: ColorsManager.bgColor),
                              ),
                              SizedBox(width: 4.w),
                              SvgPicture.asset(ImagesManager.rightArrowIcon),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
