import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../../controller/core/constants/images_manager.dart';
import '../../../controller/getx/controllers/auth/user_type_selection_controller.dart';
import '../../../model/sign_up_draft.dart';
import '../../widgets/loading_widget.dart';
import '../../widgets/user_type_card.dart';

class UserTypeSelectionScreen extends GetView<UserTypeSelectionController> {
  const UserTypeSelectionScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final SignUpDraft draft = Get.arguments as SignUpDraft;
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 24.w),
          child: Stack(
            children: [
              Column(
                children: [
                  SizedBox(height: 41.h),
                  Image.asset(ImagesManager.logo),
                  SizedBox(height: 21.h),
                  Text(
                    'how_to_use'.tr,
                    textAlign: TextAlign.center,
                    style: Theme.of(context).textTheme.bodyLarge,
                  ),
                  SizedBox(height: 16.h),
                  Text(
                    'how_to_use_info'.tr,
                    textAlign: TextAlign.center,
                    style: Theme.of(
                      context,
                    ).textTheme.bodyMedium!.copyWith(fontSize: 12.sp),
                  ),
                  SizedBox(height: 24.h),
                  Obx(
                    () => Column(
                      children: [
                        UserTypeCard(
                          title: 'donator'.tr,
                          subtitle: 'donator_extra'.tr,
                          isSelected:
                              controller.selectedType.value == UserType.donor,
                          onTap: () => controller.select(UserType.donor),
                          iconPath: Get.isDarkMode
                              ? ImagesManager.donatorIconDark
                              : ImagesManager.donatorIconLight,
                        ),
                        SizedBox(height: 8.h),
                        UserTypeCard(
                          title: 'creator'.tr,
                          subtitle: 'creator_extra'.tr,
                          isSelected:
                              controller.selectedType.value == UserType.creator,
                          onTap: () => controller.select(UserType.creator),
                          iconPath: Get.isDarkMode
                              ? ImagesManager.creatorIconDark
                              : ImagesManager.creatorIconLight,
                        ),
                      ],
                    ),
                  ),
                  const Spacer(),
                  SizedBox(
                    width: double.infinity,
                    height: 56.h,
                    child: ElevatedButton(
                      onPressed: () => controller.submit(
                        firstName: draft.firstName,
                        lastName: draft.lastName,
                        email: draft.email,
                        password: draft.password,
                        dateOfBirth: draft.dateOfBirth,
                      ),
                      child: Text('continue'.tr),
                    ),
                  ),
                  SizedBox(height: 24.h),
                  Text(
                    'by_continue'.tr,
                    style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                      fontSize: 12.sp,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                  SizedBox(height: 40.h),
                ],
              ),
              Obx(
                () => Visibility(
                  visible: controller.isRegistering.value,
                  child: const LoadingWidget(),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
