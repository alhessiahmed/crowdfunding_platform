import 'package:crowdfunding_platform/controller/getx/controllers/auth_validation_mixin.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../model/account_type.dart';
import '../../../core/routes/routes_manager.dart';

enum CampaignType {
  water,
  foodRelief,
  education,
  health,
  animals,
  shelter,
  environment,
}

enum ExperienceLevel { firstTime, someExperience, expert }

class CreatorOnboardingController extends GetxController
    with AuthValidationMixin {
  final step = 1.obs;
  final pageController = PageController();
  final currentPage = 0.obs;
  final totalSteps = 4;

  // Step 1
  final _accountType = AccountType.individual.obs;
  Rx<AccountType> get accountType => _accountType;
  // Step 2
  // final campaignType = CampaignType.medical.obs;
  final campaignTypes = <CampaignType>[].obs;
  // Step 3
  final experienceLevel = ExperienceLevel.firstTime.obs;

  /// Step 4
  final formKey = GlobalKey<FormState>();
  final nameController = TextEditingController();
  final countryController = TextEditingController();
  final cityController = TextEditingController();
  final companyNameController = TextEditingController();
  final websiteController = TextEditingController();

  void onPageChanged(int index) {
    currentPage.value = index;
  }

  void next() {
    if (!canProceed) return;

    if (currentPage.value < totalSteps - 1) {
      pageController.nextPage(
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeInOut,
      );
    }
  }

  bool get canProceed {
    switch (currentPage.value) {
      case 1:
        return campaignTypes.isNotEmpty;
      default:
        return true;
    }
  }

  double get progress => (currentPage.value + 1) / totalSteps;

  @override
  void onClose() {
    pageController.dispose();
    super.onClose();
  }

  void nextStep() {
    if (step.value < 4) step.value++;
  }

  void previous() {
    if (currentPage.value > 0) {
      pageController.previousPage(
        duration: Duration(milliseconds: 300),
        curve: Curves.easeInOut,
      );
    } else {
      Get.offAllNamed(RoutesManager.signUpScreen);
    }
  }

  void selectAccountType(AccountType type) {
    accountType.value = type;
  }

  void toggleCampaignType(CampaignType type) {
    if (campaignTypes.contains(type)) {
      campaignTypes.remove(type);
    } else {
      campaignTypes.add(type);
    }
  }

  bool isCampaignSelected(CampaignType type) {
    return campaignTypes.contains(type);
  }

  void selectExperience(ExperienceLevel level) {
    experienceLevel.value = level;
  }

  void finish() {
    if (!formKey.currentState!.validate()) return;
    Get.offAllNamed(RoutesManager.setupSuccessScreen);
  }
}
