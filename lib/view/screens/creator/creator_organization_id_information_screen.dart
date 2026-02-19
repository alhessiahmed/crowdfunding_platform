import 'package:crowdfunding_platform/controller/getx/controllers/creator/creator_verification_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

import '../../../controller/core/constants/images_manager.dart';
import '../../widgets/text_field_widget.dart';
import '../../widgets/upload_card.dart';

class CreatorOrganizationIdInformationScreen
    extends GetView<CreatorVerificationController> {
  const CreatorOrganizationIdInformationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Form(
        key: controller.institutionFormKey,
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
              style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                fontSize: 12.sp,
              ),
            ),
            SizedBox(height: 16.h),
            TextFieldWidget(
              controller: controller.institutionController,
              hintText: 'institution_example'.tr,
              label: 'institution_name'.tr,
              validator: (value) =>
                  controller.requiredField(value, 'institution_name'),
            ),
            SizedBox(height: 16.h),
            TextFieldWidget(
              controller: controller.licenseController,
              hintText: 'license_example'.tr,
              label: 'license_number'.tr,
              validator: (value) =>
                  controller.requiredField(value, 'license_number'),
            ),
            SizedBox(height: 16.h),
            TextFieldWidget(
              controller: controller.dateController,
              hintText: 'YYYY-mm-dd',
              label: 'foundation_date'.tr,
              suffixIcon: SvgPicture.asset(ImagesManager.calender2),
              readOnly: true,
              onTap: controller.pickDate,
              validator: (value) =>
                  controller.requiredField(value, 'foundation_date'),
            ),
            SizedBox(height: 16.h),
            Text(
              'required_files'.tr,
              style: Theme.of(
                context,
              ).textTheme.bodyLarge!.copyWith(fontSize: 12.sp),
            ),
            SizedBox(height: 12.h),
            Obx(
              () => Column(
                children: [
                  _RequiredFileRow(
                    label: 'license_certificate'.tr,
                    checked: controller.licenseImg.value != null,
                  ),
                  _RequiredFileRow(
                    label: 'manager_id'.tr,
                    checked: controller.orgIdImg.value != null,
                  ),
                  _RequiredFileRow(
                    label: 'authorization_letter'.tr,
                    checked: controller.authorizationImg.value != null,
                  ),
                  _RequiredFileRow(
                    label: 'personal_pic'.tr,
                    checked: controller.personalImg.value != null,
                  ),
                ],
              ),
            ),
            FormField<bool>(
              validator: (_) => controller.hasInstitutionFiles
                  ? null
                  : 'Fill_required_fields'.tr,
              builder: (state) {
                if (state.errorText == null) {
                  return const SizedBox.shrink();
                }
                return Padding(
                  padding: EdgeInsets.only(top: 8.h),
                  child: Text(
                    state.errorText!,
                    style: Theme.of(context).textTheme.bodySmall!.copyWith(
                      color: Theme.of(context).colorScheme.error,
                    ),
                  ),
                );
              },
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
              title: 'license_certificate'.tr,
              subtitle: 'add_license'.tr,
              onTap: () => controller.pickImage(
                source: ImageSource.gallery,
                target: controller.licenseImg,
              ),
              imgPath: ImagesManager.galleryIcon,
            ),
            SizedBox(height: 16.h),
            Text(
              'manager_id'.tr,
              style: Theme.of(
                context,
              ).textTheme.bodyLarge!.copyWith(fontSize: 12.sp),
            ),
            SizedBox(height: 16.h),
            UploadCard(
              title: 'only_front_id'.tr,
              subtitle: 'please_add_clear_img'.tr,
              onTap: () => controller.pickImage(
                source: ImageSource.gallery,
                target: controller.orgIdImg,
              ),
              imgPath: ImagesManager.galleryIcon,
            ),
            const SizedBox(height: 16),
            Text(
              'authorization_letter'.tr,
              style: Theme.of(
                context,
              ).textTheme.bodyLarge!.copyWith(fontSize: 12.sp),
            ),
            SizedBox(height: 16.h),
            UploadCard(
              title: 'add_authorization_letter'.tr,
              subtitle: 'please_add_clear_img'.tr,
              onTap: () => controller.pickImage(
                source: ImageSource.gallery,
                target: controller.authorizationImg,
              ),
              imgPath: ImagesManager.galleryIcon,
            ),
            SizedBox(height: 16.h),
            Text(
              'manager_personal_pic'.tr,
              style: Theme.of(
                context,
              ).textTheme.bodyLarge!.copyWith(fontSize: 12.sp),
            ),
            SizedBox(height: 16.h),
            UploadCard(
              title: 'take_pic'.tr,
              subtitle: 'take_pic_info'.tr,
              onTap: () => controller.pickImage(
                source: ImageSource.camera,
                target: controller.personalImg,
              ),
              imgPath: ImagesManager.cameraIcon,
            ),
          ],
        ),
      ),
    );
  }
}

class _RequiredFileRow extends StatelessWidget {
  const _RequiredFileRow({required this.label, required this.checked});

  final String label;
  final bool checked;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Checkbox(value: checked, onChanged: null),
        Expanded(
          child: Text(
            label,
            textAlign: TextAlign.start,
            style: Theme.of(
              context,
            ).textTheme.bodyMedium!.copyWith(fontSize: 12.sp),
          ),
        ),
      ],
    );
  }
}
