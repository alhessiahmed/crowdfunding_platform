import 'package:crowdfunding_platform/controller/core/routes/routes_manager.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:crowdfunding_platform/model/campaign_type.dart';

class CampaignStepOneController extends GetxController {
  final formKey = GlobalKey<FormState>();
  var currentStep = 1.obs;
  var totalSteps = 4;

  void goToPreviousStep() {
    currentStep.value--;

    Get.back();
  }

  // Controllers
  final TextEditingController campaignNameController = TextEditingController();
  final TextEditingController descriptionController = TextEditingController();
  final TextEditingController campaignGoalController = TextEditingController();

  // State
  final RxBool isLoading = false.obs;
  final RxInt selectedTypeIndex = (-1).obs;
  final campaignTypes = <CampaignType>[].obs;

  /// Select campaign type
  void selectType(int index) {
    selectedTypeIndex.value = index;
  }

  bool isCampaignSelected(CampaignType type) {
    return campaignTypes.contains(type);
  }

  void toggleCampaignType(CampaignType type) {
    if (campaignTypes.contains(type)) {
      campaignTypes.remove(type);
    } else {
      campaignTypes.add(type);
    }
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

    Get.toNamed(RoutesManager.CampaignStepTwoScreen);
  }

  @override
  void onClose() {
    campaignNameController.dispose();
    descriptionController.dispose();
    super.onClose();
  }
}
