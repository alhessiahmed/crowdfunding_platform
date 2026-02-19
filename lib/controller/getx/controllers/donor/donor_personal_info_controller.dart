import 'dart:io';
import 'package:country_picker/country_picker.dart';
import 'package:crowdfunding_platform/controller/api/api_controllers/donor_api_controller.dart';
import 'package:crowdfunding_platform/model/api_response.dart';
import 'package:crowdfunding_platform/controller/shared_pref/shared_pref_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

class DonorPersonalInfoController extends GetxController {
  final DonorApiController _donorApiController = DonorApiController();
  final formKey = GlobalKey<FormState>();
  final fNameController = TextEditingController();
  final lNameController = TextEditingController();
  final emailController = TextEditingController();
  final countryController = TextEditingController();
  final cityController = TextEditingController();
  final Rxn<XFile> img = Rxn<XFile>();
  final ImagePicker _imagePicker = ImagePicker();

  final phoneController = TextEditingController();
  final selectedCountry = CountryParser.parseCountryCode('PS').obs;
  final isSaving = false.obs;

  @override
  void onInit() {
    super.onInit();
    _fillFromSharedPrefs();
  }

  void _fillFromSharedPrefs() {
    final user = SharedPrefController().user;
    if (user == null) return;

    fNameController.text = (user['firstName'] ?? '').toString();
    lNameController.text = (user['lastName'] ?? '').toString();
    emailController.text = (user['email'] ?? '').toString();

    final String location = (user['country'] ?? '').toString();
    if (location.isNotEmpty) {
      final List<String> parts = location.split('/');
      countryController.text = parts.isNotEmpty ? parts.first.trim() : '';
      cityController.text = parts.length > 1 ? parts[1].trim() : '';
    }

    final String phone = (user['phoneNumber'] ?? user['phone'] ?? '')
        .toString();
    if (phone.isNotEmpty) {
      // Keep only local part in the field when number is saved with +countryCode.
      phoneController.text = phone.replaceFirst(RegExp(r'^\+\d{1,4}'), '');
    }
  }

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

  Future<ApiResponse<Map<String, dynamic>>> updateDonorProfile() async {
    final user = SharedPrefController().user;
    final userId = user?['id'] as String?;
    if (userId == null || userId.isEmpty) {
      return ApiResponse<Map<String, dynamic>>(
        success: false,
        message: 'User not found',
        statusCode: 400,
      );
    }
    final String countrCity =
        '${countryController.text.trim().isEmpty ? '' : countryController.text} / ${cityController.text.trim().isEmpty ? '' : cityController.text}';
    return _donorApiController.patchDonorMultipart(
      id: userId,
      firstName: fNameController.text.trim().isEmpty
          ? null
          : fNameController.text,
      lastName: lNameController.text.trim().isEmpty
          ? null
          : lNameController.text,
      email: emailController.text.trim().isEmpty ? null : emailController.text,
      phoneNumber: phoneController.text.trim().isEmpty ? null : fullPhoneNumber,
      country: countrCity,
      selfieWithId: img.value != null ? File(img.value!.path) : null,
    );
  }

  Future<void> saveChanges() async {
    if (isSaving.value) return;
    isSaving.value = true;

    final response = await updateDonorProfile();
    print(response.object);
    if (!response.success) {
      isSaving.value = false;
      Get.snackbar('Error', response.message);
      return;
    }

    final Map<String, dynamic> currentUser = Map<String, dynamic>.from(
      SharedPrefController().user ?? <String, dynamic>{},
    );
    final Map<String, dynamic> res = response.object ?? <String, dynamic>{};
    final dynamic data = res['data'];

    Map<String, dynamic> updatedUser = <String, dynamic>{};
    if (data is Map<String, dynamic> && data['user'] is Map<String, dynamic>) {
      updatedUser = Map<String, dynamic>.from(
        data['user'] as Map<String, dynamic>,
      );
    } else if (res['user'] is Map<String, dynamic>) {
      updatedUser = Map<String, dynamic>.from(
        res['user'] as Map<String, dynamic>,
      );
    } else if (data is Map<String, dynamic> && data['firstName'] != null) {
      updatedUser = Map<String, dynamic>.from(data);
    }

    final merged = <String, dynamic>{
      ...currentUser,
      ...updatedUser,
      'firstName': fNameController.text.trim(),
      'lastName': lNameController.text.trim(),
      'email': emailController.text.trim(),
      'country':
          '${countryController.text.trim().isEmpty ? '' : countryController.text.trim()} / ${cityController.text.trim().isEmpty ? '' : cityController.text.trim()}',
      'phoneNumber': phoneController.text.trim().isEmpty
          ? (currentUser['phoneNumber'] ?? currentUser['phone'])
          : fullPhoneNumber,
    };

    await SharedPrefController().saveUser(merged);
    isSaving.value = false;
    Get.snackbar('Success', response.message);
    Get.back();
  }
}
