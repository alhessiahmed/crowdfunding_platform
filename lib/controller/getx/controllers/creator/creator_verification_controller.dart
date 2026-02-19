import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:intl/intl.dart';

import '../../../../model/account_type.dart';
import '../../../core/routes/routes_manager.dart';

enum Bank { palestine }

class CreatorVerificationController extends GetxController {
  final step = 1.obs;
  final pageController = PageController();
  final currentPage = 0.obs;
  final totalSteps = 3;

  /// Step 1
  final accountType = AccountType.individual.obs;

  /// Step 2
  final idFormKey = GlobalKey<FormState>();
  final nameController = TextEditingController();
  final idController = TextEditingController();
  final isId = true.obs;
  final Rxn<XFile> frontId = Rxn<XFile>();
  final Rxn<XFile> backId = Rxn<XFile>();
  final Rxn<XFile> selfieWithId = Rxn<XFile>();
  final ImagePicker _imagePicker = ImagePicker();

  /// Step 2 (organization)
  final institutionFormKey = GlobalKey<FormState>();
  final institutionController = TextEditingController();
  final licenseController = TextEditingController();
  final dateController = TextEditingController();
  DateTime? selectedDate;
  final Rxn<XFile> licenseImg = Rxn<XFile>();
  final Rxn<XFile> orgIdImg = Rxn<XFile>();
  final Rxn<XFile> authorizationImg = Rxn<XFile>();
  final Rxn<XFile> personalImg = Rxn<XFile>();
  bool get hasInstitutionFiles =>
      licenseImg.value != null &&
      orgIdImg.value != null &&
      authorizationImg.value != null &&
      personalImg.value != null;

  /// Step 3
  final bankFormKey = GlobalKey<FormState>();
  final accHolderController = TextEditingController();
  final ibanController = TextEditingController();
  final bank = Bank.palestine.obs;

  void onPageChanged(int index) {
    currentPage.value = index;
  }

  void next() {
    if (accountType.value == AccountType.organization && currentPage.value == 1) {
      final isValid = institutionFormKey.currentState?.validate() ?? false;
      if (!isValid || !hasInstitutionFiles) return;
    }

    if (currentPage.value < totalSteps - 1) {
      pageController.nextPage(
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeInOut,
      );
    }
  }

  void previous() {
    print(currentPage.value);

    if (currentPage.value > 0) {
      pageController.previousPage(
        duration: Duration(milliseconds: 300),
        curve: Curves.easeInOut,
      );
    }
  }

  void selectId(bool isId) {
    this.isId.value = isId;
  }

  String? requiredField(String? value, String fieldName) {
    if (value == null || value.trim().isEmpty) {
      return '$fieldName is required';
    }
    return null;
  }

  void pickDate() async {
    selectedDate = await showDatePicker(
      context: Get.context!,
      initialDate: DateTime.now(),
      firstDate: DateTime(1900),
      lastDate: DateTime.now(),
    );
    if (selectedDate != null) {
      dateController.text = DateFormat('yyyy-MM-dd').format(selectedDate!);
    }
  }

  // bool canSubmit() {
  //   switch (currentPage.value) {
  //     case 0:
  //       if (frontId.value != null &&
  //           backId.value != null &&
  //           selfieWithId.value != null) {
  //         return true;
  //       }else{
  //         return false;
  //       }
  //     default:
  //       return true;
  //   }
  // }

  /// Pick image (gallery or camera)
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

  @override
  void onClose() {
    pageController.dispose();
    nameController.dispose();
    idController.dispose();
    accHolderController.dispose();
    ibanController.dispose();
    institutionController.dispose();
    licenseController.dispose();
    dateController.dispose();
    super.onClose();
  }

  void selectAccountType(AccountType type) {
    accountType.value = type;
  }

  void selectBank(Bank bank) {
    this.bank.value = bank;
  }

  void finish() {
    // if (!formKey.currentState!.validate()) return;
    Get.offAllNamed(RoutesManager.creatorVerificationSuccessScreen);
  }

  double get progress => (currentPage.value + 1) / totalSteps;
}
