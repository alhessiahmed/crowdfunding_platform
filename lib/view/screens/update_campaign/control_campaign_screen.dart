import 'package:crowdfunding_platform/controller/core/constants/colors_manager.dart';
import 'package:crowdfunding_platform/controller/core/constants/images_manager.dart';
import 'package:crowdfunding_platform/controller/getx/controllers/campgin_update_and_control_controllers/control_campaign_controller.dart';
import 'package:crowdfunding_platform/model/control_campaign.dart';
import 'package:crowdfunding_platform/view/widgets/update_campaign_widget/appbar_section.dart';
import 'package:crowdfunding_platform/view/widgets/update_campaign_widget/campaign_actions_row_widget.dart';
import 'package:crowdfunding_platform/view/widgets/update_campaign_widget/campaign_dateils_card_widget.dart';
import 'package:crowdfunding_platform/view/widgets/update_campaign_widget/over_view_status.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class ControlCampaignScreen extends GetView<ControlCampaignController> {
  const ControlCampaignScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final summary = controller.campaign.summary;
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const AppbarSection(),
              SizedBox(height: 24.h),
              CampaignDateilsCardWidget(
                campaignTitle: summary.titleKey.tr,
                currentStars: summary.starsCollected,
                endDuring: summary.daysRemaining,
                imagePath: summary.imagePath,
                statusBadgeColor: ColorsManager.success,
                statusBadgeText: summary.statusLabelKey.tr,
                totalStars: summary.starsTarget,
              ),
              SizedBox(height: 16.h),
              CampaignActionsRowWidget(
                actions: [
                  CampaignActionItem(
                    iconPath: ImagesManager.addIcon,
                    labelKey: 'Add_Update',
                    onTap: () =>
                        controller.onActionTap(ControlActionType.addUpdate),
                  ),
                  CampaignActionItem(
                    iconPath: ImagesManager.share,
                    labelKey: 'Share',
                    onTap: () =>
                        controller.onActionTap(ControlActionType.share),
                  ),
                  CampaignActionItem(
                    iconPath: ImagesManager.settingIcon,
                    labelKey: 'Edit',
                    onTap: () => controller.onActionTap(ControlActionType.edit),
                  ),
                ],
              ),
              SizedBox(height: 16.h),
              Text(
                'Performance_Overview'.tr,
                style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                  color: Theme.of(context).colorScheme.primary,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 12.h),
              OverViewStatus(
                daysRemaining: 12,
                supporters: 45,
                totalStars: 2500,
              ),
            ],
          ).paddingSymmetric(horizontal: 24.w),
        ),
      ),
    );
  }
}
