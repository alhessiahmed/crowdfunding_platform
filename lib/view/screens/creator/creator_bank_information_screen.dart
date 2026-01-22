import 'package:crowdfunding_platform/controller/getx/controllers/creator/creator_verification_controller.dart';
import 'package:crowdfunding_platform/view/widgets/text_field_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import '../../../controller/core/constants/colors_manager.dart';
import '../../../controller/core/constants/images_manager.dart';
import '../../widgets/information_widget.dart';

class CreatorBankInformationScreen
    extends GetView<CreatorVerificationController> {
  const CreatorBankInformationScreen({super.key});

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
              hintText: '',
              label: 'bank_acc_holder_name'.tr,
              labelImgPath: ImagesManager.lockIcon,
            ),
            SizedBox(height: 8.h),
            Text('checked_by_id'.tr),
            SizedBox(height: 16.h),
            TextFieldWidget(
              controller: controller.ibanController,
              hintText: 'iban_hint'.tr,
              label: 'iban_label'.tr,
            ),
            SizedBox(height: 4.h),
            Text('iban_check'.tr),
            SizedBox(height: 16.h),
            Text(
              'bank_name',
              style: Theme.of(
                context,
              ).textTheme.bodyLarge!.copyWith(fontSize: 12),
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
            SizedBox(height: 121.h),
            InformationWIdget(
              text: 'donations_transactions_routines'.tr,
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
