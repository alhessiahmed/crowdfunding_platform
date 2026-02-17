import 'package:crowdfunding_platform/controller/getx/controllers/discover_controller.dart';
import 'package:crowdfunding_platform/model/campagin_models/campagin_model.dart';
import 'package:crowdfunding_platform/view/widgets/campaign_card.dart';
import 'package:crowdfunding_platform/view/widgets/filter_section.dart';
import 'package:crowdfunding_platform/view/widgets/header_with_search.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:skeletonizer/skeletonizer.dart';
class DiscoverScreen extends StatelessWidget {
  const DiscoverScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<DiscoverController>(
      init: DiscoverController(),
      builder: (ctrl) {
        return Scaffold(
          body: SafeArea(
            child: Column(
              children: [
                HeaderWithSearch(
                  title: 'every_star_makes_a_difference'.tr,
                ),

                FilterSection(
                  filters: ctrl.filters,
                  selectedIndex: ctrl.selectedFilterIndex,
                  onSelect: ctrl.selectCategory,
                 // campaignNo: ctrl.categoryCounts.,
                ),

                SizedBox(height: 12.h),

                Expanded(
                  child: CampaignsList(
                    context,
                    ctrl.campaigns,
                    ctrl.isLoading,
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }

Widget CampaignsList(
  BuildContext context,
  List<CampaignModel> campaigns,
  bool isLoading,
) {
  // Skeleton
  if (isLoading && campaigns.isEmpty) {
    return Skeletonizer(
      enabled: true,
      child: ListView.builder(
        padding: EdgeInsets.only(left: 16.w, right: 16.w, bottom: 130.h),
        itemCount: 5,
        itemBuilder: (_, __) {
          return CampaignCard(
            campaign: CampaignModel.skelton(),
          );
        },
      ),
    );
  }

  // Empty Statep
  if (!isLoading && campaigns.isEmpty) {
    return Center(
      child: Text(
        'لا توجد حملات حالياً',
        style: Theme.of(context)
            .textTheme
            .bodyMedium
            ?.copyWith(color: Colors.black),
      ),
    );
  }

  // Normal List
  return ListView.builder(
    padding: EdgeInsets.only(left: 16.w, right: 16.w, bottom: 130.h),
    itemCount: campaigns.length,
    itemBuilder: (_, index) {
      return CampaignCard(
        campaign: campaigns[index],
      );
    },
  );
}


}
