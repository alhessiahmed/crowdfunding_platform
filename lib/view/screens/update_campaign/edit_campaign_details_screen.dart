import 'dart:typed_data';

import 'package:crowdfunding_platform/controller/core/constants/colors_manager.dart';
import 'package:crowdfunding_platform/controller/core/constants/images_manager.dart';
import 'package:crowdfunding_platform/controller/getx/controllers/campgin_update_and_control_controllers/edit_campaign_details_controller.dart';
import 'package:crowdfunding_platform/view/widgets/add_update_to_campagin_screen.dart/campagin_card_withe_stutes.dart';
import 'package:crowdfunding_platform/view/widgets/add_update_to_campagin_screen.dart/dotted_button.dart';
import 'package:crowdfunding_platform/view/widgets/secondary_button.dart';
import 'package:crowdfunding_platform/view/widgets/text_field_widget.dart';
import 'package:crowdfunding_platform/view/widgets/update_campaign_widget/appbar_section.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

class EditCampaignDetailsScreen extends GetView<EditCampaignDetailsController> {
  const EditCampaignDetailsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Form(
            key: controller.formKey,
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 24.w),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  AppbarSection(
                    title: 'Edit_campaign_details'.tr,
                    subTitle: 'Control_the_details_of_your_campaign'.tr,
                    onBack: controller.onBack,
                  ),
                  SizedBox(height: 24.h),
                  CampaignCardWitheStates(
                    title: 'قطرة حياة : مياه نظيفة لأطفال غزة',
                    statusText: 'Complete_campaign'.tr,
                    statusColor: ColorsManager.success,
                  ),
                  SizedBox(height: 24.h),
                  TextFieldWidget(
                    controller: controller.titleController,
                    label: 'Campaign_title'.tr,
                    hintText: 'Campaign_title_sample'.tr,
                    validator: _requiredValidator,
                  ),
                  SizedBox(height: 16.h),
                  TextFieldWidget(
                    controller: controller.briefController,
                    label: 'Brief_description_of_the_campaign'.tr,
                    hintText: 'Brief_description_of_the_campaign'.tr,
                    textInputAction: TextInputAction.newline,
                    keyboardType: TextInputType.multiline,
                    maxLines: 3,
                    minLines: 3,
                    validator: _requiredValidator,
                  ),
                  SizedBox(height: 16.h),
                  _ReadOnlyField(
                    onTap: () => _openSelectionSheet(
                      context,
                      title: 'Campaign_type'.tr,
                      options: controller.campaignTypeLabels,
                      selectedValue: controller.typeController.text,
                      onSelected: (value) {
                        controller.typeController.text = value;
                      },
                    ),
                    child: TextFieldWidget(
                      controller: controller.typeController,
                      label: 'Campaign_type'.tr,
                      hintText: 'Campaign_type'.tr,
                      validator: _requiredValidator,
                      suffixIcon: Icon(
                        Icons.keyboard_arrow_down_rounded,
                        color: theme.colorScheme.primary,
                      ),
                    ),
                  ),
                  SizedBox(height: 16.h),
                  _ReadOnlyField(
                    onTap: () => _openSelectionSheet(
                      context,
                      title: 'Campaign_duration'.tr,
                      options: controller.durationLabels,
                      selectedValue: controller.durationController.text,
                      onSelected: (value) {
                        controller.durationController.text = value;
                      },
                    ),
                    child: TextFieldWidget(
                      controller: controller.durationController,
                      label: 'Campaign_duration'.tr,
                      hintText: 'Campaign_duration'.tr,
                      validator: _requiredValidator,
                      suffixIcon: Icon(
                        Icons.keyboard_arrow_down_rounded,
                        color: theme.colorScheme.primary,
                      ),
                    ),
                  ),
                  SizedBox(height: 16.h),
                  TextFieldWidget(
                    controller: controller.objectiveController,
                    label: 'Campaign_objective'.tr,
                    hintText: 'Campaign_objective'.tr,
                    keyboardType: TextInputType.number,
                    inputFormatters: [FilteringTextInputFormatter.digitsOnly],
                    validator: _numberValidator,
                    prefixIcon: SvgPicture.asset(
                      ImagesManager.targetCampaignIcon,
                      width: 24.w,
                      height: 24.h,
                      fit: BoxFit.cover,
                    ),
                  ),
                  SizedBox(height: 16.h),
                  TextFieldWidget(
                    controller: controller.motivationalController,
                    label: 'motivational_message'.tr,
                    hintText: 'motivational_message'.tr,
                    textInputAction: TextInputAction.newline,
                    keyboardType: TextInputType.multiline,
                    validator: _requiredValidator,
                  ),
                  SizedBox(height: 24.h),
                  Text(
                    'Media'.tr,
                    style: theme.textTheme.labelLarge?.copyWith(
                      color: theme.colorScheme.primary,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: 12.h),
                  Obx(() {
                    final files = controller.mediaFiles;
                    final _ = files.length;
                    final thumbnails = controller.videoThumbnails;
                    final __ = thumbnails.length;
                    final customThumbnails = controller.customVideoThumbnails;
                    final ___ = customThumbnails.length;
                    return _MediaPreviewGrid(
                      files: files,
                      fallbackAssets: controller.defaultMediaAssets,
                      onRemove: controller.removeMediaAt,
                      videoThumbnails: thumbnails,
                      customVideoThumbnails: customThumbnails,
                    );
                  }),
                  SizedBox(height: 16.h),
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
                      onPressed: controller.saveChanges,
                      label: Text('Save_changes'.tr),
                      icon: SvgPicture.asset(
                        ImagesManager.sendIcon,
                        width: 20.w,
                        height: 20.h,
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

  void _openSelectionSheet(
    BuildContext context, {
    required String title,
    required List<String> options,
    required String selectedValue,
    required ValueChanged<String> onSelected,
  }) {
    final theme = Theme.of(context);
    Get.bottomSheet(
      Container(
        padding: EdgeInsets.symmetric(horizontal: 24.w, vertical: 16.h),
        decoration: BoxDecoration(
          color: theme.colorScheme.surface,
          borderRadius: BorderRadius.vertical(top: Radius.circular(24.r)),
        ),
        child: SafeArea(
          top: false,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                title,
                style: theme.textTheme.titleMedium?.copyWith(
                  fontWeight: FontWeight.bold,
                  color: theme.colorScheme.primary,
                ),
              ),
              SizedBox(height: 12.h),
              ...options.map(
                (option) => InkWell(
                  onTap: () {
                    onSelected(option);
                    Get.back();
                  },
                  child: Padding(
                    padding: EdgeInsets.symmetric(vertical: 12.h),
                    child: Row(
                      children: [
                        Expanded(
                          child: Text(
                            option,
                            style: theme.textTheme.bodyMedium?.copyWith(
                              color: theme.colorScheme.primary,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ),
                        if (option == selectedValue)
                          Icon(
                            Icons.check_rounded,
                            color: theme.colorScheme.primary,
                          ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  String? _requiredValidator(String? value) {
    if (value == null || value.trim().isEmpty) {
      return 'Field_required'.tr;
    }
    return null;
  }

  String? _numberValidator(String? value) {
    if (value == null || value.trim().isEmpty) {
      return 'Field_required'.tr;
    }
    if (int.tryParse(value) == null) {
      return 'Invalid_number'.tr;
    }
    return null;
  }
}

class _ReadOnlyField extends StatelessWidget {
  const _ReadOnlyField({required this.child, this.onTap});

  final Widget child;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: AbsorbPointer(child: child),
    );
  }
}

Widget _buildMediaPreview(
  ThemeData theme,
  XFile file,
  bool isVideo,
  Uint8List? thumbnail,
) {
  if (isVideo) {
    if (thumbnail != null) {
      return Image.memory(thumbnail, fit: BoxFit.cover);
    }
    return Container(
      color: theme.colorScheme.onInverseSurface,
      child: Icon(
        Icons.play_circle_outline,
        color: theme.colorScheme.primary.withValues(alpha: .8),
        size: 28,
      ),
    );
  }

  return FutureBuilder(
    future: file.readAsBytes(),
    builder: (context, snapshot) {
      if (snapshot.hasData) {
        return Image.memory(snapshot.data!, fit: BoxFit.cover);
      }
      return Container(color: theme.colorScheme.onInverseSurface);
    },
  );
}

bool _isVideoPath(String path) {
  if (path.isEmpty) {
    return false;
  }
  final extension = path.split('.').last.toLowerCase();
  return extension == 'mp4';
}

class _MediaPreviewGrid extends StatelessWidget {
  const _MediaPreviewGrid({
    required this.files,
    required this.fallbackAssets,
    required this.onRemove,
    required this.videoThumbnails,
    required this.customVideoThumbnails,
  });

  final List<XFile> files;
  final List<String> fallbackAssets;
  final ValueChanged<int> onRemove;
  final Map<String, Uint8List> videoThumbnails;
  final Map<String, bool> customVideoThumbnails;

  @override
  Widget build(BuildContext context) {
    final items = files.isNotEmpty
        ? List<_MediaItem>.generate(
            files.length,
            (index) => _MediaItem.file(
              file: files[index],
              onRemove: () => onRemove(index),
            ),
          )
        : List<_MediaItem>.generate(
            fallbackAssets.length,
            (index) => _MediaItem.asset(assetPath: fallbackAssets[index]),
          );

    return Wrap(
      spacing: 12.w,
      runSpacing: 12.h,
      children: items
          .map(
            (item) => _MediaTile(
              item: item,
              videoThumbnails: videoThumbnails,
              customVideoThumbnails: customVideoThumbnails,
            ),
          )
          .toList(),
    );
  }
}

class _MediaItem {
  const _MediaItem._({this.file, this.assetPath, this.onRemove});

  factory _MediaItem.file({required XFile file, VoidCallback? onRemove}) {
    return _MediaItem._(file: file, onRemove: onRemove);
  }

  factory _MediaItem.asset({required String assetPath}) {
    return _MediaItem._(assetPath: assetPath);
  }

  final XFile? file;
  final String? assetPath;
  final VoidCallback? onRemove;
}

class _MediaTile extends StatelessWidget {
  const _MediaTile({
    required this.item,
    required this.videoThumbnails,
    required this.customVideoThumbnails,
  });

  final _MediaItem item;
  final Map<String, Uint8List> videoThumbnails;
  final Map<String, bool> customVideoThumbnails;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final size = 96.w;

    final filePath = item.file?.path ?? '';
    final isVideo = _isVideoPath(filePath);
    final hasThumbnail =
        !isVideo || (videoThumbnails[filePath]?.isNotEmpty ?? false);
    final hasCustomThumbnail = customVideoThumbnails[filePath] ?? false;
    final showVideoBadge = isVideo && hasThumbnail && !hasCustomThumbnail;

    return ClipRRect(
      borderRadius: BorderRadius.circular(16.r),
      child: Container(
        width: size,
        height: size,
        color: theme.colorScheme.onInverseSurface,
        child: Stack(
          fit: StackFit.expand,
          children: [
            Positioned.fill(
              child: item.file != null
                  ? _buildMediaPreview(
                      theme,
                      item.file!,
                      isVideo,
                      videoThumbnails[filePath],
                    )
                  : Image.asset(
                      item.assetPath ?? ImagesManager.placeHolder,
                      fit: BoxFit.cover,
                    ),
            ),
            if (item.onRemove != null)
              Positioned(
                top: 6.h,
                right: 1.w,
                child: GestureDetector(
                  onTap: item.onRemove,
                  child: Container(
                    padding: EdgeInsets.all(6.r),
                    decoration: BoxDecoration(
                      boxShadow: hasThumbnail
                          ? [
                              BoxShadow(
                                color: Colors.black.withValues(alpha: .15),
                                blurRadius: 6,
                                offset: const Offset(0, 2),
                              ),
                            ]
                          : null,
                    ),
                    child: SvgPicture.asset(
                      ImagesManager.closeIcon,
                      width: 20.w,
                      height: 20.h,
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
              ),
            if (showVideoBadge)
              Positioned(
                left: 6.w,
                bottom: 6.h,
                child: Container(
                  padding: EdgeInsets.all(4.r),
                  decoration: BoxDecoration(
                    color: theme.colorScheme.primary.withValues(alpha: .85),
                    borderRadius: BorderRadius.circular(8.r),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withValues(alpha: .2),
                        blurRadius: 6,
                        offset: const Offset(0, 2),
                      ),
                    ],
                  ),
                  child: Icon(
                    Icons.play_arrow_rounded,
                    size: 16.r,
                    color: theme.colorScheme.onPrimary,
                  ),
                ),
              ),
          ],
        ),
      ),
    );
  }
}
