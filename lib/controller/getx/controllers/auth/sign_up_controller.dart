import 'package:crowdfunding_platform/controller/getx/controllers/auth_validation_mixin.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import '../../../../model/sign_up_draft.dart';
import '../../../core/constants/colors_manager.dart';
import '../../../core/routes/routes_manager.dart';

class SignUpController extends GetxController with AuthValidationMixin {
  final firstNameController = TextEditingController();
  final lastNameController = TextEditingController();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final formKey = GlobalKey<FormState>();
  final passwordVisible = false.obs;
  final isRegistering = false.obs;
  final dobController = TextEditingController();
  DateTime? selectedDate;

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
              // confirmButtonStyle: ButtonStyle(
              //   foregroundColor: WidgetStateColor.resolveWith(
              //     (states) => ColorsManager.primaryCTA,
              //   ),
              // ),
              // cancelButtonStyle: ButtonStyle(
              //   // textStyle: ,
              //   foregroundColor: WidgetStateColor.resolveWith(
              //     (states) => ColorsManager.danger,
              //   ),
              // ),
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
      dobController.text = DateFormat('yyyy-MM-dd').format(selectedDate!);
    }
  }

  void submit() async {
    if (!formKey.currentState!.validate()) return;
    final draft = SignUpDraft(
      firstName: firstNameController.text.trim(),
      lastName: lastNameController.text.trim(),
      email: emailController.text.trim(),
      password: passwordController.text,
      dateOfBirth: selectedDate ?? DateTime.now(),
    );

    Get.toNamed(RoutesManager.userTypeSelectionScreen, arguments: draft);
  }

  @override
  void onClose() {
    firstNameController.dispose();
    lastNameController.dispose();
    emailController.dispose();
    passwordController.dispose();
    super.onClose();
  }
}
