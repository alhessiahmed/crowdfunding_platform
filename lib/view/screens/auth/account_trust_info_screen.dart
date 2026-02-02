import 'package:crowdfunding_platform/controller/core/constants/images_manager.dart';
import 'package:crowdfunding_platform/view/widgets/text_field_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

import '../../../controller/core/constants/colors_manager.dart';
import '../../../controller/getx/controllers/auth/creator_onboarding_controller.dart';

class AccountTrustInfoScreen extends GetView<CreatorOnboardingController> {
  const AccountTrustInfoScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(height: 10.h),
          Text(
            'basic_trust_info'.tr,
            style: Theme.of(context).textTheme.bodyLarge,
            textAlign: TextAlign.start,
          ),
          SizedBox(height: 16.h),
          Text(
            'trust_info_extra'.tr,
            style: Theme.of(
              context,
            ).textTheme.bodyMedium!.copyWith(fontSize: 12.sp),
          ),
          SizedBox(height: 24.h),
          TextFieldWidget(
            controller: controller.nameController,
            hintText: 'name_or_company'.tr,
            label: 'visible_name'.tr,
          ),
          SizedBox(height: 16.h),
          TextFieldWidget(
            controller: controller.countryController,
            hintText: 'city_country'.tr,
            label: 'city_country_example'.tr,
            suffixIcon: SvgPicture.asset(
              ImagesManager.locationIcon,
              colorFilter: ColorFilter.mode(
                Get.isDarkMode
                    ? ColorsManager.iconDefaultDark
                    : ColorsManager.iconDefaultLight,
                BlendMode.srcIn,
              ),
            ),
          ),
          SizedBox(height: 16.h),
          TextFieldWidget(
            controller: controller.companyNameController,
            hintText: 'company_name_example'.tr,
            label: 'company_name'.tr,
          ),
          SizedBox(height: 16.h),
          TextFieldWidget(
            controller: controller.websiteController,
            hintText: 'company_url_example'.tr,
            label: 'company_url'.tr,
            suffixIcon: SvgPicture.asset(
              ImagesManager.linkIcon,
              colorFilter: ColorFilter.mode(
                Get.isDarkMode
                    ? ColorsManager.iconDefaultDark
                    : ColorsManager.iconDefaultLight,
                BlendMode.srcIn,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
