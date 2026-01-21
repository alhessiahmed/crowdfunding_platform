import 'package:crowdfunding_platform/view/widgets/update_campaign_widget/app_card.dart';
import 'package:crowdfunding_platform/view/widgets/update_campaign_widget/campaing_progress_info_widget.dart';
import 'package:crowdfunding_platform/view/widgets/update_campaign_widget/image_withe_badge.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/utils.dart';

class CampaignDateilsCardWidget extends StatelessWidget {
  const CampaignDateilsCardWidget({
    super.key,
    required this.imagePath,
    required this.statusBadgeText,
    required this.statusBadgeColor,
    required this.currentStars,
    required this.totalStars,
    required this.endDuring,
    required this.campaignTitle,
  });
  final String imagePath;
  final String statusBadgeText;
  final Color statusBadgeColor;
  final int currentStars;
  final int totalStars;
  final int endDuring;
  final String campaignTitle;

  @override
  Widget build(BuildContext context) {
    return AppCard(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ImageWitheBadge(
            imagePath: imagePath,
            statusBadgeColor: statusBadgeColor,
            statusBadgeText: statusBadgeText,
          ),
          SizedBox(height: 12.h),
          Text(
            campaignTitle,
            style: Theme.of(context).textTheme.headlineSmall?.copyWith(
              color: Theme.of(context).colorScheme.primary,

              // fontWeight: FontWeight.bold,
            ),
          ),
          SizedBox(height: 12.h),
          CampaignProgressInfoWidget(
            currentStars: currentStars,
            totalStars: totalStars,
          ),
          SizedBox(height: 12.h),
          Text(
            'It_ends_within_days'.trParams({'days': '$endDuring'}),
            style: Theme.of(context).textTheme.bodySmall?.copyWith(
              color: Theme.of(context).colorScheme.primary,
            ),
          ),

          SizedBox(height: 16.h),
        ],
      ),
    ).paddingSymmetric(horizontal: 16);
  }
}
