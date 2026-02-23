import 'package:crowdfunding_platform/controller/core/constants/colors_manager.dart';
import 'package:crowdfunding_platform/controller/core/constants/images_manager.dart';
import 'package:crowdfunding_platform/controller/getx/controllers/discover_controller.dart';
import 'package:crowdfunding_platform/model/campagin_models/campagin_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

class StorySection extends StatelessWidget {
  const StorySection({
    super.key,
    required this.description,
    required this.category,
    this.imageUrl,
  });

  final String description;
  final String category;
  final String? imageUrl;

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;

    return Container(
      padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 10.h),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20.r),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            description,
            textAlign: TextAlign.right,
            style: TextStyle(
              fontSize: 12.sp,
              color: isDark
                  ? ColorsManager.secondaryDark
                  : ColorsManager.secondaryLight,
            ),
          ),
          SizedBox(height: 12.h),
          // Container(
          //   height: 160.h,

          //   decoration: BoxDecoration(
          //     borderRadius: BorderRadius.circular(32.r),
          //     boxShadow: [
          //       BoxShadow(
          //         color: Colors.black38,
          //         offset: Offset(0, 0),
          //         blurRadius: 8,
          //       ),
          //     ],
          //   ),
          //   child: ClipRRect(
          //     borderRadius: BorderRadius.circular(32.r),
          //     child: (imageUrl != null && imageUrl!.isNotEmpty)
          //         ? Image.network(
          //             imageUrl!,
          //             width: double.infinity,
          //             fit: BoxFit.cover,
          //             errorBuilder: (_, __, ___) => _buildCategoryPlaceholder(
          //               isDark,
          //             ),
          //           )
          //         : _buildCategoryPlaceholder(isDark),
          //   ),
          // ),
        ],
      ),
    );
  }

  Widget _buildCategoryPlaceholder(bool isDark) {
    return Container(
      color: isDark ? ColorsManager.bgSectionDark : ColorsManager.lightBg,
      alignment: Alignment.center,
      child: Container(
        width: 72.w,
        height: 72.w,
        padding: EdgeInsets.all(14.w),
        decoration: BoxDecoration(
          color: isDark ? ColorsManager.bgGoogle : ColorsManager.white,
          shape: BoxShape.circle,
        ),
        child: SvgPicture.asset(
          _categoryIconPath(category),
          colorFilter: ColorFilter.mode(
            isDark ? ColorsManager.white : ColorsManager.primaryLight,
            BlendMode.srcIn,
          ),
        ),
      ),
    );
  }

  String _categoryIconPath(String value) {
    switch (campaignCategoryFromString(value)) {
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
