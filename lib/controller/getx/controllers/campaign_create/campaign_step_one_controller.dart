import 'package:crowdfunding_platform/controller/core/routes/routes_manager.dart';
import 'package:crowdfunding_platform/controller/getx/controllers/auth/creator_onboarding_controller.dart';
import 'package:crowdfunding_platform/view/screens/campaign_create_screens/campaign_step_one_screen.dart';
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

  /// Select campaign type
  void selectType(int index) {
    selectedTypeIndex.value = index;
  }

  /// Go to next step
  Future<void> goToNextStep() async {
    // 1. التحقق البسيط
    if (campaignNameController.text.isEmpty) {
      Get.snackbar('error'.tr, 'title_required'.tr);
      return;
    }
    final CreatorOnboardingController controller2 =
        Get.find<CreatorOnboardingController>();
    final selectedItem = CampaignStepOneScreen.items.firstWhere(
      (item) => controller2.isCampaignSelected(item.type),
      orElse: () => CampaignStepOneScreen
          .items
          .first, // عنصر افتراضي في حال لم يتم الاختيار
    );

    // 2. ترجمة النص المخصص لهذا العنصر
    String categoryName = selectedItem.labelKey.tr;

    // 2. تجهيز ماب البيانات (الحصيلة من الشاشة الأولى)
    Map<String, dynamic> stepOneData = {
      'title': campaignNameController.text,
      'description': descriptionController.text,
      'goal': campaignGoalController.text,
      'category': categoryName,
    };

    // 3. الانتقال وتمرير البيانات
    Get.toNamed(
      RoutesManager.CampaignStepTwoScreen,
      arguments: stepOneData, // تمرير الماب
    );

    currentStep.value++;
  }

  @override
  void onClose() {
    campaignNameController.dispose();
    descriptionController.dispose();
    super.onClose();
  }
}
