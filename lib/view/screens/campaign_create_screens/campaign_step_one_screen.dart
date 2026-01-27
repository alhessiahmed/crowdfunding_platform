import 'package:crowdfunding_platform/controller/core/constants/colors_manager.dart';
import 'package:crowdfunding_platform/controller/core/constants/images_manager.dart';
import 'package:crowdfunding_platform/controller/getx/controllers/auth/creator_onboarding_controller.dart';
import 'package:crowdfunding_platform/controller/getx/controllers/campaign_create/campaign_step_one_controller.dart';
import 'package:crowdfunding_platform/model/campaign_type_item.dart';
import 'package:crowdfunding_platform/view/widgets/campaign_info_widgets/Info_row_widget.dart';
import 'package:crowdfunding_platform/view/widgets/campaign_info_widgets/custom_step_appBar_widget.dart';
import 'package:crowdfunding_platform/view/widgets/loading_widget.dart';
import 'package:crowdfunding_platform/view/widgets/secondary_button.dart';
import 'package:crowdfunding_platform/view/widgets/text_field_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

class CampaignStepOneScreen extends GetView<CampaignStepOneController> {
  CampaignStepOneScreen({super.key});

  static final items = [
    CampaignTypeItem(
      type: CampaignType.water,
      labelKey: 'water',
      imgPath: ImagesManager.waterIcon,
    ),
    CampaignTypeItem(
      type: CampaignType.foodRelief,
      labelKey: 'food_relief',
      imgPath: ImagesManager.foodIcon,
    ),
    CampaignTypeItem(
      type: CampaignType.education,
      labelKey: 'education',
      imgPath: ImagesManager.educationIcon,
    ),
    CampaignTypeItem(
      type: CampaignType.health,
      labelKey: 'health',
      imgPath: ImagesManager.healthIcon,
    ),
    CampaignTypeItem(
      type: CampaignType.shelter,
      labelKey: 'shelter',
      imgPath: ImagesManager.shelterIcon,
    ),
    CampaignTypeItem(
      type: CampaignType.animals,
      labelKey: 'animals',
      imgPath: ImagesManager.animalsIcon,
    ),
    CampaignTypeItem(
      type: CampaignType.environment,
      labelKey: 'environment',
      imgPath: ImagesManager.environmentIcon,
    ),
  ];
  final CreatorOnboardingController controller2 =
      Get.find<CreatorOnboardingController>();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: PreferredSize(
          preferredSize: Size.fromHeight(80.h),
          child: Obx(
            () => CustomStepAppBar(
              currentStep: (controller.currentStep.value) == 1 ? 1 : 1,
              totalSteps: 4,
              logoPath: ImagesManager.logo,
              progressWidth: 58,
            ),
          ),
        ),
        body: Stack(
          children: [
            Form(
              key: controller.formKey,
              child: ListView(
                padding: EdgeInsets.symmetric(horizontal: 24.w),
                children: [
                  Text(
                    'campaign_info'.tr,
                    style: Theme.of(context).textTheme.bodyLarge,
                  ),
                  SizedBox(height: 16.h),

                  Text(
                    'campaign_define'.tr,

                    style: Theme.of(context).textTheme.bodySmall!.copyWith(
                      color: Theme.of(context).colorScheme.onSurfaceVariant,
                    ),
                  ),
                  SizedBox(height: 16.h),

                  /// Campaign Name
                  TextFieldWidget(
                    label: 'campaign_title'.tr,
                    hintText: 'campaign_title_hint'.tr,
                    controller: controller.campaignNameController,
                  ),
                  SizedBox(height: 16.h),

                  /// Description
                  Container(
                    child: TextFieldWidget(
                      label: 'description'.tr,
                      hintText: 'description_hint'.tr,
                      controller: controller.descriptionController,
                    ),
                  ),
                  SizedBox(height: 16.h),

                  /// Campaign Type Selection
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'campaign_type'.tr,
                        style: Theme.of(
                          context,
                        ).textTheme.bodyLarge!.copyWith(fontSize: 12.sp),
                      ),
                      SizedBox(height: 24.h),
                      Obx(
                        () => Wrap(
                          spacing: 16.w,
                          runSpacing: 16.h,
                          children: items.map((item) {
                            final selected = controller2.isCampaignSelected(
                              item.type,
                            );

                            return ChoiceChip(
                              padding: EdgeInsets.symmetric(
                                horizontal: 15.w,
                                vertical: 8.h,
                              ),
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
                              onSelected: (_) =>
                                  controller2.toggleCampaignType(item.type),
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
                      SizedBox(height: 16.h),

                      /// Campaign Goal (Stars)
                      TextFieldWidget(
                        label: 'campaign_aim'.tr,
                        hintText: 'campaign_aim_hint'.tr,
                        controller: controller.campaignGoalController,
                        keyboardType: TextInputType.number,
                      ),
                    ],
                  ),
                  InfoRowWidget(
                    text:
                        'The number of stars is used to measure progress,\n not as a monetary amount'
                            .tr,
                  ),

                  SizedBox(height: 24.h),

                  /// Next Button
                  ElevatedButton(
                    onPressed: controller.goToNextStep,
                    child: Text('next'.tr),
                  ),

                  SizedBox(height: 12.h),

                  /// Back / Cancel
                  SecondaryButton(label: 'cancel'.tr, onPressed: Get.back),

                  SizedBox(height: 40.h),
                ],
              ),
            ),

            /// Loading Overlay
            Obx(
              () => Visibility(
                visible: controller.isLoading.value,
                child: const LoadingWidget(),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
