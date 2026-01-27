import 'package:country_picker/country_picker.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

class DonorPersonalInfoController extends GetxController {
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
}
