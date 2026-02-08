import 'package:crowdfunding_platform/controller/core/constants/colors_manager.dart';
import 'package:crowdfunding_platform/controller/core/constants/images_manager.dart';
import 'package:crowdfunding_platform/controller/getx/controllers/donar_home/donar_home_controller.dart';
import 'package:crowdfunding_platform/view/widgets/donar_home_screen_widget/donation_list_item.dart';
import 'package:crowdfunding_platform/view/widgets/donar_home_screen_widget/header.dart';
import 'package:crowdfunding_platform/view/widgets/donar_home_screen_widget/preview_info_section.dart';
import 'package:crowdfunding_platform/view/widgets/donar_home_screen_widget/section_header.dart';
import 'package:crowdfunding_platform/view/widgets/donar_home_screen_widget/suggested_campaign_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

class DonarHomeScreen extends GetView<DonarHomeController> {
  const DonarHomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: CustomScrollView(
          slivers: [
            SliverPadding(
              padding: const EdgeInsets.symmetric(horizontal: 24.0),
              sliver: SliverToBoxAdapter(
                child: Column(
                  children: [
                    Header(
                      title: 'مرحباً فوزي 👋',
                      subTitle:
                          'Here_you_can_track_your_impact_and_support_new_campaigns_with_stars'
                              .tr,
                      profileUrl: ImagesManager.profileHolder,
                    ),
                    SizedBox(height: 16.h),
                    PreviewInfoSection(
                      numberOfStars: 500,
                      lifeAffected: 80,
                      sponsoredCampaigns: 4,
                    ),
                    SizedBox(height: 16.h),

                    SectionHeader(
                      title: 'Latest_donations'.tr,
                      actionText: 'View_all'.tr,
                      onActionTap: () {},
                    ),
                    SizedBox(height: 12.h),
                    DonationListItem(
                      title: 'Campaign_title_sample'.tr,
                      stars: 50,
                      timeAgo: 'منذ يومين',
                      imagePath: ImagesManager.placeHolder,
                      onTap: () {},
                    ),
                    SizedBox(height: 8.h),
                    DonationListItem(
                      title: "حقيبة مدرسية تصنع مستقبلاً 🎒",
                      stars: 250,
                      timeAgo: 'منذ أسبوع',
                      imagePath: ImagesManager.placeHolder,
                      onTap: () {},
                    ),
                    SizedBox(height: 16.h),
                    SizedBox(
                      width: double.infinity,
                      child: ElevatedButton.icon(
                        onPressed: () {},
                        style: ElevatedButton.styleFrom(
                          padding: EdgeInsets.symmetric(vertical: 14.h),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(16.r),
                          ),
                        ),
                        icon: SvgPicture.asset(
                          ImagesManager.discover,
                          width: 24.w,
                          height: 24.h,
                          colorFilter: const ColorFilter.mode(
                            Colors.white,
                            BlendMode.srcIn,
                          ),
                        ).paddingOnly(left: 10.w),
                        label: Text('Explore_new_campaigns'.tr),
                      ),
                    ),
                    SizedBox(height: 16.h),
                    SectionHeader(
                      title: 'Suggested_campaigns_for_you'.tr,
                      actionText: 'View_all'.tr,
                      onActionTap: () {},
                    ),
                    SizedBox(height: 16.h),
                    SizedBox(
                      height: 260.h,
                      child: ListView.separated(
                        scrollDirection: Axis.horizontal,
                        itemCount: 2,
                        separatorBuilder: (_, __) => SizedBox(width: 12.w),
                        itemBuilder: (context, index) {
                          return SizedBox(
                            width: 216.w,
                            height: 255.h,
                            child: SuggestedCampaignCard(
                              title: 'Campaign_title_sample'.tr,
                              description:
                                  'تبرّع بالنجوم لدعم الحملات الإنسانية ومتابعة أثر تبرعك بكل شفافية',
                              imagePath: ImagesManager.test,
                              stars: 50,
                              onDonate: () {},
                              onViewDetails: () {},
                            ),
                          );
                        },
                      ),
                    ),
                    SizedBox(height: 16.h),
                    Container(
                      padding: EdgeInsets.symmetric(
                        horizontal: 16.w,
                        vertical: 12.h,
                      ),
                      decoration: BoxDecoration(
                        color: ColorsManager.lightBg,
                        borderRadius: BorderRadius.circular(16.r),
                        border: Border.all(
                          color: ColorsManager.dividerColorLight,
                        ),
                      ),
                      child: Row(
                        children: [
                          Container(
                            width: 32.w,
                            height: 32.w,
                            decoration: const BoxDecoration(
                              shape: BoxShape.circle,
                              color: ColorsManager.bgSectionLight,
                            ),
                            child: SvgPicture.asset(
                              ImagesManager.rushStarIcon,
                              width: 24.w,
                              height: 24.h,
                              fit: BoxFit.fill,
                            ),
                          ),
                          SizedBox(width: 10.w),
                          Expanded(
                            child: Text(
                              'Every_star_contributes_to_making_a_real_difference'
                                  .tr,
                              style: Theme.of(context).textTheme.bodySmall
                                  ?.copyWith(
                                    color: ColorsManager.secondaryLight,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 12.sp,
                                  ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
