import 'package:crowdfunding_platform/controller/getx/controllers/auth/creator_onboarding_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../../controller/core/constants/images_manager.dart';
import '../../widgets/selection_card.dart';

class ExperienceLevelScreen extends GetView<CreatorOnboardingController> {
  const ExperienceLevelScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(height: 63.5.h),
          Text(
            'what_experience_level'.tr,
            style: Theme.of(context).textTheme.bodyLarge,
            textAlign: TextAlign.start,
          ),
          SizedBox(height: 16.h),
          Text(
            'experience_screen_info'.tr,
            style: Theme.of(
              context,
            ).textTheme.bodyMedium!.copyWith(fontSize: 12.sp),
          ),
          SizedBox(height: 24.h),
          SelectionCard(
            iconPath: Get.isDarkMode
                ? ImagesManager.individualIconDark
                : ImagesManager.individualIcon,
            title: 'first_time'.tr,
            subtitle: 'first_time_info'.tr,
            isSelected:
                controller.experienceLevel.value == ExperienceLevel.firstTime,
            onTap: () => controller.selectExperience(ExperienceLevel.firstTime),
          ),
          SizedBox(height: 12.h),
          SelectionCard(
            iconPath: Get.isDarkMode
                ? ImagesManager.organizationIconDark
                : ImagesManager.organizationIcon,
            title: 'someExperience'.tr,
            subtitle: 'someExperience_info'.tr,
            isSelected:
                controller.experienceLevel.value ==
                ExperienceLevel.someExperience,
            onTap: () =>
                controller.selectExperience(ExperienceLevel.someExperience),
          ),
          SizedBox(height: 12.h),
          SelectionCard(
            iconPath: Get.isDarkMode
                ? ImagesManager.teamIconDark
                : ImagesManager.teamIcon,
            title: 'expert'.tr,
            subtitle: 'expert_info'.tr,
            isSelected:
                controller.experienceLevel.value == ExperienceLevel.expert,
            onTap: () => controller.selectExperience(ExperienceLevel.expert),
          ),
        ],
      ),
    );
  }
}
