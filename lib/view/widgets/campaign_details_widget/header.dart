
import 'package:crowdfunding_platform/controller/core/constants/colors_manager.dart';
import 'package:crowdfunding_platform/controller/core/constants/images_manager.dart';
import 'package:crowdfunding_platform/view/widgets/campaign_details_widget/top_campaign_card.dart';
import 'package:crowdfunding_platform/view/widgets/icon_with_background.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

class HeaderWidget extends StatelessWidget {
  const HeaderWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 453.h,
      width: double.infinity,
      child: Stack(
        clipBehavior: Clip.none,
        children: [
          // Background image
          Image.asset(
            ImagesManager.test,
            fit: BoxFit.cover,
            width: double.infinity,
            height: 334.h,
          ),

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
                    icon:  ImagesManager.arrowCircleRight,
                    onTap: () => Navigator.pop(context),
                    // onTap:()=> Get.back,
                    
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(right: 16.w),
                    child: IconWithBackground(
                     icon: ImagesManager.share,
                      
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
                      padding: EdgeInsets.symmetric(
                        horizontal: 10.w,
                        vertical: 4.h,
                      ),
                      decoration: BoxDecoration(
                        color: ColorsManager.primaryCTA,
                        borderRadius: BorderRadius.circular(14.r),
                      ),
                      child: Text(
                        'الأولوية القصوى',
                        style: TextStyle(
                          fontSize: 11.sp,
                          fontWeight: FontWeight.w600,
                          color: ColorsManager.white,
                        ),
                      ),
                    ),
                    SizedBox(width: 10.w),
                    Container(
                      padding: EdgeInsets.symmetric(
                        horizontal: 10.w,
                        vertical: 4.h,
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
                            'الأولوية القصوى',
                            style: TextStyle(
                              fontSize: 11.sp,
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
                  "قطرة حياة:\n مياه نظيفة لأطفال غزة",
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
            bottom: 20.h,
            child: TopCampaignCard(),
          ),
        ],
      ),
    );
  }

}
