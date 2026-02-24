import 'package:crowdfunding_platform/controller/core/constants/colors_manager.dart';
import 'package:crowdfunding_platform/controller/core/constants/images_manager.dart';
import 'package:crowdfunding_platform/controller/core/utils/campaign_share_helper.dart';
import 'package:crowdfunding_platform/controller/getx/controllers/discover_controller.dart';
import 'package:crowdfunding_platform/model/campagin_models/campagin_model.dart';
import 'package:crowdfunding_platform/view/widgets/campaign_details_widget/top_campaign_card.dart';
import 'package:crowdfunding_platform/view/widgets/icon_with_background.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

class HeaderWidget extends StatelessWidget {
  const HeaderWidget({super.key , required this.campaign});
  final CampaignModel campaign ;
  @override
  Widget build(BuildContext context) {
    final imageUrl = campaign.assets.isNotEmpty &&
            campaign.assets.first.url.isNotEmpty
        ? campaign.assets.first.url
        : null;

    return SizedBox(
      height: 453.h,
      width: double.infinity,
      child: Stack(
        clipBehavior: Clip.none,
        children: [
          // Background image
          (imageUrl != null && imageUrl.isNotEmpty)
              ? Image.network(
                  imageUrl,
                  fit: BoxFit.cover,
                  width: double.infinity,
                  height: 334.h,
                  errorBuilder: (_, __, ___) => _buildCategoryPlaceholder(context),
                )
              : _buildCategoryPlaceholder(context),

          // Gradient overlay
          Positioned(
            left: 0,
            right: 0,
            top: 0,
            child: Container(
              height: 334.h,
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.bottomCenter,
                  end: Alignment.topCenter,
                  colors: [
                    Colors.black.withOpacity(0.85),
                    Colors.black.withOpacity(0.4),
                    Colors.transparent,
                  ],
                ),
              ),
            ),
          ),

          // Leading + actions row (like SliverAppBar)
          Positioned(
            top: MediaQuery.of(context).padding.top + 10.h,
            left: 0,
            right: 0,
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 20.w),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Padding(
                    padding: EdgeInsets.only(right: 16.w),
                    child: IconWithBackground(
                      icon: ImagesManager.arrowCircleRight,
                      onTap: () => Navigator.pop(context),

                      // onTap:()=> Get.back,
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(right: 16.w),
                    child: IconWithBackground(
                      icon: ImagesManager.share,
                      onTap: () => CampaignShareHelper.shareCampaign(campaign),
                    ),
                  ),
                ],
              ),
            ),
          ),

          // Chips + title
          Positioned(
            right: 30.w,
            top: 200.h,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Container(
                      height: 24.h,
                      padding: EdgeInsets.symmetric(
                        horizontal: 8.w,
                      //  vertical: 4.h,
                      ),
                      decoration: BoxDecoration(
                        color: ColorsManager.primaryCTA,
                        borderRadius: BorderRadius.circular(14.r),
                      ),
                      child: Text(
                        campaignCategoryFromString(campaign.category.name).labelAr,
                        style: TextStyle(
                          fontSize: 12.sp,
                          fontWeight: FontWeight.w600,
                          color: ColorsManager.white,
                        ),
                      ),
                    ),
                    SizedBox(width: 10.w),
                    Container(
                                            height: 24.h,

                      padding: EdgeInsets.symmetric(
                        horizontal: 8.w,
                       // vertical: 4.h,
                      ),
                      decoration: BoxDecoration(
                        color: ColorsManager.iconDefaultLight,
                        borderRadius: BorderRadius.circular(14.r),
                      ),
                      child: Row(
                        children: [
                          SvgPicture.asset(
                            ImagesManager.location,
                            color: ColorsManager.white,
                          ),
                          SizedBox(width: 3.w),
                          Text(
                            campaign.creator.country,
                            style: TextStyle(
                              fontSize: 12.sp,
                              fontWeight: FontWeight.w600,
                              color: ColorsManager.white,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 10.h),
                Text(
                  campaign.title.isNotEmpty
                      ? campaign.title
                      : "تفاصيل الحملة",
                  style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                    color: Theme.of(context).colorScheme.onPrimary,
                  ),
                ),
              ],
            ),
          ),

          // Top campaign card
          Positioned(
            left: 16.w,
            right: 16.w,
            bottom: -15.h,
            child: TopCampaignCard( 
              campaignGoal: campaign.goal.toString(),
              rasidStars: campaign.raisedStars.toString(),
              donorsNoWeekly: '10',
              progress : campaign.progress, 
              motivation: campaign.motivationMessage,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildCategoryPlaceholder(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;
    return Container(
      width: double.infinity,
      height: 334.h,
      color: isDark ? ColorsManager.bgSectionDark : ColorsManager.lightBg,
      alignment: Alignment.center,
      child: Container(
        width: 88.w,
        height: 88.w,
        padding: EdgeInsets.all(18.w),
        decoration: BoxDecoration(
          color: isDark ? ColorsManager.bgGoogle : ColorsManager.white,
          shape: BoxShape.circle,
        ),
        child: SvgPicture.asset(
          _categoryIconPath(campaign.category.name),
          colorFilter: ColorFilter.mode(
            isDark ? ColorsManager.white : ColorsManager.primaryLight,
            BlendMode.srcIn,
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
}
