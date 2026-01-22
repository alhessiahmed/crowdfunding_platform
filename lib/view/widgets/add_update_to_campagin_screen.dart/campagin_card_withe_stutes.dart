import 'package:crowdfunding_platform/controller/core/constants/colors_manager.dart';
import 'package:crowdfunding_platform/controller/core/constants/images_manager.dart';
import 'package:crowdfunding_platform/view/widgets/update_campaign_widget/app_card.dart';
import 'package:crowdfunding_platform/view/widgets/update_campaign_widget/card_states_badge.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/utils.dart';

class CampaignCardWitheStates extends StatelessWidget {
  const CampaignCardWitheStates({super.key});

  @override
  Widget build(BuildContext context) {
    return AppCard(
      padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 16.h),
      child: Row(
        children: [
          Image.asset(ImagesManager.placeHolder, height: 82.h, width: 91.w),
          SizedBox(width: 16.w),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'قطرة حياة : مياه نظيفة لأطفال غزة',
                  maxLines: 2,
                  style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                    color: Theme.of(context).colorScheme.primary,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: 10.h),
                SizedBox(
                  child: CardStatesBadge(
                    radius: 16.r,

                    statusText: 'Complete_campaign'.tr,
                    icon: SvgPicture.asset(
                      ImagesManager.completeIcon,
                      height: 16.h,
                      width: 16.w,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
