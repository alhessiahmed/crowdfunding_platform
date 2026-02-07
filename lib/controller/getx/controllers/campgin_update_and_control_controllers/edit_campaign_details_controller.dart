import 'dart:typed_data';

import 'package:crowdfunding_platform/controller/core/constants/colors_manager.dart';
import 'package:crowdfunding_platform/controller/core/constants/images_manager.dart';
import 'package:crowdfunding_platform/controller/core/utils/show_snackbar.dart';
import 'package:crowdfunding_platform/model/control_campaign.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:video_thumbnail/video_thumbnail.dart';

class EditCampaignDetailsController extends GetxController {
  final formKey = GlobalKey<FormState>();
  final titleController = TextEditingController();
  final briefController = TextEditingController();
  final typeController = TextEditingController();
  final durationController = TextEditingController();
  final objectiveController = TextEditingController();
  final motivationalController = TextEditingController();

  final RxList<XFile> mediaFiles = <XFile>[].obs;
  final RxMap<String, Uint8List> videoThumbnails =
      <String, Uint8List>{}.obs;
  final RxMap<String, bool> customVideoThumbnails =
      <String, bool>{}.obs;

  late final CampaignSummary summary;
  final ImagePicker _picker = ImagePicker();

  final List<String> campaignTypeKeys = const [
    'water',
    'food_relief',
    'education',
    'health',
    'shelter',
    'animals',
    'environment',
  ];

  final List<int> durationOptions = const [7, 14, 30, 60, 90];

  @override
  void onInit() {
    super.onInit();
    final args = Get.arguments;
    if (args is CampaignSummary) {
      summary = args;
    } else {
      summary = const CampaignSummary(
        titleKey: 'Campaign_title_sample',
        statusLabelKey: 'Active',
        categoryLabelKey: 'water',
        imagePath: ImagesManager.test,
        starsCollected: 2500,
        starsTarget: 5000,
        daysRemaining: 20,
      );
    }

    titleController.text = summary.titleKey.tr;
    typeController.text = summary.categoryLabelKey.tr;
    durationController.text = formatDuration(summary.daysRemaining);
    objectiveController.text = summary.starsTarget.toString();
  }

  List<String> get campaignTypeLabels =>
      campaignTypeKeys.map((key) => key.tr).toList();

  List<String> get durationLabels =>
      durationOptions.map(formatDuration).toList();

  List<String> get defaultMediaAssets => [
    summary.imagePath,
    ImagesManager.test,
    ImagesManager.placeHolder,
  ];

  String formatDuration(int days) => '$days ${'Dayes'.tr}';

  Future<void> pickMedia() async {
    final file = await _picker.pickMedia();
    if (file == null) {
      return;
    }
    final extension = _extensionOf(file.path);
    if (_isImageExtension(extension)) {
      mediaFiles.add(file);
      return;
    }
    if (_isVideoExtension(extension)) {
      await _handleVideoPick(file.path);
      mediaFiles.add(file);
      return;
    }
    showSnackbar(message: 'Unsupported_format'.tr, success: false);
  }

  Future<void> pickImage() async {
    final file = await _picker.pickImage(
      source: ImageSource.gallery,
      imageQuality: 85,
    );
    if (file == null) {
      return;
    }
    final extension = _extensionOf(file.path);
    if (!_isImageExtension(extension)) {
      showSnackbar(message: 'Only_images_allowed'.tr, success: false);
      return;
    }
    mediaFiles.add(file);
  }

  Future<void> pickVideo() async {
    final file = await _picker.pickVideo(source: ImageSource.gallery);
    if (file == null) {
      return;
    }
    final extension = _extensionOf(file.path);
    if (!_isVideoExtension(extension)) {
      showSnackbar(message: 'Only_mp4_allowed'.tr, success: false);
      return;
    }
    await _handleVideoPick(file.path);
    mediaFiles.add(file);
  }

