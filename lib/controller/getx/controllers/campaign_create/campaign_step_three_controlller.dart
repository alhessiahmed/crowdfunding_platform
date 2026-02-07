import 'package:crowdfunding_platform/controller/core/constants/images_manager.dart';
import 'package:crowdfunding_platform/controller/core/routes/routes_manager.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:crowdfunding_platform/model/campaign_type.dart';

class CampaignStepThreeController extends GetxController {
  String get calendarImage =>
      Get.isDarkMode ? ImagesManager.calendarDark : ImagesManager.calendarLight;
  String get staryImage =>
      Get.isDarkMode ? ImagesManager.staryDark : ImagesManager.staryLight;
  // القائمة فيها 3 أرقام + الخيار الرابع "تحديد تاريخ"
  final List<dynamic> durations = [30, 60, 90, 'تحديد تاريخ انتهاء الحملة'];

  // dynamic لأن ممكن يكون int أو String
  var selectedDuration = 30.obs;

  var endDate = ''.obs; // لتاريخ الانتهاء إذا اختار المستخدم

  void selectDuration(dynamic value) async {
    if (value is int) {
      selectedDuration.value = value;
      endDate.value = ''; // إعادة تعيين التاريخ لو اختار رقم
    } else if (value is String && value == 'تحديد تاريخ انتهاء الحملة') {
      // فتح DatePicker
      DateTime? picked = await showDatePicker(
        context: Get.context!,
        initialDate: DateTime.now(),
        firstDate: DateTime.now(),
        lastDate: DateTime(2100),
      );
      if (picked != null) {
        endDate.value = '${picked.month}/${picked.day}/${picked.year}';
        // حساب الفرق بين التاريخ المختار والتاريخ الحالي
        final today = DateTime.now();
        final diff = picked.difference(today).inDays;

        selectedDuration.value = diff > 0 ? diff : 0; // عدد الأيام
      }
    }
  }

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

    Get.toNamed(RoutesManager.CampaignStepFourScreen);
  }

  @override
  void onClose() {
    campaignNameController.dispose();
    descriptionController.dispose();
    super.onClose();
  }

  // تعيين تاريخ انتهاء
  void setEndDate(String date) {
    endDate.value = date;
  }
}
