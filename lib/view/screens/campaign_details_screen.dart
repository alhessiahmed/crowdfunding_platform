import 'package:crowdfunding_platform/controller/core/constants/colors_manager.dart';
import 'package:crowdfunding_platform/controller/getx/controllers/campagin_details_controller.dart';
import 'package:crowdfunding_platform/model/campagin_models/campagin_model.dart';
import 'package:crowdfunding_platform/view/widgets/campaign_details_widget/campaign_update_card.dart';
import 'package:crowdfunding_platform/view/widgets/campaign_details_widget/comment_section.dart';
import 'package:crowdfunding_platform/view/widgets/campaign_details_widget/donation_button.dart';
import 'package:crowdfunding_platform/view/widgets/campaign_details_widget/header.dart';
import 'package:crowdfunding_platform/view/widgets/campaign_details_widget/popup_to_donate.dart';
import 'package:crowdfunding_platform/view/widgets/campaign_details_widget/stats_row.dart';
import 'package:crowdfunding_platform/view/widgets/campaign_details_widget/story_section.dart';
import 'package:crowdfunding_platform/view/widgets/campaign_details_widget/tabs_row.dart';
import 'package:crowdfunding_platform/view/widgets/campaign_details_widget/why_donation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class CampaignDetailsScreen extends GetView<CampaignDetailsController> {
  const CampaignDetailsScreen({super.key, required this.campaign});

  final CampaignModel campaign;

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;
    return Scaffold(
      extendBody: true,
      backgroundColor: isDark ? ColorsManager.darkBg : ColorsManager.lightBg,
      body: ListView(
        children: [
          HeaderWidget(campaign: campaign),
          _BodyContent(campaign: campaign),
          DonateButton(
            onPressed: () {
              PopupToDonate(campaignId: campaign.id,).openBottomSheet(context);
            },
          ),
        ],
      ),
    );
  }
}

class _BodyContent extends StatelessWidget {
  const _BodyContent({required this.campaign});

  final CampaignModel campaign;

  @override
  Widget build(BuildContext context) {
    return Padding(
      key: ValueKey(campaign),
      padding: EdgeInsets.symmetric(horizontal: 16.w),
      child: Column(
        children: [
           SizedBox(height: 30.h),
          StatusRow( 
            donoorsNo: campaign.likesCount.toString() ,
            goalsStarNo: campaign.goal.toString(),
            remaiaingDats: campaign.endDate.toString(),
          ),
          SizedBox(height: 18.h),
          WhyDonateSection(motiviation:  campaign.description,),
          SizedBox(height: 16.h),
          TabsRow(),
          SizedBox(height: 14.h),
          GetX<CampaignDetailsController>(
            builder: (controller) {
              if (controller.selectedTabIndex.value == 0) {
                final imageUrl = campaign.assets.isNotEmpty
                    ? campaign.assets.first.url
                    : null;
                return StorySection(
                  description: campaign.description,
                  category: campaign.category.name,
                  imageUrl: imageUrl,
                );
              }

              if (controller.isLoadingUpdates.value) {
                return Padding(
                  padding: EdgeInsets.symmetric(vertical: 24.h),
                  child: const Center(child: CircularProgressIndicator()),
                );
              }

              if (controller.campaignUpdates.isEmpty) {
                return Padding(
                  padding: EdgeInsets.symmetric(vertical: 24.h),
                  child: Text(
                    'لا توجد تحديثات حتى الآن',
                    textAlign: TextAlign.center,
                    style: Theme.of(context).textTheme.bodyMedium,
                  ),
                );
              }

              return ListView.separated(
                itemCount: controller.campaignUpdates.length,
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                separatorBuilder: (_, __) => SizedBox(height: 10.h),
                itemBuilder: (_, index) => CampaignUpdateCard(
                  update: controller.campaignUpdates[index],
                ),
              );
            },
          ),
          SizedBox(height: 10.h,),
          CommentSection(creator: campaign.creator),
          SizedBox(height: 10.h,),

        ],
      ),
    );
  }
}
