import 'dart:async';
import 'dart:io';
import 'package:country_picker/country_picker.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:crowdfunding_platform/controller/api/api_controllers/donor_api_controller.dart';
import 'package:crowdfunding_platform/model/api_response.dart';
import '../../../core/routes/routes_manager.dart';
import '../../../shared_pref/shared_pref_controller.dart';

class DonorVerificationController extends GetxController {
  final DonorApiController _donorApiController = DonorApiController();
  final step = 1.obs;
  final pageController = PageController();
  final currentPage = 0.obs;
  final totalSteps = 4;
  final isLoading = false.obs;

  /// Step 1
  /// Variables
  final emailController = TextEditingController();
  final verificationSent = false.obs;
  final firstCodeTextController = TextEditingController();
  final secondCodeTextController = TextEditingController();
  final thirdCodeTextController = TextEditingController();
  final fourthCodeTextController = TextEditingController();
  final fifthCodeTextController = TextEditingController();
  final firstFocusNode = FocusNode();
  final secondFocusNode = FocusNode();
  final thirdFocusNode = FocusNode();
  final fourthFocusNode = FocusNode();
  final fifthFocusNode = FocusNode();
  final code = ''.obs;
  late Timer timer;
  final counter = 0.obs;

  /// Functions
  void sendVerification() {
    if (emailController.value.text.isNotEmpty) {
      verificationSent.value = true;
      setTimer();
    }
  }

  void updateCode() {
    code.value =
        firstCodeTextController.text +
        secondCodeTextController.text +
        thirdCodeTextController.text +
        fourthCodeTextController.text +
        fifthCodeTextController.text;
  }

  void setTimer() {
    counter(30);
    timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      if (counter.value == 0) {
        timer.cancel();
      } else {
        counter.value--;
      }
    });
  }

  // Step 2
  final codeSent = false.obs;
  final phoneController = TextEditingController();
  final selectedCountry = CountryParser.parseCountryCode('PS').obs;
  void pickCountry() {
    showCountryPicker(
      context: Get.context!,
      showPhoneCode: false,
      onSelect: (Country country) {
        selectedCountry.value = country;
      },
    );
  }

  bool validatePhone() {
    return phoneController.text.trim().length >= 7;
  }

  String get fullPhoneNumber =>
      '+${selectedCountry.value.phoneCode}${phoneController.text.trim()}';
  final mobileFirstCodeTextController = TextEditingController();
  final mobileSecondCodeTextController = TextEditingController();
  final mobileThirdCodeTextController = TextEditingController();
  final mobileFourthCodeTextController = TextEditingController();
  final mobileFifthCodeTextController = TextEditingController();
  final mobileFirstFocusNode = FocusNode();
  final mobileSecondFocusNode = FocusNode();
  final mobileThirdFocusNode = FocusNode();
  final mobileFourthFocusNode = FocusNode();
  final mobileFifthFocusNode = FocusNode();
  final mobileCode = ''.obs;
  late Timer mobileTimer;
  final mobileCounter = 0.obs;
  void sendMobileVerification() {
    if (phoneController.value.text.isNotEmpty) {
      codeSent.value = true;
      setMobileTimer();
    }
  }

  void updateMobileCode() {
    mobileCode.value =
        mobileFirstCodeTextController.text +
        mobileSecondCodeTextController.text +
        mobileThirdCodeTextController.text +
        mobileFourthCodeTextController.text +
        mobileFifthCodeTextController.text;
  }

  void setMobileTimer() {
    mobileCounter(30);
    mobileTimer = Timer.periodic(const Duration(seconds: 1), (timer) {
      if (mobileCounter.value == 0) {
        timer.cancel();
      } else {
        mobileCounter.value--;
      }
    });
  }

  // Step 3
  final idFormKey = GlobalKey<FormState>();
  final nameController = TextEditingController();
  final idController = TextEditingController();
  final isId = true.obs;
  final Rxn<XFile> idFile = Rxn<XFile>();
  final ImagePicker _imagePicker = ImagePicker();

  void selectId(bool isId) {
    this.isId.value = isId;
  }

  Future<void> pickImage({
    required ImageSource source,
    required Rxn<XFile> target,
  }) async {
    final XFile? image = await _imagePicker.pickImage(
      source: source,
      imageQuality: 85,
    );

    if (image != null) {
      target.value = image;
      print('img saved successfully');
    }
  }
  // Step 4

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
      case 0:
        return verificationSent.value && code.isNotEmpty;
      case 1:
        return codeSent.value && mobileCode.isNotEmpty;
      default:
        return true;
    }
  }

  void previous() {
    if (currentPage.value > 0) {
      pageController.previousPage(
        duration: Duration(milliseconds: 300),
        curve: Curves.easeInOut,
      );
    } else {
      Get.back();
    }
  }

  double get progress => (currentPage.value + 1) / totalSteps;

  @override
  void onClose() {
    pageController.dispose();
    super.onClose();
  }

  void finish() async {
    if (!idFormKey.currentState!.validate()) return;
    isLoading(true);
    final response = await verifyDonor();
    isLoading(false);
    if (response.success) {
      Get.offAllNamed(RoutesManager.donorVerificationSuccessScreen);
    } else {
      Get.showSnackbar(
        GetSnackBar(message: response.message, duration: Duration(seconds: 2)),
      );
    }
  }

  Future<ApiResponse<Map<String, dynamic>>> verifyDonor() async {
    final user = SharedPrefController().user;
    final userId = user?['id'] as String?;
    print(userId);
    if (userId == null || userId.isEmpty) {
      return ApiResponse<Map<String, dynamic>>(
        success: false,
        message: 'User not found',
        statusCode: 400,
      );
    }
    return _donorApiController.patchDonorMultipart(
      id: userId,
      email: emailController.text.trim().isEmpty
          ? null
          : emailController.text.trim(),
      phoneNumber: phoneController.text.trim().isEmpty ? null : fullPhoneNumber,
      country: selectedCountry.value.name,
      fullNameOnId: nameController.text.trim().isEmpty
          ? null
          : nameController.text.trim(),
      idNumber: idController.text.trim().isEmpty
          ? null
          : idController.text.trim(),
      idFront: idFile.value != null ? File(idFile.value!.path) : null,
    );
  }
}
