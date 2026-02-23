import 'package:crowdfunding_platform/controller/core/constants/colors_manager.dart';
import 'package:crowdfunding_platform/controller/core/constants/images_manager.dart';
import 'package:crowdfunding_platform/controller/core/routes/routes_manager.dart';
import 'package:crowdfunding_platform/controller/core/utils/campaign_share_helper.dart';
import 'package:crowdfunding_platform/controller/getx/controllers/discover_controller.dart';
import 'package:crowdfunding_platform/model/campagin_models/campagin_model.dart';
import 'package:crowdfunding_platform/view/widgets/campaign_details_widget/popup_to_donate.dart';
import 'package:crowdfunding_platform/view/widgets/campaign_details_widget/stats_row.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:skeletonizer/skeletonizer.dart';

class CampaignCard extends GetView<DiscoverController> {
  final CampaignModel campaign;

  const CampaignCard({super.key, required this.campaign});

  @override
  Widget build(BuildContext context) {
    final isDark = Get.isDarkMode;

    final imageUrl = campaign.assets.isNotEmpty
        ? campaign.assets.first.url
        : null;

    // final progress = campaign.goal > 0
    //     ? (campaign.likesCount / campaign.goal).clamp(0.0, 1.0)
    //     : 0.0;

    return Padding(
      padding: EdgeInsets.symmetric(vertical: 8.h),
      child: Container(
        padding: EdgeInsets.all(16.h),
        decoration: BoxDecoration(
          color: isDark ? ColorsManager.bgGoogle : ColorsManager.white,
          borderRadius: BorderRadius.circular(20.r),
          boxShadow: const [BoxShadow(blurRadius: 8, color: Colors.black12)],
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
                    child: (imageUrl != null && imageUrl.isNotEmpty)
                        ? Image.network(
                            imageUrl,
                            fit: BoxFit.cover,
                            errorBuilder: (context, error, stackTrace) {
                              return buildCategoryPlaceholder(isDark, campaign);
                            },
                          )
                        : buildCategoryPlaceholder(isDark, campaign),
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
                      child: Row(
                        children: [
                          Icon(Icons.access_time, size: 18.w),
                          SizedBox(width: 5.w),
                          Text(
                            style: Theme.of(context).textTheme.bodySmall
                                ?.copyWith(
                                  //fontWeight: FontWeight.w600,
                                  color: isDark
                                      ? ColorsManager.white
                                      : ColorsManager.primaryLight,
                                ),
                            'متبقي ${calculateRemainingDays(campaign.endDate.toString())} ايام',
                          ),
                        ],
                      ),
                      // Text(
                      //   campaignCategoryFromString(campaign.category.name).labelAr,

                      //   style: Theme.of(context).textTheme.bodySmall?.copyWith(
                      //     fontWeight: FontWeight.w600,
                      //     color: isDark
                      //         ? ColorsManager.white
                      //         : ColorsManager.primaryLight,
                      //   ),
                      // ),
                    ),
                  ),
                ],
              ),
            ),

            SizedBox(height: 8.h),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
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
                    campaignCategoryFromString(campaign.category.name).labelAr,

                    style: Theme.of(context).textTheme.bodySmall?.copyWith(
                      fontWeight: FontWeight.w600,
                      color: isDark
                          ? ColorsManager.white
                          : ColorsManager.primaryCTA,
                    ),
                  ),
                ),

                Row(
                  spacing: 10.w,
                  children: [
                    Obx(() {
                      final isFav = controller.favoriteIds.contains(
                        campaign.id,
                      );
                      return GestureDetector(
                        onTap: () => controller.toggleFavorite(campaign.id),
                        child: Container(
                          height: 28.h,
                          width: 28.w,
                          decoration: BoxDecoration(
                            color: Color(0xFFEFF6FF),
                            shape: BoxShape.circle,
                          ),
                          child: Icon(
                            weight: 16.w,

                            isFav
                                ? Icons.favorite
                                : Icons.favorite_outline_outlined,
                            color: ColorsManager.primaryCTA,
                          ),
                          //  IconButton(onPressed: (){
                          //       controller.toggleFavorite(campaign.id);
                          //                  }, icon: Icon(
                          //       isFav ?
                          //       Icons.favorite
                          //       : Icons.favorite_outline_outlined,
                          //       color:  ColorsManager.danger  ,
                          //       )),
                        ),
                      );
                    }),

                    GestureDetector(
                      onTap: () => CampaignShareHelper.shareCampaign(campaign),
                      child: Container(
                        height: 28.h,
                        width: 28.w,
                        decoration: BoxDecoration(
                          color: Color(0xFFEFF6FF),
                          shape: BoxShape.circle,
                        ),
                        child: Icon(
                          weight: 16.w,

                          Icons.share,
                          color: ColorsManager.primaryLight,
                        ),
                        // SvgPicture.asset(
                        //   ImagesManager.share,
                        //   colorFilter: const ColorFilter.mode(
                        //     ColorsManager.blueButton,
                        //     BlendMode.srcIn,
                        //   ),
                        // ),
                      ),
                    ),
                  ],
                ),
              ],
            ),

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
                      child: SvgPicture.asset(ImagesManager.star, width: 14.sp),
                    ),
                    SizedBox(width: 4.w),
                    Text(
                      '${campaign.raisedStars} نجمة',
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
                  value: campaign.progress,
                  minHeight: 8.h,
                  backgroundColor: isDark
                      ? ColorsManager.dividerColorDark
                      : ColorsManager.dividerColorLight,
                  valueColor: AlwaysStoppedAnimation(ColorsManager.primaryCTA),
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
                      backgroundColor: isDark
                          ? ColorsManager.bgGoogle
                          : ColorsManager.white,
                      foregroundColor: isDark
                          ? ColorsManager.white
                          : ColorsManager.primaryLight,
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
                      Get.toNamed(
                        RoutesManager.campaignDetailsScreen,
                        arguments: {
                          'campaign': campaign,
                          'campaignId': campaign.id,
                        },
                      );
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
                      PopupToDonate(campaignId: campaign.id,).openBottomSheet(context);
                    },
                    child: const Text("أضئ نجمة الان"),
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

