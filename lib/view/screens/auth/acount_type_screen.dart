import 'package:crowdfunding_platform/controller/getx/controllers/auth/creator_onboarding_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../../controller/core/constants/images_manager.dart';
import '../../widgets/selection_card.dart';

class AccountTypeScreen extends GetView<CreatorOnboardingController> {
  const AccountTypeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(height: 63.5.h),
          Text(
            'what_account_type'.tr,
            style: Theme.of(context).textTheme.bodyLarge,
            textAlign: TextAlign.start,
          ),
          SizedBox(height: 16.h),
          Text(
            'choose_ur_best'.tr,
            style: Theme.of(
              context,
            ).textTheme.bodyMedium!.copyWith(fontSize: 12.sp),
          ),
          SizedBox(height: 24.h),
          SelectionCard(
            iconPath: Get.isDarkMode
                ? ImagesManager.individualIconDark
                : ImagesManager.individualIcon,
            title: 'individual'.tr,
            subtitle: 'individual_info'.tr,
            isSelected: controller.accountType.value == AccountType.individual,
            onTap: () => controller.selectAccountType(AccountType.individual),
          ),
          SizedBox(height: 12.h),
          SelectionCard(
            iconPath: Get.isDarkMode
                ? ImagesManager.organizationIconDark
                : ImagesManager.organizationIcon,
            title: 'organization'.tr,
            subtitle: 'organization_info'.tr,
            isSelected:
                controller.accountType.value == AccountType.organization,
            onTap: () => controller.selectAccountType(AccountType.organization),
          ),
          SizedBox(height: 12.h),
          SelectionCard(
            iconPath: Get.isDarkMode
                ? ImagesManager.teamIconDark
                : ImagesManager.teamIcon,
            title: 'team'.tr,
            subtitle: 'team_info'.tr,
            isSelected: controller.accountType.value == AccountType.team,
            onTap: () => controller.selectAccountType(AccountType.team),
          ),
        ],
      ),
    );
  }
}
