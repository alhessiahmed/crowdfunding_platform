import 'package:crowdfunding_platform/controller/core/constants/colors_manager.dart';
import 'package:crowdfunding_platform/controller/core/constants/images_manager.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get_utils/src/extensions/internacionalization.dart';

class DonarCard extends StatelessWidget {
  const DonarCard({super.key, required this.numberOfStars});
  final int numberOfStars;
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 171.h,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12.0),
        image: DecorationImage(
          image: AssetImage(ImagesManager.donarBackground),
          fit: BoxFit.cover,
        ),
      ),
      child: Stack(
        children: [
          Positioned(
            right: 11.w,
            top: 16.h,

            child: Container(
              padding: EdgeInsets.symmetric(horizontal: 8.w, vertical: 4.h),
              decoration: BoxDecoration(
                color: ColorsManager.dividerColorLight,
                borderRadius: BorderRadius.circular(100),
              ),
              child: Row(
                children: [
                  SvgPicture.asset(
                    ImagesManager.yourEffectIcon,
                    fit: BoxFit.contain,
                    width: 16.w,
                    height: 16.h,
                  ),
                  SizedBox(width: 8.w),
                  Text(
                    'Your_current_impact'.tr,
                    style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                      color: Theme.of(context).primaryColor,
                    ),
                  ),
                ],
              ),
            ),
          ),
          Align(
            alignment: Alignment.center,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Container(
                  width: 47.w,
                  height: 47.h,
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withValues(alpha: 0.25),
                        blurRadius: 24,
                        offset: const Offset(0, 1),
                      ),
                      BoxShadow(
                        color: Colors.black.withValues(alpha: 0.12),
                        blurRadius: 8,
                        offset: const Offset(0, 3),
                      ),
                    ],
                  ),
                  child: SvgPicture.asset(
                    ImagesManager.whiteStarIcon,
                    width: 48.w,
                    height: 48.h,
                    fit: BoxFit.contain,
                  ),
                ),
                SizedBox(height: 4.h),
                Text(
                  numberOfStars.toString(),
                  style: Theme.of(context).textTheme.headlineLarge?.copyWith(
                    color: ColorsManager.white,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                // SizedBox(height: 8.h),
                Container(
                  padding: EdgeInsets.symmetric(
                    horizontal: 12.w,
                    vertical: 6.h,
                  ),
                  decoration: BoxDecoration(
                    color: ColorsManager.dividerColorLight,
                    borderRadius: BorderRadius.circular(100),
                  ),
                  child: Text(
                    'You_are_in_the_top_%_of_star_donors!'.trParams({
                      'peploepresnt': '5',
                    }),
                    textAlign: TextAlign.center,
                    style: Theme.of(context).textTheme.bodySmall?.copyWith(
                      color: ColorsManager.iconDefaultLight,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
