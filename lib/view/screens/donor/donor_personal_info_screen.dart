import 'dart:io';

import 'package:crowdfunding_platform/controller/core/constants/colors_manager.dart';
import 'package:crowdfunding_platform/view/widgets/text_field_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import '../../../controller/core/constants/images_manager.dart';
import '../../../controller/getx/controllers/donor/donor_personal_info_controller.dart';

class DonorPersonalInfoScreen extends GetView<DonorPersonalInfoController> {
  const DonorPersonalInfoScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 24.w, vertical: 40.h),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                InkWell(
                  onTap: () {
                    Get.back();
                  },
                  child: SvgPicture.asset(ImagesManager.backIcon),
                ),
                SizedBox(
                  width: 237.w,
                  child: Text(
                    'personal_info'.tr,
                    textAlign: TextAlign.center,
                    style: Theme.of(context).textTheme.bodyLarge,
                  ),
                ),
              ],
            ),
            SizedBox(height: 24.h),
            Text(
              'personal_picture'.tr,
              style: Theme.of(
                context,
              ).textTheme.bodyLarge!.copyWith(fontSize: 12.sp),
            ),
            SizedBox(height: 16.h),
            Obx(() {
              final image = controller.img.value;
              return Center(
                child: SizedBox(
                  width: 109.w,
                  height: 109.h,
                  child: CircleAvatar(
                    backgroundColor: ColorsManager.primaryCTA,
                    foregroundImage: image == null
                        ? AssetImage(ImagesManager.userImg)
                        : FileImage(File(image.path)),
                  ),
                ),
              );
            }),
            SizedBox(height: 8.h),
            Center(
              child: SizedBox(
                width: 164.w,
                height: 32.h,
                child: ElevatedButton(
                  style: Theme.of(context).elevatedButtonTheme.style!.copyWith(
                    shape: WidgetStateOutlinedBorder.resolveWith(
                      (states) => RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8.r),
                      ),
                    ),
                    padding: WidgetStatePropertyAll(EdgeInsets.all(8.r)),
                  ),
                  onPressed: () {
                    controller.pickImage(
                      source: ImageSource.gallery,
                      target: controller.img,
                    );
                  },
                  child: Row(
                    children: [
                      SvgPicture.asset(ImagesManager.editIcon),
                      SizedBox(width: 10.w),
                      Text(
                        'change_profile_picture'.tr,
                        style: TextStyle(
                          fontSize: 10.sp,
                          fontWeight: FontWeight.bold,
                          color: ColorsManager.white,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            SizedBox(height: 16.h),
            Row(
              children: [
                Expanded(
                  child: TextFieldWidget(
                    controller: controller.fNameController,
                    hintText: '',
                    label: 'first_name'.tr,
                  ),
                ),
                SizedBox(width: 8.w),
                Expanded(
                  child: TextFieldWidget(
                    controller: controller.lNameController,
                    hintText: '',
                    label: 'last_name'.tr,
                  ),
                ),
              ],
            ),
            SizedBox(height: 16.h),
            TextFieldWidget(
              controller: controller.emailController,
              hintText: '',
              label: 'email'.tr,
            ),
            SizedBox(height: 16.h),
            Row(
              children: [
                Expanded(
                  child: TextFieldWidget(
                    controller: controller.countryController,
                    hintText: '',
                    label: 'country'.tr,
                  ),
                ),
                SizedBox(width: 8.w),

                Expanded(
                  child: TextFieldWidget(
                    controller: controller.cityController,
                    hintText: '',
                    label: 'city'.tr,
                  ),
                ),
              ],
            ),
            SizedBox(height: 16.h),
            TextFieldWidget(
              controller: controller.phoneController,
              hintText: '',
              label: 'phone'.tr,
              maxLength: 9,
              suffixIcon: InkWell(
                onTap: controller.pickCountry,
                borderRadius: BorderRadius.circular(24.r),
                child: Container(
                  height: 48.h,
                  width: 48.w,
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                    color: Get.isDarkMode
                        ? ColorsManager.bgSectionDark
                        : ColorsManager.bgSectionLight,
                    borderRadius: BorderRadius.circular(16.r),
                  ),
                  child: Obx(
                    () => Text(
                      controller.selectedCountry.value.flagEmoji,
                      style: TextStyle(fontSize: 20.sp),
                    ),
                  ),
                ),
              ),
            ),
            SizedBox(height: 24.h),
            ElevatedButton(onPressed: () {}, child: Text('save_changes'.tr)),
          ],
        ),
      ),
    );
  }
}