  void removeMediaAt(int index) {
    if (index < 0 || index >= mediaFiles.length) {
      return;
    }
    final path = mediaFiles[index].path;
    mediaFiles.removeAt(index);
    videoThumbnails.remove(path);
    customVideoThumbnails.remove(path);
  }

  void onBack() {
    Get.back();
  }

  void saveChanges() {
    final isValid = formKey.currentState?.validate() ?? false;
    if (!isValid) {
      showSnackbar(message: 'Fill_required_fields'.tr, success: false);
      return;
    }
    showSnackbar(message: 'Changes_saved'.tr);
  }

  String _extensionOf(String path) {
    final segments = path.split('.');
    if (segments.length < 2) {
      return '';
    }
    return segments.last.toLowerCase();
  }

  bool _isImageExtension(String extension) {
    return extension == 'jpg' || extension == 'jpeg' || extension == 'png';
  }

  bool _isVideoExtension(String extension) {
    return extension == 'mp4';
  }

  Future<void> _handleVideoPick(String videoPath) async {
    final shouldPickThumbnail = await _askThumbnailChoice();
    if (shouldPickThumbnail == true) {
      final pickedThumbnail = await _picker.pickImage(
        source: ImageSource.gallery,
        imageQuality: 85,
      );
      if (pickedThumbnail != null) {
        final bytes = await pickedThumbnail.readAsBytes();
        if (bytes.isNotEmpty) {
          videoThumbnails[videoPath] = bytes;
          customVideoThumbnails[videoPath] = true;
          return;
        }
      }
    }
    customVideoThumbnails[videoPath] = false;
    await _attachVideoThumbnail(videoPath);
  }

  Future<bool?> _askThumbnailChoice() {
    final context = Get.context;
    final theme = context != null ? Theme.of(context) : null;
    final titleStyle = theme?.textTheme.titleMedium?.copyWith(
      fontWeight: FontWeight.bold,
      color: theme.colorScheme.primary,
    );
    final contentStyle = theme?.textTheme.bodyMedium?.copyWith(
      color: theme.colorScheme.onSurface,
      height: 1.4,
    );

    return Get.dialog<bool>(
      AlertDialog(
        title: Text('Add_thumbnail'.tr, style: titleStyle),
        content: Text('Add_thumbnail_question'.tr, style: contentStyle),
        actionsPadding: const EdgeInsets.fromLTRB(24, 0, 24, 16),
        actions: [
          SizedBox(
            width: double.infinity,
            child: Row(
              children: [
                Expanded(
                  child: SizedBox(
                    height: 44,
                    child: OutlinedButton(
                      onPressed: () => Get.back(result: false),
                      style: OutlinedButton.styleFrom(
                        side: const BorderSide(
                          color: ColorsManager.primaryLight,
                          width: 2,
                        ),
                        foregroundColor: ColorsManager.primaryLight,
                        backgroundColor: theme?.colorScheme.surface,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12),
                        ),
                        textStyle: theme?.textTheme.bodyMedium?.copyWith(
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      child: Text('Skip'.tr),
                    ),
                  ),
                ),
                const SizedBox(width: 12),
                Expanded(
                  child: SizedBox(
                    height: 44,
                    child: ElevatedButton(
                      onPressed: () => Get.back(result: true),
                      child: Text('Choose_thumbnail'.tr),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
      barrierDismissible: true,
    );
  }

  Future<void> _attachVideoThumbnail(String videoPath) async {
    final fallback = await _generateVideoThumbnail(videoPath);
    if (fallback != null) {
      videoThumbnails[videoPath] = fallback;
    }
  }

  Future<Uint8List?> _generateVideoThumbnail(String path) async {
    try {
      return await VideoThumbnail.thumbnailData(
        video: path,
        imageFormat: ImageFormat.JPEG,
        maxWidth: 360,
        quality: 75,
      );
    } catch (_) {
      return null;
    }
  }

  @override
  void onClose() {
    titleController.dispose();
    briefController.dispose();
    typeController.dispose();
    durationController.dispose();
    objectiveController.dispose();
    motivationalController.dispose();
    super.onClose();
  }
}
