import 'dart:io';
import 'package:crowdfunding_platform/controller/core/constants/images_manager.dart';
import 'package:crowdfunding_platform/controller/core/routes/routes_manager.dart';
import 'package:get/get.dart';
import 'package:flutter/material.dart';

class CampaignStepTwoController extends GetxController {
  final formKey = GlobalKey<FormState>();
  var currentStep = 2.obs;
  final selectedImage = Rx<File?>(null);
  String get FrameImage =>
      Get.isDarkMode ? ImagesManager.frameDark : ImagesManager.frameLight;

  void pickCampaignImage() async {
    // image picker logic
  }

  void goToPreviousStep() {
    if (currentStep.value > 1) {
      currentStep.value--;
    }
    Get.back();
  }

  // Controllers
  final TextEditingController campaignNameController = TextEditingController();
  final TextEditingController descriptionController = TextEditingController();
  final TextEditingController campaignGoalController = TextEditingController();

  // State
  final RxBool isLoading = false.obs;
  final RxInt selectedTypeIndex = (-1).obs;

  /// Select campaign type
  void selectType(int index) {
    selectedTypeIndex.value = index;
  }

  /// Go to next step
  Future<void> goToNextStep() async {
    /*if (!formKey.currentState!.validate()) return;

    if (selectedTypeIndex.value == -1) {
      Get.snackbar('error'.tr, 'select_campaign_type'.tr);
      return;
    }*/

    isLoading.value = true;

    await Future.delayed(const Duration(seconds: 1)); // API later

    isLoading.value = false;
    currentStep.value++;

    Get.toNamed(RoutesManager.CampaignStepThreeScreen);
  }

  @override
  void onClose() {
    campaignNameController.dispose();
    descriptionController.dispose();
    super.onClose();
  }
}
