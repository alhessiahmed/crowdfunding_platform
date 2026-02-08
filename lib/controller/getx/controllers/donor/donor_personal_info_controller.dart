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
}
