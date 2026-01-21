import 'package:crowdfunding_platform/controller/core/constants/colors_manager.dart';
import 'package:crowdfunding_platform/controller/core/constants/images_manager.dart';
import 'package:crowdfunding_platform/controller/getx/controllers/campgin_update_and_control_controllers/control_campaign_controller.dart';
import 'package:crowdfunding_platform/view/widgets/update_campaign_widget/appbar_section.dart';
import 'package:crowdfunding_platform/view/widgets/update_campaign_widget/campaign_dateils_card_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get_state_manager/src/simple/get_view.dart';
import 'package:get/utils.dart';

class ControlCampaignScreen extends GetView<ControlCampaignController> {
  const ControlCampaignScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              AppbarSection(),
              SizedBox(height: 24),
              CampaignDateilsCardWidget(
                campaignTitle: 'مياه نظيفة للجميع',
                currentStars: 2500,
                endDuring: 20,
                imagePath: ImagesManager.test,
                statusBadgeColor: ColorsManager.success,
                statusBadgeText: "نشطة",
                totalStars: 5000,
              ),
            ],
          ).paddingSymmetric(horizontal: 24),
        ),
      ),
    );
  }
}
