import 'package:crowdfunding_platform/view/widgets/step_indicator.dart';
import 'package:crowdfunding_platform/view/widgets/update_campaign_widget/campaign_stars_info.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CampaignProgressInfoWidget extends StatelessWidget {
  const CampaignProgressInfoWidget({
    super.key,
    required this.currentStars,
    required this.totalStars,
  });
  final int currentStars;
  final int totalStars;
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        CampaignStarsInfo(currentStars: currentStars, totalStars: totalStars),
        SizedBox(height: 8.h),
        StepIndicator(progress: currentStars / totalStars),
      ],
    );
  }
}