Widget buildCategoryPlaceholder(bool isDark, CampaignModel campaign) {
  return Container(
    color: isDark ? ColorsManager.bgSectionDark : ColorsManager.bgSectionLight,
    alignment: Alignment.center,
    child: Container(
      width: 72.w,
      height: 72.w,
      padding: EdgeInsets.all(14.w),
      decoration: BoxDecoration(
        color: isDark ? ColorsManager.bgGoogle : ColorsManager.white,
        shape: BoxShape.circle,
      ),
      child: Skeleton.ignore(
        child: SvgPicture.asset(
          _categoryIconPath(campaign.category.name),
          colorFilter: ColorFilter.mode(
            isDark ? ColorsManager.white : ColorsManager.primaryLight,
            BlendMode.srcIn,
          ),
        ),
      ),
    ),
  );
}

String _categoryIconPath(String category) {
  switch (campaignCategoryFromString(category)) {
    case CampaignCategory.WATER:
      return ImagesManager.waterIcon;
    case CampaignCategory.HEALTH:
      return ImagesManager.healthIcon;
    case CampaignCategory.ENVIROMENT:
      return ImagesManager.environmentIcon;
    case CampaignCategory.FOOD:
      return ImagesManager.foodIcon;
    case CampaignCategory.EDUCATION:
      return ImagesManager.educationIcon;
    case CampaignCategory.SHELTER:
      return ImagesManager.shelterIcon;
    case CampaignCategory.ANIMALS:
      return ImagesManager.animalsIcon;
    case CampaignCategory.ALL:
      return ImagesManager.discover;
  }
}
