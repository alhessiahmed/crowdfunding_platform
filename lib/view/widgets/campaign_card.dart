import 'package:crowdfunding_platform/controller/core/constants/colors_manager.dart';
import 'package:crowdfunding_platform/controller/core/constants/images_manager.dart';
import 'package:crowdfunding_platform/controller/core/routes/routes_manager.dart';
import 'package:crowdfunding_platform/model/campagin_models/campagin_model.dart';
import 'package:crowdfunding_platform/view/widgets/campaign_details_widget/popup_to_donate.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:skeletonizer/skeletonizer.dart';

class CampaignCard extends StatelessWidget {
  final CampaignModel campaign;

  const CampaignCard({
    super.key,
    required this.campaign,
  });

  @override
  Widget build(BuildContext context) {
    final isDark = Get.isDarkMode;

    final imageUrl = campaign.assets.isNotEmpty
        ? campaign.assets.first.url
        : null;

    final progress = campaign.goal > 0
        ? (campaign.likes / campaign.goal).clamp(0.0, 1.0)
        : 0.0;

    return Padding(
      padding: EdgeInsets.symmetric(vertical: 8.h),
      child: Container(
        padding: EdgeInsets.all(16.h),
        decoration: BoxDecoration(
          color: isDark ? ColorsManager.bgGoogle : ColorsManager.white,
          borderRadius: BorderRadius.circular(20.r),
          boxShadow: const [
            BoxShadow(
              blurRadius: 8,
              color: Colors.black12,
            ),
          ],
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            /// IMAGE + CATEGORY
            SizedBox(
              height: 180.h,
              child: Stack(
                fit: StackFit.expand,
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.circular(16.r),
                    child: Image.network(
  imageUrl ?? 'https://ik.imagekit.io/uicgrfh5t/products/447823069554839_THGxo3Rcr.jpg',
  fit: BoxFit.cover,
  // loadingBuilder: (context, child, loadingProgress) {
  //   if (loadingProgress == null) return child;
  //   return Container(
  //     color: Colors.grey.shade300,
  //     alignment: Alignment.center,
  //     child: const CircularProgressIndicator(strokeWidth: 2),
  //   );
  // },
  errorBuilder: (context, error, stackTrace) {
    return Image.asset(
      ImagesManager.placeHolder2,
      fit: BoxFit.cover,
    );
  },
)

                  ),
                  Positioned(
                    top: 16.h,
                    right: 16.w,
                    child: Container(
                      padding: EdgeInsets.symmetric(
                        horizontal: 10.w,
                        vertical: 4.h,
                      ),
                      decoration: BoxDecoration(
                        color: isDark
                            ? ColorsManager.bgGoogle
                            : ColorsManager.dividerColorLight,
                        borderRadius: BorderRadius.circular(12.r),
                      ),
                      child: Text(
                        campaign.category,
                        style: Theme.of(context).textTheme.bodySmall?.copyWith(
                              fontWeight: FontWeight.w600,
                              color: isDark
                                  ? ColorsManager.white
                                  : ColorsManager.primaryLight,
                            ),
                      ),
                    ),
                  ),
                ],
              ),
            ),

            SizedBox(height: 8.h),

            /// TITLE
            Text(
              campaign.title,
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
              style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                    fontWeight: FontWeight.bold,
                    color: isDark
                        ? ColorsManager.white
                        : ColorsManager.primaryLight,
                  ),
            ),

            SizedBox(height: 6.h),

            /// DESCRIPTION
            Text(
              campaign.description,
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
              style: Theme.of(context).textTheme.bodySmall?.copyWith(
                    color: isDark
                        ? ColorsManager.secondaryDark
                        : ColorsManager.secondaryLight,
                  ),
            ),

            SizedBox(height: 10.h),

            /// STATS
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    Skeleton.ignore(
                      child: SvgPicture.asset(
                        ImagesManager.star,
                        width: 14.sp,
                      ),
                    ),
                    SizedBox(width: 4.w),
                    Text(
                      '${NumberFormat.compact(locale: 'ar').format(campaign.goal)} نجمة',
                      style: TextStyle(
                        color: isDark
                            ? ColorsManager.primaryTextLight
                            : ColorsManager.primaryLight,
                      ),
                    ),
                  ],
                ),
                Text(
                  'الهدف: ${campaign.goal} نجمة',
                  style: Theme.of(context).textTheme.bodySmall?.copyWith(
                        color: isDark
                            ? ColorsManager.primaryTextLight
                            : ColorsManager.primaryLight,
                      ),
                ),
              ],
            ),

            SizedBox(height: 8.h),

            /// PROGRESS BAR
            ClipRRect(
              borderRadius: BorderRadius.circular(12.r),
              child: Skeleton.ignore(
                child: LinearProgressIndicator(
                  value: progress,
                  minHeight: 8.h,
                  backgroundColor: isDark
                      ? ColorsManager.dividerColorDark
                      : ColorsManager.dividerColorLight,
                  valueColor: AlwaysStoppedAnimation(
                    ColorsManager.primaryCTA,
                  ),
                ),
              ),
            ),

            SizedBox(height: 14.h),

            /// ACTIONS
            Row(
              children: [
                Expanded(
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      padding: EdgeInsets.symmetric(vertical: 14.h),
                      backgroundColor:
                          isDark ? ColorsManager.bgGoogle : ColorsManager.white,
                      foregroundColor:
                          isDark ? ColorsManager.white : ColorsManager.primaryLight,
                      side: BorderSide(
                        color: isDark
                            ? ColorsManager.iconDefaultLight
                            : ColorsManager.primaryLight,
                      ),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8.r),
                      ),
                    ),
                    onPressed: () {
                      Get.toNamed(RoutesManager.campaignDetailsScreen);
                    },
                    child: const Text('مشاهدة التفاصيل'),
                  ),
                ),
                SizedBox(width: 8.w),
                Expanded(
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      padding: EdgeInsets.symmetric(vertical: 14.h),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8.r),
                      ),
                    ),
                    onPressed: () {
                      PopupToDonate().openBottomSheet(context);
                    },
                    child: const Text('تبرع فورًا'),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
