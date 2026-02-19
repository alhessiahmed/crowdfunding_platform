import 'package:crowdfunding_platform/controller/getx/controllers/auth/creator_onboarding_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import '../../../controller/core/constants/images_manager.dart';
import '../../../model/account_type.dart';
import '../../widgets/loading_widget.dart';
import '../../widgets/step_indicator.dart';
import 'account_trust_info_screen.dart';
import 'acount_type_screen.dart';
import 'campaign_selection_screen.dart';
import 'experience_level_screen.dart';
import 'institution_bank_screen.dart';
import 'institution_id_screen.dart';

class OnboardingShellScreen extends GetView<CreatorOnboardingController> {
  const OnboardingShellScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Obx(() {
          return Stack(
            children: [
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 24.w, vertical: 40.h),
                child: Column(
                  children: [
                    Row(
                      children: [
                        InkWell(
                          onTap: controller.previous,
                          child: SvgPicture.asset(ImagesManager.backIcon),
                        ),
                        Spacer(),
                        Text(
                          '${'step'.tr} ${controller.currentPage.value + 1} ${'of'.tr} ${controller.totalSteps}',
                          style: Theme.of(
                            context,
                          ).textTheme.bodyMedium!.copyWith(fontSize: 12.sp),
                        ),
                        SizedBox(width: 8.w),
                        SizedBox(
                          height: 8.h,
                          width: 58.w,
                          child: StepIndicator(progress: controller.progress),
                        ),
                      ],
                    ),
                    Expanded(
                      child: PageView(
                        controller: controller.pageController,
                        physics: const NeverScrollableScrollPhysics(),
                        onPageChanged: controller.onPageChanged,
                        children: controller.accountType.value ==
                                AccountType.organization
                            ? const [
                                AccountTypeScreen(),
                                InstitutionIdScreen(),
                                InstitutionBankScreen(),
                              ]
                            : const [
                                AccountTypeScreen(),
                                CampaignSelectionScreen(),
                                ExperienceLevelScreen(),
                                AccountTrustInfoScreen(),
                              ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(24),
                      child: SizedBox(
                        width: double.infinity,
                        height: 56,
                        child: ElevatedButton(
                          onPressed: controller.isRegistering.value
                              ? null
                              : controller.currentPage.value ==
                                    controller.totalSteps - 1
                              ? controller.finish
                              : controller.canProceed
                              ? controller.next
                              : null,
                          child: Text(
                            controller.currentPage.value ==
                                    controller.totalSteps - 1
                                ? 'save_and_continue'.tr
                                : 'next'.tr,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Visibility(
                visible: controller.isRegistering.value,
                child: const LoadingWidget(),
              ),
            ],
          );
        }),
      ),
    );
  }
}
