import 'package:get/get.dart';

mixin AuthValidationMixin {
  String? requiredField(String? value, String fieldName) {
    if (value == null || value.trim().isEmpty) {
      return '${fieldName.tr} ${'required'.tr}';
    }
    return null;
  }

  String? email(String? value) {
    if (value == null || value.isEmpty) {
      return 'email_required'.tr;
    }
    if (!GetUtils.isEmail(value)) {
      return 'invalid_email'.tr;
    }
    return null;
  }

  String? password(String? value) {
    if (value == null || value.isEmpty) {
      return 'password_required'.tr;
    }
    if (value.length < 8) {
      return 'password_too_short'.tr;
    }
    return null;
  }

  String? confirmPassword(String? value, String original) {
    if (value != original) {
      return 'passwords_not_match'.tr;
    }
    return null;
  }
}
