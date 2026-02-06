import 'package:crowdfunding_platform/controller/core/constants/images_manager.dart';
import 'package:crowdfunding_platform/controller/core/routes/routes_manager.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:crowdfunding_platform/model/campaign_type.dart';

class CampaignStepThreeController extends GetxController {
  Map<String, dynamic> allData = {};

  @override
  void onInit() {
    super.onInit();
    // استلام بيانات الشاشتين (1 و 2)
    allData = Get.arguments ?? {};
    print("البيانات المستلمة في الشاشة 3: $allData");
  }

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

  final TextEditingController motivationalMessageController =
      TextEditingController();

  // State
  final RxBool isLoading = false.obs;
  final RxInt selectedTypeIndex = (-1).obs;
  final campaignTypes = <CampaignType>[].obs;

  /// Go to next step
  Future<void> goToNextStep() async {
    isLoading.value = true;

    try {
      // 1. تحديد تاريخ البداية (الآن) وتاريخ النهاية
      DateTime now = DateTime.now();
      DateTime calculatedEndDate;

      if (endDate.value.isNotEmpty) {
        // إذا اختار تاريخاً محدداً عبر الـ DatePicker
        // ملاحظة: نحتاج لتحويل النص المخزن في endDate.value لـ DateTime
        // أو استخدام المتغير 'picked' مباشرة إذا حفظناه.
        // للسهولة، سنعتمد على عدد الأيام المحسوب في selectedDuration
        calculatedEndDate = now.add(Duration(days: selectedDuration.value));
      } else {
        // إذا اختار 30، 60، أو 90 يوماً
        calculatedEndDate = now.add(Duration(days: selectedDuration.value));
      }

      // 2. دمج البيانات الجديدة في الماب
      allData['startDate'] = now.toIso8601String(); // الصيغة اللي بحبها الـ API
      allData['endDate'] = calculatedEndDate.toIso8601String();
      allData['motivationMessage'] = motivationalMessageController.text;

      // 3. الانتقال للشاشة الرابعة (شاشة المراجعة غالباً)
      Get.toNamed(RoutesManager.CampaignStepFourScreen, arguments: allData);

      currentStep.value++;
    } catch (e) {
      Get.snackbar('error'.tr, e.toString());
    } finally {
      isLoading.value = false;
    }
  }

  @override
  void onClose() {
    super.onClose();
  }

  // تعيين تاريخ انتهاء
  void setEndDate(String date) {
    endDate.value = date;
  }
}
