import 'package:crowdfunding_platform/controller/core/constants/colors_manager.dart';
import 'package:crowdfunding_platform/view/widgets/custom_app_bar.dart';
import 'package:flutter/material.dart';
import 'package:get/get_utils/src/extensions/internacionalization.dart';

class AppbarSection extends StatelessWidget {
  const AppbarSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CustomAppBar(title: 'Campaign_Management'.tr),
        SizedBox(height: 8),
        Text(
          'Control_the_details_of_your_campaign_and_monitor_its_performance.'
              .tr,
          style: Theme.of(
            context,
          ).textTheme.bodySmall?.copyWith(color: ColorsManager.secondaryLight),
        ),
      ],
    );
  }
}
