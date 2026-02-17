import 'package:crowdfunding_platform/controller/getx/controllers/my_campagins_controller.dart';
import 'package:crowdfunding_platform/model/campagin_models/campagin_model.dart';
import 'package:crowdfunding_platform/view/widgets/filter_section.dart';
import 'package:crowdfunding_platform/view/widgets/header_with_search.dart';
import 'package:crowdfunding_platform/view/widgets/my_campagine_widgets/my_campagins_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:skeletonizer/skeletonizer.dart';

class MyCampaignsScreen extends GetView<MyCampaginsController> {
  const MyCampaignsScreen({super.key, required this.creatorId});

  final String creatorId;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            HeaderWithSearch(
              title: 'my_campaigns'.tr,
              subTitle: 'manage_campaigns_and_track'.tr,
            ),
            SizedBox(height: 15.h),
            Obx(
              () => FilterSection(
                filters: controller.filters,
                selectedIndex: controller.selectedFilterIndex.value,
                onSelect: controller.selectFilter,
              ),
            ),
            SizedBox(height: 20.h),
            Expanded(
              child: Obx(() {
                final isLoading = controller.isLoading.value;
                final campaigns = controller.filteredCampaigns;

                if (isLoading) {
                  return Skeletonizer(
                    enabled: true,
                    child: ListView.builder(
                      itemCount: 4,
                      padding: EdgeInsets.only(bottom: 120.h),
                      itemBuilder: (_, __) {
                        return MyCampaginsCard(
                          myCampaign: CampaignModel.skelton(),
                        );
                      },
                    ),
                  );
                }

                if (!isLoading && campaigns.isEmpty) {
                  return const Center(child: Text('there are no campaigns yet'));
                }

                return ListView.builder(
                  itemCount: campaigns.length,
                  padding: EdgeInsets.only(bottom: 120.h),
                  itemBuilder: (context, index) {
                    return MyCampaginsCard(myCampaign: campaigns[index]);
                  },
                );
              }),
            ),
          ],
        ),
      ),
    );
  }
}

