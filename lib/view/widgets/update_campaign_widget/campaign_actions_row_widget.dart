import 'package:crowdfunding_platform/controller/core/constants/images_manager.dart';
import 'package:crowdfunding_platform/view/widgets/update_campaign_widget/app_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get_utils/src/extensions/internacionalization.dart';

class CampaignActionsRowWidget extends StatelessWidget {
  const CampaignActionsRowWidget({super.key, this.actions});

  final List<CampaignActionItem>? actions;

  @override
  Widget build(BuildContext context) {
    final items = actions ?? _defaultActions;
    return Row(
      children: List.generate(items.length, (index) {
        final item = items[index];
        return Expanded(
          child: Padding(
            padding: EdgeInsetsDirectional.only(
              end: index == items.length - 1 ? 0 : 12.w,
            ),
            child: _ActionCard(item: item),
          ),
        );
      }),
    );
  }

  List<CampaignActionItem> get _defaultActions => const [
    CampaignActionItem(iconPath: ImagesManager.settingIcon, labelKey: 'Edit'),
    CampaignActionItem(iconPath: ImagesManager.share, labelKey: 'Share'),
    CampaignActionItem(iconPath: ImagesManager.addIcon, labelKey: 'Add_Update'),
  ];
}

class CampaignActionItem {
  const CampaignActionItem({
    required this.iconPath,
    required this.labelKey,
    this.onTap,
  });

  final String iconPath;
  final String labelKey;
  final VoidCallback? onTap;
}

class _ActionCard extends StatelessWidget {
  const _ActionCard({required this.item});

  final CampaignActionItem item;

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    final labelColor = colorScheme.primary;
    final labelStyle = Theme.of(context).textTheme.bodySmall?.copyWith(
      color: labelColor,
      fontWeight: FontWeight.bold,
    );

    return InkWell(
      borderRadius: BorderRadius.circular(16.r),
      onTap: item.onTap,
      child: AppCard(
        padding: EdgeInsets.symmetric(vertical: 16.h, horizontal: 20.w),
        backGroundColor: colorScheme.surface,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            SvgPicture.asset(
              item.iconPath,
              width: 24.w,
              height: 24.h,
            ),
            SizedBox(height: 4.h),
            FittedBox(
              child: Text(
                item.labelKey.tr,
                style: labelStyle,
                textAlign: TextAlign.center,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
