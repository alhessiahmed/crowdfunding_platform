import 'package:crowdfunding_platform/controller/core/constants/colors_manager.dart';
import 'package:crowdfunding_platform/controller/core/constants/images_manager.dart';
import 'package:crowdfunding_platform/model/campagin_models/campaign_update_model.dart';
import 'package:crowdfunding_platform/view/widgets/update_campaign_widget/app_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

class CampaignUpdateCard extends StatelessWidget {
  const CampaignUpdateCard({super.key, required this.update});

  final CampaignUpdateModel update;

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;
    final subtitleColor = isDark
        ? ColorsManager.secondaryDark
        : ColorsManager.secondaryLight;
    final imageUrl = update.assets.isNotEmpty ? update.assets.first.url : null;

    return AppCard(
      borderRadius: 24.r,
      padding: EdgeInsets.all(14.w),
      backGroundColor: isDark ? ColorsManager.bgGoogle : ColorsManager.white,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              SvgPicture.asset(
                ImagesManager.lastUpdatesIcon,
                width: 38.w,
                height: 38.w,
                fit: BoxFit.contain,
              ),
              SizedBox(width: 10.w),
              Expanded(
                child: Text(
                  update.title,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                    fontWeight: FontWeight.w700,
                    color: isDark
                        ? ColorsManager.primaryTextDark
                        : ColorsManager.primaryLight,
                  ),
                ),
              ),
              SizedBox(width: 8.w),
              Text(
                _formatAgo(update.createdAt),
                style: Theme.of(context).textTheme.bodySmall?.copyWith(
                  color: subtitleColor,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ],
          ),
          SizedBox(height: 10.h),
          Text(
            update.description,
            maxLines: 3,
            overflow: TextOverflow.ellipsis,
            style: Theme.of(context).textTheme.bodySmall?.copyWith(
              color: subtitleColor,
              height: 1.4,
            ),
          ),
          if (imageUrl != null && imageUrl.isNotEmpty) ...[
            SizedBox(height: 12.h),
            ClipRRect(
              borderRadius: BorderRadius.circular(14.r),
              child: Image.network(
                imageUrl,
                width: double.infinity,
                height: 150.h,
                fit: BoxFit.cover,
                errorBuilder: (_, __, ___) => const SizedBox.shrink(),
              ),
            ),
          ],
        ],
      ),
    );
  }
}

String _formatAgo(DateTime dateTime) {
  final now = DateTime.now();
  final diff = now.difference(dateTime.toLocal());

  if (diff.inMinutes < 1) return 'الآن';
  if (diff.inHours < 1) return 'منذ ${diff.inMinutes} دقيقة';
  if (diff.inDays < 1) return 'منذ ${diff.inHours} ساعة';
  if (diff.inDays < 7) return 'منذ ${diff.inDays} يوم';

  final weeks = (diff.inDays / 7).floor();
  if (weeks < 5) return 'منذ $weeks أسبوع';

  final months = (diff.inDays / 30).floor();
  if (months < 12) return 'منذ $months شهر';

  final years = (diff.inDays / 365).floor();
  return 'منذ $years سنة';
}
