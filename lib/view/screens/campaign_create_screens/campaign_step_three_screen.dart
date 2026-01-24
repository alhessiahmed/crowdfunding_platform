import 'package:crowdfunding_platform/controller/core/constants/colors_manager.dart';
import 'package:crowdfunding_platform/controller/core/constants/images_manager.dart';
import 'package:crowdfunding_platform/controller/getx/controllers/auth/creator_onboarding_controller.dart';
import 'package:crowdfunding_platform/controller/getx/controllers/campaign_create/campaign_step_three_controlller.dart';
import 'package:crowdfunding_platform/model/campaign_type_item.dart';
import 'package:crowdfunding_platform/view/widgets/campaign_info_widgets/Info_row_widget.dart';
import 'package:crowdfunding_platform/view/widgets/campaign_info_widgets/campaign_duration_widget.dart';
import 'package:crowdfunding_platform/view/widgets/campaign_info_widgets/custom_step_appBar_widget.dart';
import 'package:crowdfunding_platform/view/widgets/loading_widget.dart';
import 'package:crowdfunding_platform/view/widgets/secondary_button.dart';
import 'package:crowdfunding_platform/view/widgets/text_field_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CampaignStepThreeScreen extends GetView<CampaignStepThreeController> {
  CampaignStepThreeScreen({super.key});

  final bool isDark = Get.isDarkMode;
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
              currentStep: controller.currentStep.value == 3 ? 3 : 3,
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
                    'aim_details'.tr,
                    style: Theme.of(context).textTheme.bodyLarge,
                  ),
                  SizedBox(height: 16.h),

                  Text(
                    'aim_interval'.tr,
                    style: Theme.of(context).textTheme.bodySmall!.copyWith(
                      color: Theme.of(context).colorScheme.onSurfaceVariant,
                    ),
                  ),
                  SizedBox(height: 16.h),

                  Text(
                    'campaign_interval'.tr,
                    style: Theme.of(
                      context,
                    ).textTheme.bodyLarge!.copyWith(fontSize: 12.sp),
                  ),

                  CampaignDurationSelector(),

                  SizedBox(height: 8.h),

                  Text(
                    'campaign_endDate'.tr,
                    style: Theme.of(
                      context,
                    ).textTheme.bodyLarge!.copyWith(fontSize: 12.sp),
                  ),
                  SizedBox(height: 4.h),

                  Container(
                    padding: EdgeInsets.symmetric(
                      horizontal: 8.w,
                      vertical: 16.h,
                    ),
                    decoration: BoxDecoration(
                      color: isDark
                          ? ColorsManager.bgGoogle
                          : ColorsManager.bgSectionLight,
                      borderRadius: BorderRadius.circular(16.r),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withOpacity(0.1),
                          blurRadius: 1,
                          offset: const Offset(0, 1),
                        ),
                      ],
                    ),
                    child: Row(
                      children: [
                        Expanded(
                          child: Obx(
                            () => Text(
                              controller.endDate.value.isEmpty
                                  ? 'mm / dd / yy'
                                  : controller.endDate.value,
                              style: Theme.of(
                                context,
                              ).textTheme.bodySmall!.copyWith(fontSize: 12.sp),
                            ),
                          ),
                        ),
                        Image.asset(
                          controller.calendarImage,
                          height: 24.h,
                          width: 24.w,
                        ),
                      ],
                    ),
                  ),

                  InfoRowWidget(text: 'extend_duration'.tr),

                  SizedBox(height: 16.h),

                  Text(
                    'continue_process'.tr,
                    style: Theme.of(
                      context,
                    ).textTheme.bodyLarge!.copyWith(fontSize: 12.sp),
                  ),
                  SizedBox(height: 4.h),

                  Container(
                    // الحاوية الكبيرة (الخارجية)
                    decoration: BoxDecoration(
                      color: isDark
                          ? ColorsManager.bgGoogle
                          : ColorsManager.white,
                      borderRadius: BorderRadius.circular(16.r),
                      border: Border.all(
                        color: isDark
                            ? ColorsManager.dividerColorDark
                            : ColorsManager.dividerColorLight,
                      ),
                    ),
                    child: Column(
                      children: [
                        // القسم العلوي (النص والأيقونة)
                        Container(
                          padding: EdgeInsets.symmetric(
                            horizontal: 12.w,
                            vertical: 16.h,
                          ),
                          decoration: const BoxDecoration(
                            color: Colors
                                .transparent, // اجعلها شفافة لإلغاء أي تداخل ألوان
                            boxShadow:
                                [], // قم بإزالة المصفوفة تماماً لإلغاء الحواف والظلال الداخلية
                          ),
                          child: Row(
                            children: [
                              Container(
                                padding: EdgeInsets.all(8.w),
                                decoration: BoxDecoration(
                                  color: isDark
                                      ? const Color(0xFF333333)
                                      : Color(0xFFE2E8F0),
                                  shape: BoxShape.circle,
                                ),
                                child: Image.asset(controller.staryImage),
                              ),
                              SizedBox(width: 10.w),
                              Expanded(
                                child: Text(
                                  'progress'.tr,
                                  style: Theme.of(context).textTheme.bodySmall!
                                      .copyWith(
                                        fontSize: 12.sp,
                                        color: isDark
                                            ? Colors.white
                                            : ColorsManager.primaryLight,
                                      ),
                                ),
                              ),
                            ],
                          ),
                        ),

                        // قسم الـ Progress Bar
                        Padding(
                          padding: EdgeInsets.only(
                            bottom: 16.h,
                            left: 16.w,
                            right: 16.w,
                          ),
                          child: Stack(
                            children: [
                              /// الخلفية الرمادية للبار
                              Container(
                                width: double.infinity,
                                height: 8.h,
                                decoration: BoxDecoration(
                                  color: isDark
                                      ? const Color(0xFF333333)
                                      : ColorsManager.dividerColorLight,
                                  borderRadius: BorderRadius.circular(40.r),
                                ),
                              ),

                              /// اللون البرتقالي (التقدم)
                              Positioned(
                                right: 0, // ابدأ من اليمين لأن اللغة عربية
                                child: Container(
                                  width: 150.w, // القيمة المتغيرة للتقدم
                                  height: 8.h,
                                  decoration: BoxDecoration(
                                    color: ColorsManager.primaryCTA,
                                    borderRadius: BorderRadius.circular(40.r),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),

                  SizedBox(height: 8.h),
                  TextFieldWidget(
                    labelWidget: Row(
                      children: [
                        SizedBox(width: 6),
                        Container(
                          child: Container(
                            width: 48.w,
                            height: 24.h,
                            alignment: Alignment.center,
                            decoration: BoxDecoration(
                              color: Get.isDarkMode
                                  ? ColorsManager.bgGoogle
                                  : const Color(0xFFE2E8F0),
                              borderRadius: BorderRadius.circular(8.r),
                            ),
                            child: Text(
                              'optional'.tr,
                              textAlign: TextAlign.center,
                              style: Theme.of(
                                context,
                              ).textTheme.bodySmall!.copyWith(fontSize: 10.sp),
                            ),
                          ),
                        ),
                      ],
                    ),
                    label: 'vendor_message'.tr,
                    hintText: 'vendor_message_hint'.tr,
                    controller: controller.campaignGoalController,
                  ),

                  InfoRowWidget(
                    text: 'This message appears below the progress bar.'.tr,
                  ),
                  SizedBox(height: 16.h),

                  /// Next Button
                  ElevatedButton(
                    onPressed: controller.goToNextStep,
                    child: Text('next'.tr),
                  ),

                  SizedBox(height: 12.h),

                  /// Cancel
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
