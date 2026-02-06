import 'dart:io';
import 'package:crowdfunding_platform/controller/core/constants/images_manager.dart';
import 'package:crowdfunding_platform/controller/core/routes/routes_manager.dart';
import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class CampaignStepTwoController extends GetxController {
  Map<String, dynamic> allData = {};

  @override
  void onInit() {
    super.onInit();
    // استلام ما تم إرساله من الشاشة الأولى
    allData = Get.arguments ?? {};
    print("البيانات المستلمة من الشاشة 1: $allData");
  }

  final formKey = GlobalKey<FormState>();
  final ImagePicker _picker = ImagePicker();
  var currentStep = 2.obs;
  final selectedImage = Rx<File?>(null);
  String get FrameImage =>
      Get.isDarkMode ? ImagesManager.frameDark : ImagesManager.frameLight;

  void pickCampaignImage() async {
    // image picker logic
    final XFile? image = await _picker.pickImage(
      source: ImageSource.gallery, // يفتح الاستوديو
      imageQuality: 80, // لتقليل حجم الصورة قبل الرفع
    );

    if (image != null) {
      selectedImage.value = File(image.path);
      print("Image Path: ${image.path}");
    } else {
      print("No image selected.");
    }
  }

  void goToPreviousStep() {
    if (currentStep.value > 1) {
      currentStep.value--;
    }
    Get.back();
  }

  final TextEditingController descriptionController = TextEditingController();

  // State
  final RxBool isLoading = false.obs;
  final RxInt selectedTypeIndex = (-1).obs;

  /// Select campaign type
  void selectType(int index) {
    selectedTypeIndex.value = index;
  }

  /// Go to next step
  Future<void> goToNextStep() async {
    isLoading.value = true;

    try {
      // 2. تحديث الماب (allData) بالبيانات الجديدة
      // نستخدم نفس المفاتيح (Keys) المطلوبة في الـ API
      allData['notes'] = descriptionController.text; // الملاحظات

      // نمرر مسار الصورة (Path) لأنه أسهل في التمرير عبر الـ Arguments
      if (selectedImage.value != null) {
        allData['file_path'] = selectedImage.value!.path;
      }

      // 3. الانتقال للشاشة الثالثة مع الماب "المحدثة"
      Get.toNamed(
        RoutesManager.CampaignStepThreeScreen,
        arguments: allData, // أصبحت تحتوي على بيانات الشاشة 1 + الشاشة 2
      );

      currentStep.value++;
    } catch (e) {
      print("Error: $e");
    } finally {
      isLoading.value = false;
    }
  }

  @override
  void onClose() {
    descriptionController.dispose();
    super.onClose();
  }
}
