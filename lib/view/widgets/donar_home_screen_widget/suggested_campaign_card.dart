import 'package:crowdfunding_platform/controller/core/constants/colors_manager.dart';
import 'package:crowdfunding_platform/controller/core/constants/images_manager.dart';
import 'package:crowdfunding_platform/view/widgets/step_indicator.dart';
import 'package:crowdfunding_platform/view/widgets/update_campaign_widget/app_card.dart';
import 'package:crowdfunding_platform/view/widgets/update_campaign_widget/card_states_badge.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get_utils/src/extensions/internacionalization.dart';

class SuggestedCampaignCard extends StatelessWidget {
  const SuggestedCampaignCard({
    super.key,
    required this.title,
    required this.description,
    required this.imagePath,
    required this.stars,
    this.goalNumber = 100,
    this.onDonate,
    this.onViewDetails,
  });

  final String title;
  final String description;
  final String imagePath;
  final int stars;
  final int goalNumber;
  final VoidCallback? onDonate;
  final VoidCallback? onViewDetails;

  @override
  Widget build(BuildContext context) {
    return AppCard(
      padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 10.h),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,

        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Expanded(
            child: Stack(
              alignment: Alignment.center,
              children: [
                Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10.r),
                  ),
                  child: Image.asset(
                    width: double.infinity,
                    height: 125.h,
                    imagePath,
                    fit: BoxFit.fill,
                  ),
                ),
                Positioned(
                  top: 10.h,
                  right: 16.w,
                  child: Container(
                    padding: EdgeInsets.symmetric(
                      horizontal: 5.w,
                      vertical: 3.h,
                    ),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(62.r),
                      color: ColorsManager.dividerColorLight,
                    ),
                    child: Text(
                      'إغاثي',
                      style: Theme.of(context).textTheme.bodySmall?.copyWith(
                        color: Theme.of(context).primaryColor,
                        fontWeight: FontWeight.bold,
                        fontSize: 8.sp,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          SizedBox(height: 8.h),
          Text(
            title,
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
            style: Theme.of(context).textTheme.bodySmall?.copyWith(
              color: ColorsManager.primaryLight,
              fontWeight: FontWeight.w600,
            ),
          ),
          SizedBox(height: 8.h),
          Text(
            description,
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
            style: Theme.of(context).textTheme.bodySmall?.copyWith(
              color: ColorsManager.secondaryLight,
              fontSize: 8.sp,
            ),
          ),
          SizedBox(height: 8.h),
          Row(
            children: [
              SvgPicture.asset(
                ImagesManager.starIcon,
                width: 14.w,
                height: 14.w,
                colorFilter: const ColorFilter.mode(
                  ColorsManager.iconDefaultLight,
                  BlendMode.srcIn,
                ),
              ),
              SizedBox(width: 4.w),
              Text(
                '$stars ${'star'.tr}',
                style: Theme.of(context).textTheme.bodySmall?.copyWith(
                  color: ColorsManager.primaryLight,
                ),
              ),
              Spacer(),
              Text(
                'Goal'.trParams({'Number': goalNumber.toString()}),
                style: Theme.of(context).textTheme.bodySmall?.copyWith(
                  color: ColorsManager.primaryLight,
                  fontSize: 7.sp,
                ),
              ),
            ],
          ),
          SizedBox(height: 8.h),
          SizedBox(
            height: 5.h,
            child: StepIndicator(progress: stars / goalNumber),
          ),
          SizedBox(height: 8.h),

          Row(
            children: [
              Expanded(
                child: SizedBox(
                  height: 36.h,
                  child: ElevatedButton(
                    onPressed: onViewDetails,
                    style: ElevatedButton.styleFrom(
                      backgroundColor: ColorsManager.secondaryThanksColor,
                      padding: EdgeInsets.symmetric(horizontal: 10.w),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12.r),
                      ),
                      textStyle: Theme.of(context).textTheme.bodySmall
                          ?.copyWith(
                            fontWeight: FontWeight.w600,
                            fontSize: 10.sp,
                          ),
                    ),
                    child: FittedBox(
                      fit: BoxFit.scaleDown,
                      child: Text(
                        'View_details'.tr,
                        maxLines: 1,
                        textAlign: TextAlign.center,
                      ),
                    ),
                  ),
                ),
              ),
              SizedBox(width: 8.w),

              Expanded(
                child: SizedBox(
                  height: 36.h,
                  child: ElevatedButton(
                    onPressed: onDonate,
                    style: ElevatedButton.styleFrom(
                      padding: EdgeInsets.symmetric(horizontal: 10.w),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12.r),
                      ),
                      textStyle: Theme.of(context).textTheme.bodySmall
                          ?.copyWith(
                            fontWeight: FontWeight.w600,
                            fontSize: 10.sp,
                          ),
                    ),
                    child: Text(
                      'Donate_immediately'.tr,
                      textAlign: TextAlign.center,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
