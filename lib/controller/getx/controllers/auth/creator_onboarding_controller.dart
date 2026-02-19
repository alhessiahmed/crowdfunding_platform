import 'package:crowdfunding_platform/controller/getx/controllers/auth_validation_mixin.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:intl/intl.dart';

import '../../../../model/sign_up_draft.dart';
import '../../../../model/account_type.dart';
import '../../../api/api_controllers/auth_api_controller.dart';
import '../../../core/constants/colors_manager.dart';
import '../../../core/routes/routes_manager.dart';
import '../../../shared_pref/shared_pref_controller.dart';

enum CampaignType {
  water,
  foodRelief,
  education,
  health,
  animals,
  shelter,
  environment,
}

enum Bank { palestine }

enum ExperienceLevel { firstTime, someExperience, expert }

class CreatorOnboardingController extends GetxController
    with AuthValidationMixin {
  final _authApi = AuthApiController();
  SignUpDraft? _draft;
  final isRegistering = false.obs;
  final step = 1.obs;
  final pageController = PageController();
  final currentPage = 0.obs;
  int get totalSteps => accountType.value == AccountType.organization ? 3 : 4;

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

  // institution case step 2
  final institutionFormKey = GlobalKey<FormState>();
  final institutionController = TextEditingController();
  final licenseController = TextEditingController();
  final dateController = TextEditingController();
  DateTime? selectedDate;
  final ImagePicker _imagePicker = ImagePicker();
  final Rxn<XFile> licenseImg = Rxn<XFile>();
  final Rxn<XFile> idImg = Rxn<XFile>();
  final Rxn<XFile> authorizationImg = Rxn<XFile>();
  final Rxn<XFile> personalImg = Rxn<XFile>();

  bool get hasInstitutionFiles =>
      licenseImg.value != null &&
      idImg.value != null &&
      authorizationImg.value != null &&
      personalImg.value != null;

  // institution case step 3
  final bankFormKey = GlobalKey<FormState>();
  final accHolderController = TextEditingController();
  final ibanController = TextEditingController();
  final bank = Bank.palestine.obs;
  void selectBank(Bank bank) {
    this.bank.value = bank;
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

  void pickDate() async {
    selectedDate = await showDatePicker(
      builder: (context, child) {
        return Theme(
          data: Theme.of(context).copyWith(
            datePickerTheme: DatePickerThemeData(
              headerBackgroundColor: ColorsManager.primaryCTA,
              headerForegroundColor: ColorsManager.white,
              dayOverlayColor: WidgetStateColor.resolveWith(
                (states) => ColorsManager.primaryCTA,
              ),
              dayBackgroundColor: WidgetStateProperty.resolveWith((states) {
                if (states.contains(WidgetState.selected)) {
                  return ColorsManager.primaryCTA;
                }
                return null;
              }),
              dayForegroundColor: WidgetStateProperty.resolveWith((states) {
                if (states.contains(WidgetState.selected)) {
                  return Colors.white;
                }
                return null;
              }),
              todayBackgroundColor: WidgetStateProperty.resolveWith((states) {
                if (states.contains(WidgetState.selected)) {
                  return ColorsManager.primaryCTA;
                }
                return null;
              }),
              weekdayStyle: Theme.of(
                context,
              ).textTheme.bodyLarge!.copyWith(fontSize: 14.sp),
              dayStyle: Theme.of(
                context,
              ).textTheme.bodyMedium!.copyWith(fontSize: 14.sp),
              yearStyle: Theme.of(
                context,
              ).textTheme.bodyLarge!.copyWith(fontSize: 14.sp),
            ),
          ),
          child: child!,
        );
      },
      context: Get.context!,
      initialDate: DateTime.now(),
      firstDate: DateTime(1900),
      lastDate: DateTime.now(),
    );
    if (selectedDate != null) {
      dateController.text = DateFormat('yyyy-MM-dd').format(selectedDate!);
    }
  }

  void onPageChanged(int index) {
    currentPage.value = index;
  }

  @override
  void onInit() {
    super.onInit();
    final args = Get.arguments;
    if (args is SignUpDraft) {
      _draft = args;
    }
  }

  void next() {
    if (!canProceed) return;
    if (accountType.value == AccountType.organization &&
        currentPage.value == 1) {
      final isValid = institutionFormKey.currentState?.validate() ?? false;
      if (!isValid) return;
    }

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
        return accountType.value == AccountType.organization
            ? true
            : campaignTypes.isNotEmpty;
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
    if (step.value < totalSteps) step.value++;
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
    if (currentPage.value > totalSteps - 1) {
      pageController.jumpToPage(totalSteps - 1);
      currentPage.value = totalSteps - 1;
    }
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

  Future<void> finish() async {
    if (accountType.value == AccountType.organization) {
      final institutionValid = institutionFormKey.currentState?.validate() ?? false;
      if (!institutionValid || !hasInstitutionFiles) {
        Get.snackbar('Error', 'Please complete institution information');
        return;
      }
    } else {
      if (!formKey.currentState!.validate()) return;
    }

    if (_draft == null) {
      Get.snackbar('Error', 'Missing signup info, please register again');
      print('registerCreator aborted: SignUpDraft is null');
      return;
    }

    if (isRegistering.value) return;

    final String creatorType = accountType.value == AccountType.individual
        ? 'INDIVIDSUAL'
        : 'INSTITUTION';

    isRegistering.value = true;
    final response = await _authApi.registerCreator(
      firstName: _draft!.firstName,
      lastName: _draft!.lastName,
      email: _draft!.email,
      password: _draft!.password,
      dateOfBirth: _draft!.dateOfBirth,
      type: creatorType,
    );
    isRegistering.value = false;

    print('registerCreator parsed success: ${response.success}');
    print('registerCreator parsed statusCode: ${response.statusCode}');
    print('registerCreator parsed message: ${response.message}');
    print('registerCreator parsed token: ${response.object?.token}');
    print('registerCreator parsed user: ${response.object?.user.toJson()}');

    if (!response.success || response.object == null) {
      Get.snackbar('Error', response.message);
      return;
    }

    final auth = response.object!;
    await SharedPrefController().saveToken(auth.token);
    await SharedPrefController().saveUser(auth.user.toJson());

    Get.offAllNamed(RoutesManager.setupSuccessScreen);
  }
}
