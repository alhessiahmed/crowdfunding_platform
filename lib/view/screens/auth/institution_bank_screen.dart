import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../../controller/core/constants/colors_manager.dart';
import '../../../controller/core/constants/images_manager.dart';
import '../../../controller/getx/controllers/auth/creator_onboarding_controller.dart';
import '../../widgets/information_widget.dart';
import '../../widgets/text_field_widget.dart';

class InstitutionBankScreen extends GetView<CreatorOnboardingController> {
  const InstitutionBankScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 10.h),
            Text(
              'transactions_info'.tr,
              style: Theme.of(context).textTheme.bodyLarge,
              textAlign: TextAlign.start,
            ),
            SizedBox(height: 16.h),
            Text(
              'disclaimer'.tr,
              style: Theme.of(
                context,
              ).textTheme.bodyMedium!.copyWith(fontSize: 12.sp),
            ),
            SizedBox(height: 16.h),
            TextFieldWidget(
              controller: controller.accHolderController,
              hintText: 'institution_example',
              label: 'institution_acc'.tr,
              labelImgPath: ImagesManager.lockIcon,
            ),
            SizedBox(height: 16.h),
            TextFieldWidget(
              controller: controller.ibanController,
              hintText: 'iban_hint'.tr,
              label: 'institution_iban'.tr,
            ),
            SizedBox(height: 4.h),
            Text(
              'iban_check'.tr,
              style: Theme.of(
                context,
              ).textTheme.bodyMedium!.copyWith(fontSize: 12.sp),
            ),
            SizedBox(height: 16.h),
            Text(
              'bank_name'.tr,
              style: Theme.of(
                context,
              ).textTheme.bodyLarge!.copyWith(fontSize: 12.sp),
            ),
            SizedBox(height: 8.h),
            InkWell(
              borderRadius: BorderRadius.circular(16.r),
              onTap: () => controller.selectBank(Bank.palestine),
              child: Container(
                height: 56.h,
                padding: EdgeInsets.symmetric(horizontal: 16.w),
                decoration: BoxDecoration(
                  color: Get.isDarkMode
                      ? ColorsManager.bgSectionDark
                      : ColorsManager.bgSectionLight,
                  borderRadius: BorderRadius.circular(16.r),
                ),
                child: Row(
                  children: [
                    Image.asset(ImagesManager.bankOfPalestine),
                    SizedBox(width: 10.w),
                    Text(
                      'bank_of_palestine'.tr,
                      style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                        fontSize: 12.sp,
                        fontWeight: FontWeight.w800,
                      ),
                    ),
                    Spacer(),
                    controller.bank.value == Bank.palestine
                        ? Icon(
                            Icons.check_circle,
                            color: Get.isDarkMode
                                ? ColorsManager.iconDefaultDark
                                : ColorsManager.iconDefaultLight,
                            size: 24.r,
                          )
                        : Container(),
                  ],
                ),
              ),
            ),
            SizedBox(height: 54.h),
            InformationWIdget(
              text: 'only_bank_account'.tr,
              height: 104.h,
              width: 263.w,
              imgPath: ImagesManager.lightIcon,
            ),
            SizedBox(height: 10.h),
          ],
        ),
      ),
    );
  }
}
