import 'package:crowdfunding_platform/controller/core/constants/colors_manager.dart';
import 'package:crowdfunding_platform/view/widgets/campaign_details_widget/comment_section.dart';
import 'package:crowdfunding_platform/view/widgets/campaign_details_widget/donation_button.dart';
import 'package:crowdfunding_platform/view/widgets/campaign_details_widget/header.dart';
import 'package:crowdfunding_platform/view/widgets/campaign_details_widget/stats_row.dart';
import 'package:crowdfunding_platform/view/widgets/campaign_details_widget/story_section.dart';
import 'package:crowdfunding_platform/view/widgets/campaign_details_widget/tabs_row.dart';
import 'package:crowdfunding_platform/view/widgets/campaign_details_widget/why_donation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CampaignDetailsScreen extends StatelessWidget {
  const CampaignDetailsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;
    return Scaffold(
      extendBody: true,
      backgroundColor: isDark ? ColorsManager.darkBg : ColorsManager.lightBg,
      body: ListView(
        children: [const HeaderWidget(), _BodyContent(), DonateButton(() {})],
      ),
    );
  }
}

class _BodyContent extends StatelessWidget {
  const _BodyContent();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 16.w),
      child: Column(
        children: [
          // SizedBox(height: 14.h),
          StatsRow(),
          SizedBox(height: 18.h),
          WhyDonateSection(),
          SizedBox(height: 16.h),
          TabsRow(),
          SizedBox(height: 14.h),
          StorySection(),
          SizedBox(height: 10.h),
          CommentSection(),
        ],
      ),
    );
  }
}
