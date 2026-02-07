import 'package:crowdfunding_platform/controller/getx/controllers/donor/donor_verification_controller.dart';
import 'package:crowdfunding_platform/view/widgets/text_field_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import '../../../../controller/core/constants/colors_manager.dart';
import '../../../../controller/core/constants/images_manager.dart';
import '../../../widgets/upload_card.dart';

class DonorIdVerificationScreen extends GetView<DonorVerificationController> {
  const DonorIdVerificationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 10.h),
            Text(
              'id_info'.tr,
              style: Theme.of(context).textTheme.bodyLarge,
              textAlign: TextAlign.start,
            ),
            SizedBox(height: 16.h),
            Text(
              'id_info_extra'.tr,
              style: Theme.of(
                context,
              ).textTheme.bodyMedium!.copyWith(fontSize: 12.sp),
            ),
            SizedBox(height: 16.h),
            TextFieldWidget(
              controller: controller.nameController,
              hintText: '',
              label: 'full_name_label'.tr,
            ),
            SizedBox(height: 16.h),
            TextFieldWidget(
              controller: controller.idController,
              hintText: '',
              label: 'id'.tr,
            ),
            SizedBox(height: 16.h),
            Container(
              padding: const EdgeInsets.all(4),
              decoration: BoxDecoration(
                color: Get.isDarkMode
                    ? ColorsManager.bgSectionDark
                    : ColorsManager.bgSectionLight,
                borderRadius: BorderRadius.circular(100.r),
              ),
              child: Row(
                children: [
                  _item(
                    label: 'personal_id'.tr,
                    selected: controller.isId.value,
                    onTap: () => controller.selectId(true),
                    context: context,
                  ),
                  _item(
                    label: 'passport'.tr,
                    selected: !controller.isId.value,
                    onTap: () => controller.selectId(false),
                    context: context,
                  ),
                ],
              ),
            ),
            SizedBox(height: 16.h),
            Text(
              'id_pic'.tr,
              style: Theme.of(
                context,
              ).textTheme.bodyLarge!.copyWith(fontSize: 12.sp),
            ),
            SizedBox(height: 16.h),
            UploadCard(
              title: 'add_id'.tr,
              subtitle: 'add_clear_id'.tr,
              onTap: () => controller.pickImage(
                source: ImageSource.gallery,
                target: controller.idFile,
              ),
              imgPath: ImagesManager.galleryIcon,
            ),
          ],
        ),
      ),
    );
  }

  Widget _item({
    required String label,
    required bool selected,
    required VoidCallback onTap,
    required BuildContext context,
  }) {
    return Expanded(
      child: GestureDetector(
        onTap: onTap,
        child: Container(
          padding: const EdgeInsets.symmetric(vertical: 12),
          decoration: BoxDecoration(
            color: selected
                ? Get.isDarkMode
                      ? ColorsManager.bgGoogle
                      : Colors.white
                : Colors.transparent,
            borderRadius: BorderRadius.circular(28),
            boxShadow: selected
                ? [
                    BoxShadow(
                      blurRadius: 4,
                      color: Colors.black.withOpacity(0.25),
                      offset: Offset(0, 1.h),
                    ),
                  ]
                : null,
          ),
          alignment: Alignment.center,
          child: Text(
            label,
            style: selected
                ? Theme.of(
                    context,
                  ).textTheme.bodyLarge!.copyWith(fontSize: 16.sp)
                : Theme.of(context).textTheme.bodyMedium,
          ),
        ),
      ),
    );
  }
}
