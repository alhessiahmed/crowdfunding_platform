import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

import '../../../controller/core/constants/colors_manager.dart';
import '../../../controller/core/constants/images_manager.dart';
import '../../../controller/getx/controllers/auth/creator_onboarding_controller.dart';
import '../../../model/campaign_type_item.dart';

class CampaignSelectionScreen extends GetView<CreatorOnboardingController> {
  const CampaignSelectionScreen({super.key});

  static final items = [
    CampaignTypeItem(
      type: CampaignType.water,
      labelKey: 'water'.tr,
      imgPath: ImagesManager.waterIcon,
    ),
    CampaignTypeItem(
      type: CampaignType.foodRelief,
      labelKey: 'food_relief'.tr,
      imgPath: ImagesManager.foodIcon,
    ),
    CampaignTypeItem(
      type: CampaignType.education,
      labelKey: 'education'.tr,
      imgPath: ImagesManager.educationIcon,
    ),
    CampaignTypeItem(
      type: CampaignType.health,
      labelKey: 'health'.tr,
      imgPath: ImagesManager.healthIcon,
    ),
    CampaignTypeItem(
      type: CampaignType.shelter,
      labelKey: 'shelter'.tr,
      imgPath: ImagesManager.shelterIcon,
    ),
    CampaignTypeItem(
      type: CampaignType.animals,
      labelKey: 'animals'.tr,
      imgPath: ImagesManager.animalsIcon,
    ),

    CampaignTypeItem(
      type: CampaignType.environment,
      labelKey: 'environment'.tr,
      imgPath: ImagesManager.environmentIcon,
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(height: 120.h),
        Text(
          'what_campaign_types'.tr,
          style: Theme.of(context).textTheme.bodyLarge,
        ),
        SizedBox(height: 16.h),
        Text(
          'select_one_or_more'.tr,
          style: Theme.of(
            context,
          ).textTheme.bodyMedium!.copyWith(fontSize: 12.sp),
        ),
        SizedBox(height: 24.h),
        Obx(
          () => Wrap(
            spacing: 16.w,
            runSpacing: 16.h,

            children: items.map((item) {
              final selected = controller.isCampaignSelected(item.type);

              return ChoiceChip(
                padding: EdgeInsets.symmetric(horizontal: 15.w, vertical: 8.h),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(48.r),
                ),
                selectedColor: ColorsManager.primaryCTA,
                showCheckmark: false,
                backgroundColor: Get.isDarkMode
                    ? ColorsManager.bgGoogle
                    : Colors.white,
                selected: selected,
                side: BorderSide.none,
                elevation: selected ? 0 : 1,
                shadowColor: Colors.white.withOpacity(0.4),
                onSelected: (_) => controller.toggleCampaignType(item.type),
                label: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    SvgPicture.asset(
                      item.imgPath,
                      colorFilter: ColorFilter.mode(
                        selected
                            ? ColorsManager.white
                            : Get.isDarkMode
                            ? ColorsManager.iconDefaultDark
                            : ColorsManager.iconDefaultLight,
                        BlendMode.srcIn,
                      ),
                    ),
                    SizedBox(width: 4.w),
                    Text(
                      item.labelKey.tr,
                      style: TextStyle(
                        fontSize: 16.sp,
                        fontWeight: FontWeight.w700,
                        color: selected
                            ? ColorsManager.white
                            : Get.isDarkMode
                            ? ColorsManager.iconDefaultDark
                            : ColorsManager.iconDefaultLight,
                      ),
                    ),
                  ],
                ),
              );
            }).toList(),
          ),
        ),
      ],
    );
  }
}
