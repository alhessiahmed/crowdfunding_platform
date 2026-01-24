import 'package:crowdfunding_platform/controller/core/constants/colors_manager.dart';
import 'package:crowdfunding_platform/controller/core/constants/images_manager.dart';
import 'package:crowdfunding_platform/controller/getx/controllers/campgin_update_and_control_controllers/add_update_to_campaign_controller.dart';
import 'package:crowdfunding_platform/view/widgets/add_update_to_campagin_screen.dart/campagin_card_withe_stutes.dart';
import 'package:crowdfunding_platform/view/widgets/add_update_to_campagin_screen.dart/dotted_button.dart';
import 'package:crowdfunding_platform/view/widgets/secondary_button.dart';
import 'package:crowdfunding_platform/view/widgets/text_field_widget.dart';
import 'package:crowdfunding_platform/view/widgets/update_campaign_widget/appbar_section.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

class AddUpdateToCampaign extends GetView<AddUpdateToCampaignController> {
  const AddUpdateToCampaign({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Form(
            key: controller.formKey,
            child: SingleChildScrollView(
              padding: EdgeInsets.symmetric(horizontal: 24.w),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  AppbarSection(
                    title: 'Add_campaign_update'.tr,
                    subTitle:
                        'Keep_donors_informed_about_your_campaign_update_and_progress.'
                            .tr,
                    onBack: controller.onBack,
                  ),
                  SizedBox(height: 24.h),
                  CampaignCardWitheStates(
                    title: 'قطرة حياة : مياه نظيفة لأطفال غزة',
                    statusText: 'Complete_campaign'.tr,
                    icon: SvgPicture.asset(
                      ImagesManager.completeIcon,
                      width: 16.w,
                      height: 16.h,
                    ),
                  ),
                  SizedBox(height: 24.h),
                  TextFieldWidget(
                    controller: controller.titleController,
                    label: 'Update_Title'.tr,
                    hintText: 'Example:Thank_you_for_your_support'.tr,
                  ),
                  SizedBox(height: 16.h),
                  TextFieldWidget(
                    controller: controller.contentController,
                    label: 'Update_content'.tr,
                    hintText:
                        'Write_a_short_description_that_explains_the_goal_of_the_campaign_update.'
                            .tr,
                    textInputAction: TextInputAction.newline,
                    keyboardType: TextInputType.multiline,
                    maxLines: 4,
                    minLines: 4,
                  ),
                  SizedBox(height: 16),
                  DottedButton(
                    icon: SvgPicture.asset(
                      ImagesManager.uploadImageIcon,
                      width: 80.w,
                      height: 80.h,
                    ),
                    label: 'Add_a_photo_or_video_(optional)'.tr,
                    actionText: 'Click_to_download'.tr,
                    formatsText: 'Jpg , Png , mp4',
                    onTap: controller.pickMedia,
                  ),
                  SizedBox(height: 24.h),
                  SizedBox(
                    width: double.infinity,
                    child: ElevatedButton.icon(
                      onPressed: controller.validateAndPublish,
                      label: Text('Post the update'.tr),
                      icon: SvgPicture.asset(
                        ImagesManager.sendIcon,
                      ),
                    ),
                  ),
                  SizedBox(height: 12.h),
                  SecondaryButton(
                    label: 'cancel'.tr,
                    onPressed: controller.onBack,
                    color: ColorsManager.secondaryThanksColor.withValues(
                      alpha: 0.1,
                    ),
                  ),
                  SizedBox(height: 24.h),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
