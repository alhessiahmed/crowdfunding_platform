import 'package:crowdfunding_platform/controller/core/constants/colors_manager.dart';
import 'package:crowdfunding_platform/controller/core/constants/images_manager.dart';
import 'package:crowdfunding_platform/model/control_campaign.dart';
import 'package:crowdfunding_platform/view/widgets/update_campaign_widget/app_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

class LastUpdatesCard extends StatelessWidget {
  const LastUpdatesCard({super.key, required this.update, this.onLikeTap});

  final CampaignUpdate update;
  final VoidCallback? onLikeTap;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final secondaryTextColor = theme.brightness == Brightness.dark
        ? ColorsManager.secondaryDark
        : ColorsManager.secondaryLight;
    final titleStyle = theme.textTheme.bodyMedium?.copyWith(
      color: theme.colorScheme.primary,
      fontWeight: FontWeight.bold,
      height: 1.2,
    );
    final timeStyle = theme.textTheme.bodySmall?.copyWith(
      color: secondaryTextColor,
      fontWeight: FontWeight.w600,
    );
    final descriptionStyle = theme.textTheme.bodySmall?.copyWith(
      color: secondaryTextColor,
      height: 1.4,
    );

    return AppCard(
      padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 12.h),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _LikeBubble(isLiked: update.isLiked, onTap: onLikeTap),
          SizedBox(width: 12.w),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Expanded(
                      flex: 3,
                      child: FittedBox(
                        fit: BoxFit.scaleDown,
                        child: Text(
                          update.title,
                          style: titleStyle,
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                    ),
                    SizedBox(width: 12.w),
                    Expanded(
                      child: FittedBox(
                        fit: BoxFit.scaleDown,
                        child: Text(update.timeLabel, style: timeStyle),
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 6.h),
                Text(
                  update.description,
                  style: descriptionStyle,
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class _LikeBubble extends StatelessWidget {
  const _LikeBubble({required this.isLiked, this.onTap});

  final bool isLiked;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final isDark = theme.brightness == Brightness.dark;
    final backgroundColor = isDark
        ? ColorsManager.bgSectionDark
        : ColorsManager.bgSectionLight;
    return SvgPicture.asset(
      isDark ? ImagesManager.lastUpdatesIcon : ImagesManager.lastUpdatesIcon,
      width: 44.w,
      height: 44.w,
      fit: BoxFit.contain,
    );
  }
}
