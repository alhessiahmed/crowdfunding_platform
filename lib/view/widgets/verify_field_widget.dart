import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../controller/core/constants/colors_manager.dart';

class VerifyFieldWidget extends StatelessWidget {
  const VerifyFieldWidget({
    super.key,
    required this.codeController,
    required this.focusNode,
    required this.onChanged,
    this.autofocus = false,
  });

  final TextEditingController codeController;
  final FocusNode focusNode;
  final void Function(String)? onChanged;
  final bool autofocus;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 62.6.h,
      width: 56.w,
      child: TextFormField(
        controller: codeController,
        focusNode: focusNode,
        onChanged: onChanged,
        textInputAction: TextInputAction.next,
        keyboardType: TextInputType.number,
        style: Theme.of(context).textTheme.bodyLarge,
        textAlign: TextAlign.center,
        maxLength: 1,
        cursorColor: Theme.of(context).colorScheme.onSurface,
        autofocus: autofocus,
        decoration: InputDecoration(
          counterText: '',
          filled: true,
          fillColor: Get.isDarkMode
              ? ColorsManager.bgSectionDark
              : ColorsManager.bgSectionLight,
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(16.r),
            borderSide: const BorderSide(color: Colors.transparent),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(16.r),
            borderSide: const BorderSide(color: Colors.transparent),
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(16.r),
            borderSide: const BorderSide(color: Colors.transparent),
          ),
        ),
      ),
    );
  }
}
