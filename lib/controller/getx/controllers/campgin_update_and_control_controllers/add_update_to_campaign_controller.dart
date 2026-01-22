import 'package:crowdfunding_platform/controller/core/constants/images_manager.dart';
import 'package:crowdfunding_platform/controller/core/utils/show_snackbar.dart';
import 'package:crowdfunding_platform/model/control_campaign.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:flutter/material.dart';

enum UpdateMediaType { image, video }

class AddUpdateToCampaignController extends GetxController {
  final formKey = GlobalKey<FormState>();
  final titleController = TextEditingController();
  final contentController = TextEditingController();

  final Rxn<XFile> selectedFile = Rxn<XFile>();
  final Rxn<UpdateMediaType> selectedMediaType = Rxn<UpdateMediaType>();

  late final CampaignSummary summary;
  final ImagePicker _picker = ImagePicker();

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
  }

  Future<void> pickImage() async {
    final file = await _picker.pickImage(
      source: ImageSource.gallery,
      imageQuality: 85,
    );
    if (file == null) {
      return;
    }
    selectedFile.value = file;
    selectedMediaType.value = UpdateMediaType.image;
  }

  Future<void> pickVideo() async {
    final file = await _picker.pickVideo(source: ImageSource.gallery);
    if (file == null) {
      return;
    }
    selectedFile.value = file;
    selectedMediaType.value = UpdateMediaType.video;
  }

  Future<void> pickMedia() async {
    final file = await _picker.pickMedia();
    if (file == null) {
      return;
    }
    selectedFile.value = file;
    final extension = file.path.split('.').last.toLowerCase();
    if (extension == 'mp4' || extension == 'mov' || extension == 'mkv') {
      selectedMediaType.value = UpdateMediaType.video;
    } else {
      selectedMediaType.value = UpdateMediaType.image;
    }
  }

  void clearMedia() {
    selectedFile.value = null;
    selectedMediaType.value = null;
  }

  void publish() {
    if (titleController.text.trim().isEmpty ||
        contentController.text.trim().isEmpty) {
      showSnackbar(
        message: 'Fill_required_fields'.tr,
        success: false,
      );
      return;
    }
    showSnackbar(message: 'Update_published'.tr);
  }

  void validateAndPublish() {
    final isValid = formKey.currentState?.validate() ?? false;
    if (!isValid) {
      return;
    }
    publish();
  }

  void onBack() {
    Get.back();
  }

  @override
  void onClose() {
    titleController.dispose();
    contentController.dispose();
    super.onClose();
  }
}
