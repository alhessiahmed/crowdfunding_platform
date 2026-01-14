import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import '../../controller/core/constants/colors_manager.dart';

class TextFieldWidget extends StatelessWidget {
  const TextFieldWidget({
    Key? key,
    required this.controller,
    required this.hintText,
    this.suffixIcon,
    this.prefixIcon,
    this.textInputAction = TextInputAction.next,
    this.keyboardType = TextInputType.text,
    this.isPassword = false,
    this.isPhone = false,
    this.obscureText = false,
    this.maxLines = 1,
    this.minLines = 1,
    this.onChange,
    this.onEditingComplete,
    this.onSubmitted,
    required this.label,
  }) : super(key: key);
  final String label;
  final TextEditingController controller;
  final Widget? suffixIcon;
  final Widget? prefixIcon;
  final String hintText;
  final TextInputAction textInputAction;
  final TextInputType keyboardType;
  final bool isPassword;
  final bool isPhone;
  final bool obscureText;
  final int maxLines;
  final int minLines;
  final Function(String)? onChange;
  final Function()? onEditingComplete;
  final Function(String)? onSubmitted;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: Theme.of(
            context,
          ).textTheme.bodyLarge!.copyWith(fontSize: 12.sp),
        ),
        SizedBox(height: 4.h),
        SizedBox(
          height: 56.h,
          child: TextFormField(
            controller: controller,
            autovalidateMode: AutovalidateMode.onUserInteraction,
            validator: (value) {
              return null;
            },
            style: Theme.of(context).textTheme.bodyLarge!.copyWith(
              fontSize: 12.sp,
              color: Theme.of(context).colorScheme.onSurfaceVariant,
            ),
            textInputAction: textInputAction,
            keyboardType: isPhone ? TextInputType.phone : keyboardType,
            obscureText: obscureText,
            onChanged: onChange,
            onFieldSubmitted: onSubmitted,
            // minLines: null,
            // maxLines: null,
            // expands: true,
            decoration: InputDecoration(
              contentPadding: EdgeInsets.symmetric(
                vertical: 22.h,
                horizontal: 16.w,
              ),

              hintText: hintText,
              hintStyle: Theme.of(context).textTheme.bodyLarge!.copyWith(
                fontSize: 12.sp,
                color: Theme.of(context).colorScheme.onSurfaceVariant,
              ),
              suffixIcon: suffixIcon,
              errorStyle: const TextStyle(height: 0),
              helperStyle: const TextStyle(height: 0),
              filled: true,
              fillColor: Get.isDarkMode
                  ? ColorsManager.bgSectionDark
                  : ColorsManager.bgSectionLight,
              // isDense: true,
              border: textFieldBorder(),
              focusedBorder: textFieldBorder(),
              focusedErrorBorder: textFieldBorder(),
              enabledBorder: textFieldBorder(),
              errorBorder: textFieldBorder(),
            ),
          ),
        ),
      ],
    );
  }

  OutlineInputBorder textFieldBorder() {
    return OutlineInputBorder(
      borderRadius: BorderRadius.circular(16.r),
      borderSide: BorderSide(
        color: Get.isDarkMode
            ? ColorsManager.bgSectionDark
            : ColorsManager.bgSectionLight,
      ),
    );
  }
}
