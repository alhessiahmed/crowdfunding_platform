import 'dart:io';
import 'package:crowdfunding_platform/controller/core/constants/images_manager.dart';
import 'package:crowdfunding_platform/controller/core/routes/routes_manager.dart';
import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class CampaignStepFourController extends GetxController {
  Map<String, dynamic> allData = {};

  @override
  void onInit() {
    super.onInit();
    // استلام كل البيانات المجمعة من الخطوات الثلاث السابقة
    allData = Get.arguments ?? {};
    print("All Data Ready for API: $allData");
  }

  String get editImage =>
      Get.isDarkMode ? ImagesManager.editDark : ImagesManager.editLight;

  var isAgreed = false.obs;

  // دالة تغيير الحالة
  void toggleAgreement() {
    isAgreed.value = !isAgreed.value;
  }

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
    // تحقق من شروط الموافقة قبل الإرسال
    if (!isAgreed.value) {
      Get.snackbar('تنبيه', 'يجب الموافقة على الشروط والأحكام');
      return;
    }

    isLoading.value = true;

    try {
      // 1. تجهيز الرابط (URL)
      var uri = Uri.parse(
        'https://gsg-project-group-2-production.up.railway.app/api/v1/campaign',
      ); // استبدله بالرابط الحقيقي
      var request = http.MultipartRequest('POST', uri);

      // 2. إضافة الحقول النصية (Fields) من الماب allData
      request.fields['title'] = allData['title'] ?? '';
      request.fields['description'] = allData['description'] ?? '';
      request.fields['category'] = allData['category'] ?? '';
      request.fields['goal'] = (allData['goal'] ?? 0).toString();
      request.fields['startDate'] = allData['startDate'] ?? '';
      request.fields['endDate'] = allData['endDate'] ?? '';
      request.fields['motivationMessage'] = allData['motivationMessage'] ?? '';
      request.fields['notes'] = allData['notes'] ?? '';
      request.fields['likes'] = "0"; // القيمة الافتراضية

      // 3. إضافة ملف الصورة (Binary File) باستخدام المسار اللي خزنّاه
      if (allData['file_path'] != null) {
        String path = allData['file_path'];
        request.files.add(
          await http.MultipartFile.fromPath(
            'file', // اسم الحقل المطلوب في الـ API
            path,
          ),
        );
      }

      // 4. إضافة الـ Headers (إذا كان السيرفر يطلب توكن)
      request.headers.addAll({
        'Accept': 'application/json',
        // 'Authorization': 'Bearer YOUR_TOKEN',
      });

      // 5. إرسال الطلب واستلام الرد
      var streamedResponse = await request.send();
      var response = await http.Response.fromStream(streamedResponse);

      // 6. التحقق من النتيجة
      if (response.statusCode == 200 || response.statusCode == 201) {
        // نجاح! الانتقال لشاشة النجاح (Step 5)
        currentStep.value++;
        Get.toNamed(RoutesManager.CampaignStepFiveScreen);
      } else {
        // فشل! عرض رسالة الخطأ من السيرفر
        print("Server Error: ${response.body}");
        Get.snackbar('خطأ', 'فشل في إرسال الحملة للمراجعة');
      }
    } catch (e) {
      print("Network Error: $e");
      Get.snackbar('خطأ', 'تأكد من اتصالك بالإنترنت');
    } finally {
      isLoading.value = false;
    }
  }

  int getCampaignDuration() {
    if (allData['startDate'] != null && allData['endDate'] != null) {
      DateTime start = DateTime.parse(allData['startDate']);
      DateTime end = DateTime.parse(allData['endDate']);
      return end.difference(start).inDays;
    }
    return 30; // قيمة افتراضية في حال عدم التوفر
  }

  @override
  void onClose() {
    campaignNameController.dispose();
    descriptionController.dispose();
    super.onClose();
  }
}
